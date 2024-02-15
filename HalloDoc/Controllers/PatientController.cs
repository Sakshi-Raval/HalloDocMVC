using DataAccess.DataContext;
using DataAccess.DataModels;
using DataAccess.ViewModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace HalloDoc.Controllers
{
    public class PatientController : Controller
    {
        private readonly ILogger<PatientController> _logger;
        private readonly ApplicationDbContext _context;

        public PatientController(ILogger<PatientController> logger, ApplicationDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        public IActionResult PatientDashboard()
        {
            var email = HttpContext.Session.GetString("Email");
            var medicalHistoryViewModels = (from req in _context.Requests
                          join reqFile in _context.Requestwisefiles
                          on req.Requestid equals reqFile.Requestid into fileGroup
                          where req.Email ==email 
                          from reqFile in fileGroup.DefaultIfEmpty()
                          //group fileGroup by new {req.Requestid} into g   
                          select new MedicalHistoryViewModel
                          {
                              CreatedDate = req.Createddate.ToString("MMM dd, yyyy"),
                              Status =req.Status,
                              DocumentCount =fileGroup.Count(),
                              requestid = req.Requestid,
                              Name = "Sakshi"
        }).ToList();
 
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
            var viewDocumentsViewModel = (from reqFile in _context.Requestwisefiles
                                          join req in _context.Requests
                                          on reqFile.Requestid equals req.Requestid
                                          where req.Requestid == ReqId
                                          select new ViewDocumentsViewModel
                                          {
                                              Filename = reqFile.Filename,
                                              UploaderName = string.Concat(req.Firstname,' ',req.Lastname),
                                              CreatedDate = reqFile.Createddate.Date.ToString("MMM dd, yyyy"),
                                          }).ToList();
            
            return View(viewDocumentsViewModel);
        }
    }
}
