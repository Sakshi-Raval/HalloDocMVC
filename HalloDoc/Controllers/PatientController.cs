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
                              CreatedDate = req.Createddate.ToString("mm dd, yyyy"),
                              Status =req.Status,
                              DocumentCount =fileGroup.Count(),
                              Name = "Sakshi"

                          }).ToList();
            //var request = _context.Requests
            //    .Join(_context.Users,
            //    request => request.Userid,
            //    user => 



            return View(medicalHistoryViewModels);
        }
    }
}
