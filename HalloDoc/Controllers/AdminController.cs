using BusinessLogic.IRepository;
using BusinessLogic.Repository;
using DataAccess.DataContext;
using DataAccess.DataModels;
using DataAccess.ViewModel;
using Microsoft.AspNetCore.Components.Forms;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Routing;
using Microsoft.CodeAnalysis.Elfie.Serialization;
using Rotativa.AspNetCore;
using System.Collections;
using System.Configuration;
using System.Drawing.Printing;
using System.Net.Mail;
using System.Reflection.Metadata.Ecma335;
using System.Web.Helpers;

namespace HalloDoc.Controllers
{

    [CustomAuthorize("1")]
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
            return View();
        }
        public IActionResult AdminDashboardPartial()
        {
            ViewBag.NewCount = _context.Requests.Where(x => x.Status == 1).Count();
            ViewBag.PendingCount = _context.Requests.Where(x => x.Status == 2).Count();
            ViewBag.ActiveCount = _context.Requests.Where(x => x.Status == 4 || x.Status == 5).Count();
            ViewBag.ConcludeCount = _context.Requests.Where(x => x.Status == 6).Count();
            ViewBag.ToCloseCount = _context.Requests.Where(x => x.Status == 3 || x.Status == 7 || x.Status == 8).Count();
            ViewBag.UnpaidCount = _context.Requests.Where(x => x.Status == 9).Count();
            return PartialView("_AdminDashboardPartial");
        }

        public IActionResult MyProfileAdminPartial()
        {
            var email = HttpContext.Session.GetString("Email");
            var adminProfileViewModel = _admin.GetAdminProfile(email ?? "");
            //ViewBag.AdminProfile = adminProfileViewModel;
            return PartialView("_MyProfileAdminPartial",adminProfileViewModel);
        }


        public IActionResult ResetAdminPassword(string adminPassword)
        {
            var email = HttpContext.Session.GetString("Email");
            if (email != null)
            {
                Aspnetuser aspnetuser = _context.Aspnetusers.FirstOrDefault(x => x.Email == email);
                if (aspnetuser != null)
                {
                    aspnetuser.Passwordhash = adminPassword;
                    _context.Update(aspnetuser);
                    _context.SaveChanges();
                    TempData["message"] = "Reset Password Successful";
                }
                //var adminProfileViewModel = _admin.GetAdminProfile(email);
                //return PartialView("_MyProfileAdminPartial", adminProfileViewModel);
                return RedirectToAction("MyProfileAdminPartial");
            }
            return NotFound();
        }

        public IActionResult EditAdministrativeInfo(string firstname, string lastname, string email, string phoneAdministrator, List<int> adminRegions)
        {
            var oldEmail = HttpContext.Session.GetString("Email");
            if (oldEmail != null)
            {
                _admin.EditAdminDetails(oldEmail, firstname, lastname, email, phoneAdministrator, adminRegions);
                HttpContext.Session.SetString("Email", email);
                var username = string.Concat(firstname, ' ', lastname??"");
                HttpContext.Session.SetString("username", username);
                TempData["username"] = HttpContext.Session.GetString("username");
                TempData["message"] = "Administrative information edited successfully";
                return RedirectToAction("MyProfileAdminPartial");
            }
            return NotFound();
        }
        public IActionResult EditBillingInfo(string address1, string address2, string city, int state, string zip, string phoneBilling)
        {
            var email = HttpContext.Session.GetString("Email");
            if (email != null)
            {
                _admin.EditBillingDetails(email, address1, address2, city, state, zip, phoneBilling);
                TempData["message"] = "Mailing and Billing Information edited successfully";
                return RedirectToAction("MyProfileAdminPartial");

            }
            return NotFound();
        }

        public IActionResult LoadPartialView(string SearchValue, string districtSelect, string selectedFilter, string currentPartialName, int[] currentStatus, int pagesize = 2, int currentpage = 1)
        {
            var newPatientsViewModel = _admin.GetPatients(SearchValue, districtSelect, selectedFilter, currentStatus);
            int totalItems = newPatientsViewModel.Count();
            int totalPages = (int)Math.Ceiling((double)totalItems / pagesize);
            if (SearchValue != null || districtSelect != null || selectedFilter != null)
            {
                currentpage = 1;
            }
            var paginatedData = newPatientsViewModel.Skip((currentpage - 1) * pagesize).Take(pagesize).ToList();
            ViewBag.Count = totalItems;
            ViewBag.CurrentPage = currentpage;
            ViewBag.TotalPages = totalPages;
            return PartialView(currentPartialName, paginatedData);
        }

        public IActionResult ViewCase(int requestid)
        {
            TempData["Requestid"] = requestid;
            var caseViewModel = _admin.ViewCase(requestid);
            return View("ViewCase", caseViewModel);
        }

        public IActionResult ViewNotes(int requestid)
        {
            var notesViewModel = _admin.ViewNotes(requestid);
            ViewBag.requestid = requestid;
            return View("ViewNotes", notesViewModel);
        }

        public IActionResult AdditionalNotes(int requestid, string additionalNotes)
        {
            Requestnote requestnote = new Requestnote();
            requestnote.Requestid = requestid;
            requestnote.Adminnotes = additionalNotes;
            requestnote.Createdby = "admin"; //change into admin name
            requestnote.Createddate = DateTime.Now;
            _context.Add(requestnote);
            _context.SaveChanges();
            return Ok();
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
            if (file != null)
            {
                _patient.FileUpload(file, requestid);
            }
            return RedirectToAction("ViewUploads", new { requestid });
        }

        public IActionResult DeleteFile(string filename)
        {
            var filePath = Path.Combine(_hostingEnvironment.WebRootPath, "uploads", filename);
            if (System.IO.File.Exists(filePath))
            {
                //System.IO.File.Delete(filePath);
                Requestwisefile reqFile = _context.Requestwisefiles.Where(x => x.Filename == filename).FirstOrDefault();
                if (reqFile != null)
                {
                    bool[] bitValues = { true };
                    BitArray bits = new BitArray(bitValues);
                    reqFile.Isdeleted = bits;
                    _context.Update(reqFile);
                    _context.SaveChanges();
                }
                return Json(new { success = true, message = "File deleted" });
            }
            else
            {
                return Json(new { success = false, message = "File not found" });

            }
        }

        public IActionResult SendDocuments(List<string> files, int requestid)
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

        public IActionResult CancelCase(int requestid, string cancelNotes, string reasons)
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
            _admin.BlockCase(requestID, blockReason);
            return Ok();
        }

        public IActionResult TransferCase(int regions, int physician, int RequestID, string desc)
        {
            _admin.TransferCase(regions, physician, RequestID, desc);
            return Ok();
        }
        public IActionResult ClearCase(int Requestid)
        {
            _admin.ClearCase(Requestid);
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


        public List<Healthprofessionaltype> ProfessionResults()
        {
            return _context.Healthprofessionaltypes.ToList(); ;
        }

        public List<Healthprofessional> BusinessResults(int professionid)
        {
            return _context.Healthprofessionals.Where(x => x.Profession == professionid).ToList(); ;
        }

        public JsonResult CheckSession()
        {
            var request = HttpContext.Request;
            var token = request.Cookies["jwt"];

            if (string.IsNullOrEmpty(token))
            {
                return Json(new { sessionExists = false });
            }
            else
            {
                return Json(new { sessionExists = true });
            }
        }

        [HttpGet]
        public IActionResult SendOrder(int requestId)
        {
            ViewBag.RequestId = requestId;
            return View();
        }

        [HttpPost]
        public IActionResult SendOrder(SendOrderViewModel model)
        {
            if (ModelState.IsValid)
            {
                _admin.SendOrderDetails(model);
            }
            return RedirectToAction("SendOrder");
        }
        public SendOrderViewModel SendOrderViewModel(int healthProfessionalId)
        {

            var healthProfessional = _context.Healthprofessionals.Where(x => x.Vendorid == healthProfessionalId).FirstOrDefault();
            if (healthProfessional != null)
            {
                SendOrderViewModel viewModel = new();
                viewModel.FaxNumber = healthProfessional.Faxnumber;
                viewModel.Email = healthProfessional.Email;
                viewModel.BusinessContact = healthProfessional.Businesscontact;
                return viewModel;

            }
            return new SendOrderViewModel();
        }

        public IActionResult ReviewAgreement(int id)
        {
            ViewBag.Id = id;
            var patient = _context.Requestclients.Where(x => x.Requestid == id).FirstOrDefault();
            ViewBag.Name = patient.Firstname + " " + patient.Lastname ?? "";
            return View();
        }

        public IActionResult Agreed(int id)
        {
            _admin.Agreed(id);
            //return RedirectToAction("ReviewAgreement","Admin", new {id = id});
            return Ok();

        }

        public IActionResult SendAgreementEmail(int RequestId, string phone, string email)
        {
            var subject = "Review Agreement";
            var url = Url.Action("ReviewAgreement", "Admin", new { id = RequestId }, Request.Scheme);
            var body = $"Click on the link below to review agreement. {url}";
            _emailService.SendEmailAsync(email, subject, body);
            return Ok();
        }

        public IActionResult CancelCaseByPatient(int requestid, string cancelNotes)
        {
            _admin.CancelCaseByPatient(requestid, cancelNotes);
            return RedirectToAction("ReviewAgreement", "Admin", new { id = requestid });
        }

        [HttpGet]
        public IActionResult EncounterForm(int requestid)
        {
            var encounterForm = _admin.DisplayEncounterForm(requestid);
            if (encounterForm == null)
            {
                return View();
            }

            return View("EncounterForm", encounterForm);

        }


        [HttpPost]
        public IActionResult EncounterForm(EncounterFormViewModel encFormModel)
        {
            _admin.SaveEncounterForm(encFormModel);
            return RedirectToAction("EncounterForm", "Admin", new { requestid = encFormModel.Requestid });
        }
        public IActionResult Finalize(int requestid)
        {
            var encounterForm = _context.EncounterForms.Where(x => x.Requestid == requestid).FirstOrDefault();
            encounterForm.IsFinalize = true;
            _context.Update(encounterForm);
            _context.SaveChanges();
            return Ok();
        }

        public IActionResult CloseCase(int requestid)
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

        public Requestclient RequestedClient(int requestid)
        {
            Requestclient requestclient = _context.Requestclients.Where(x => x.Requestid == requestid).FirstOrDefault();
            return requestclient;
        }

        public IActionResult SaveChangesCloseCase(int requestid, string email, string phone)
        {
            Requestclient requestclient = _context.Requestclients.Where(x => x.Requestid == requestid).FirstOrDefault();
            requestclient.Email = email;
            requestclient.Phonenumber = phone;
            _context.Update(requestclient);
            _context.SaveChanges();
            return Json(new { success = true });
        }
        public IActionResult CloseCaseInstance(int requestid)
        {
            _admin.CloseCase(requestid);
            return RedirectToAction("AdminPage", "Admin");
        }

        public IActionResult EncounterFormDetails(int requestid)
        {
            var encounterForm = _admin.DisplayEncounterForm(requestid);
            return View(encounterForm);
        }


        public IActionResult GeneratePDF(int ReqId)
        {

            var viewEncounterForm = _admin.DisplayEncounterForm(ReqId);

            if (viewEncounterForm == null)
            {
                return NotFound();
            }

            //return View("EncounterFormDetails", encounterFormView);
            return new ViewAsPdf("EncounterFormDetails", viewEncounterForm)
            {
                FileName = "Encounter_Form.pdf"
            };

        }


    }
}
