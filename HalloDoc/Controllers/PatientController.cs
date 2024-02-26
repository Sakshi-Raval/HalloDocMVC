using DataAccess.DataContext;
using DataAccess.DataModels;
using DataAccess.ViewModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Hosting;
using BusinessLogic.IRepository;
using Microsoft.AspNetCore.Hosting;
using System.Web.Helpers;
using System.Web.Razor.Generator;

namespace HalloDoc.Controllers
{
    public class PatientController : Controller
    {
        private readonly ILogger<PatientController> _logger;
        private readonly ApplicationDbContext _context;
        private readonly IPatient _patient;
        private readonly Microsoft.AspNetCore.Hosting.IHostingEnvironment _hostingEnvironment;

        public PatientController(ILogger<PatientController> logger, ApplicationDbContext context, Microsoft.AspNetCore.Hosting.IHostingEnvironment hostingEnvironment, IPatient patient)
        {
            _logger = logger;
            _context = context;
            _hostingEnvironment = hostingEnvironment;
            _patient = patient;
        }

        public IActionResult PatientDashboard()
        {
           
            var email = HttpContext.Session.GetString("Email");
            var medicalHistoryViewModels = _patient.GetRequestRecords(email);
            var userModel = _context.Users.Where(u=>u.Email == email).FirstOrDefault();
            if (userModel != null)
            {
                if (userModel.Lastname != null)
                {
                    var username = string.Concat(userModel.Firstname, ' ', userModel.Lastname);
                    //HttpContext.Session.SetString("Username", username);
                    HttpContext.Session.SetString("username", username);
                }
                else
                {
                    var username = userModel.Firstname;
                    //HttpContext.Session.SetString("Username", username);
                    HttpContext.Session.SetString("username", username);

                }

            }
            TempData["username"]=HttpContext.Session.GetString("username");
            ViewBag.userModel = userModel;
            return View(medicalHistoryViewModels);
        }
        public IActionResult _ViewDocumentsPartial()
        {
            var requestid = Request.Query["f"];
            var ReqId = int.Parse(requestid);
            ViewBag.requestid = ReqId;
            var email = HttpContext.Session.GetString("Email");
            Request patName = _context.Requests.Where(x => x.Requestid == ReqId).FirstOrDefault();
            ViewBag.PatientName = string.Concat(patName.Firstname,' ',patName.Lastname);
            ViewBag.ConfNum = patName.Confirmationnumber;

            var viewDocumentsViewModel = _patient.GetDocuments(ReqId);
            return View(viewDocumentsViewModel);
        }
        [HttpPost]
        public IActionResult DownloadFile(string filename)
        {
            var filePath = Path.Combine(_hostingEnvironment.WebRootPath, "uploads", filename);
            if (System.IO.File.Exists(filePath))
            {
                byte[] fileBytes = System.IO.File.ReadAllBytes(filePath);
                var contentDisposition = new System.Net.Mime.ContentDisposition
                {
                    FileName = filename,
                    Inline = true
                };
                Response.Headers.Add("Content-Disposition", contentDisposition.ToString());
                return File(fileBytes, System.Net.Mime.MediaTypeNames.Application.Octet);
            }
            else
            {
                return NotFound();
            }
        }
        public IActionResult _ProfilePartial(UserProfileViewModel model)
        {
            var email = HttpContext.Session.GetString("Email");
            if (ModelState.IsValid)
            {
                var userModel = _patient.UpdateUser(model, email);
                ViewBag.userModel = userModel;
                TempData["UpdateMsg"] = "Updated successfully";
                return View();
            }
            return View();
        }

        [HttpGet]
        public IActionResult CreateRequestMe()
            {
            var email = HttpContext.Session.GetString("Email");
            var userModel = _context.Users.Where(u => u.Email == email).FirstOrDefault();
            ViewBag.userModel = userModel;

            return View();
        }    
        [HttpPost]
        public IActionResult CreateRequestMe(PatientRequestViewModel model)
            {
            var email = HttpContext.Session.GetString("Email");
            var userModel = _context.Users.Where(u => u.Email == email).FirstOrDefault();
            ViewBag.userModel = userModel;
            if (ModelState.IsValid)
            {
                _patient.SubmitReqMe(model, ViewBag.userModel.Userid);
                return RedirectToAction("CreateRequestMe","Patient");
            }
            return View();
        }
        [HttpGet]
        public IActionResult CreateRequestElse()
        {

            var email = HttpContext.Session.GetString("Email");
            var userModel = _context.Users.Where(u => u.Email == email).FirstOrDefault();
            ViewBag.userModel = userModel;
            return View();
        }
        [HttpPost]
        public IActionResult CreateRequestElse(PatientRequestViewModel model)
        {

            var email = HttpContext.Session.GetString("Email");
            var userModel = _context.Users.Where(u => u.Email == email).FirstOrDefault();
            if (userModel != null)
            {
                ViewBag.userModel = userModel;
                if (ModelState.IsValid)
                {
                    Console.WriteLine("eutryuiwsdjf");
                    _patient.SubmitReqElse(model, userModel);
                    return RedirectToAction("CreateRequestElse", "Patient");
                }
            }
            ViewBag.userModel = null;
            return View();
        }
        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Login", "Home");
        }

        [HttpPost]
        public IActionResult UploadFiles(int requestId)
        {
            var file = Request.Form.Files["files"];

            _patient.FileUpload(file, requestId);
            return RedirectToAction("PatientDashboard", "Patient");
        }
    }
}
