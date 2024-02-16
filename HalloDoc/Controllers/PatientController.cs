using DataAccess.DataContext;
using DataAccess.DataModels;
using DataAccess.ViewModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Hosting;
using BusinessLogic.IRepository;
using Microsoft.AspNetCore.Hosting;
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
            return View(medicalHistoryViewModels);
        }
        public IActionResult _ViewDocumentsPartial()
        {
            var requestid = Request.Query["f"];
            var ReqId = int.Parse(requestid);
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
        //public IActionResult 

    }
}
