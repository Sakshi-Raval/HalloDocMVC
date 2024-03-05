using BusinessLogic.IRepository;
using DataAccess.DataContext;
using DataAccess.DataModels;
using Microsoft.AspNetCore.Components.Forms;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.Elfie.Serialization;
using System.Collections;
using System.Configuration;
using System.Net.Mail;


namespace HalloDoc.Controllers
{
    public class AdminController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IAdmin _admin;
        private readonly IPatient _patient;
        private readonly Microsoft.AspNetCore.Hosting.IHostingEnvironment _hostingEnvironment;
        private readonly IEmailService _emailService;
        public AdminController(ApplicationDbContext context, IAdmin admin, IPatient patient, Microsoft.AspNetCore.Hosting.IHostingEnvironment hostingEnvironment, IEmailService emailService)
        {
            _context = context;
            _admin = admin;
            _patient = patient;
            _hostingEnvironment = hostingEnvironment;
            _emailService = emailService;
        }

        public IActionResult AdminPage()
        {
            ViewBag.NewCount = _context.Requests.Where(x => x.Status == 1).Count();
            ViewBag.PendingCount = _context.Requests.Where(x => x.Status == 2).Count();
            ViewBag.ActiveCount = _context.Requests.Where(x => x.Status == 4 || x.Status == 5).Count();
            ViewBag.ConcludeCount = _context.Requests.Where(x => x.Status == 6).Count();
            ViewBag.ToCloseCount = _context.Requests.Where(x => x.Status == 3 || x.Status == 7 || x.Status == 8).Count();
            ViewBag.UnpaidCount = _context.Requests.Where(x => x.Status == 9).Count();
            return View();
        }
        public IActionResult AdminDashboardPartial()
        {
            return PartialView("_AdminDashboardPartial");
        }

        public IActionResult LoadPartialView(string SearchValue, string districtSelect, string selectedFilter, string currentPartialName, int[] currentStatus)
        {
            var newPatientsViewModel = _admin.GetPatients(SearchValue,districtSelect,selectedFilter,currentStatus);
            return PartialView(currentPartialName, newPatientsViewModel);
        }

        public IActionResult ViewCase(int requestid)
        {
            TempData["Requestid"] = requestid;
            var caseViewModel = _admin.ViewCase(requestid);
            return View("ViewCase",caseViewModel);
        }

        public IActionResult ViewNotes(int requestid)
        {
           var notesViewModel = _admin.ViewNotes(requestid);
           return View("ViewNotes",notesViewModel);
        }

        public IActionResult ViewUploads(int requestid)
        {
            var request = _context.Requests.Where(x => x.Requestid == requestid).FirstOrDefault();
            if (request != null)
            {
                var patient = _context.Requestclients.Where(x => x.Requestid == requestid).FirstOrDefault();
                ViewBag.PatientName = string.Concat(patient.Firstname, ' ', patient.Lastname ?? "");
                ViewBag.ConfNum = request.Confirmationnumber;
                ViewBag.Requestid = request.Requestid;
                var viewDocumentsViewModel = _patient.GetDocuments(requestid);
                return View(viewDocumentsViewModel);
            }
            
            return View();
        }

        public IActionResult UploadFile(int requestid)
        {
            var file = Request.Form.Files["files"];
            if(file != null)
            {
                _patient.FileUpload(file, requestid);
            }
            return RedirectToAction("ViewUploads", new { requestid });
        }

        public IActionResult DeleteFile(string filename)
        {
            var filePath = Path.Combine(_hostingEnvironment.WebRootPath, "uploads",filename);
            if (System.IO.File.Exists(filePath)){
                //System.IO.File.Delete(filePath);
                Requestwisefile reqFile = _context.Requestwisefiles.Where(x => x.Filename == filename ).FirstOrDefault();
                if(reqFile != null)
                {
                    bool[] bitValues = { true };
                    BitArray bits = new BitArray(bitValues);
                    reqFile.Isdeleted= bits;
                    _context.Update(reqFile);
                    _context.SaveChanges();
                }
                return Json(new { success = true, message = "File deleted" });
            }
            else
            {
                return Json(new { success = false , message = "File not found" });

            }
        }

        public IActionResult SendDocuments(List<string> files,int requestid)
        {
            List<Attachment> attachments = new();
            //var files =_context.Requestwisefiles.Where(x=>x.Requestid == requestid).ToList();
            if (files != null)
            {
                foreach (var file in files)
                {
                    var filePath = Path.Combine(_hostingEnvironment.WebRootPath, "uploads", file);
                    var attachment = new Attachment(filePath);
                    attachments.Add(attachment);
                }
                var reqClient = _context.Requestclients.Where(x => x.Requestid == requestid).FirstOrDefault();
                var recepientEmail = reqClient != null ? reqClient.Email : "";
                var subject = "Uploaded Documents";
                var body = "PFA uploaded documents";
                _emailService.SendEmailAsync(recepientEmail, subject, body, attachments);
            }
           
            return Ok();
        }

        public IActionResult CancelCase(int requestid,string cancelNotes, string reasons)
        {
            _admin.CancelCase(requestid, cancelNotes, reasons);
            return Ok();
        }

        public IActionResult AssignCase(int regions, int physician, int requestId, string description)
        {
            _admin.AssignCase(regions, physician, requestId, description);
            return Ok();
        }

        public IActionResult BlockCase(int requestID, string blockReason)
        {
            _admin.BlockCase(requestID,blockReason);
            return Ok();
        }

        public List<Casetag> CaseTagResults()
        {
            List<Casetag> results = _context.Casetags.ToList();
            return results;
        }

        public List<Region> RegionResults()
        {
            List<Region> results = _context.Regions.ToList();
            Console.WriteLine(results);
            return results;
        }

        public List<Physician> PhysicianResults(int regionid)
        {
            List<Physician> results = _context.Physicians.Where(x => x.Regionid == regionid).ToList();
            return results;
        }
    }
}
