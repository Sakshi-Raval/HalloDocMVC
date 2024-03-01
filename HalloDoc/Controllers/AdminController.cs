using BusinessLogic.IRepository;
using DataAccess.DataContext;
using DataAccess.DataModels;
using Microsoft.AspNetCore.Mvc;

namespace HalloDoc.Controllers
{
    public class AdminController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IAdmin _admin;
        public AdminController(ApplicationDbContext context, IAdmin admin)
        {
            _context = context;
            _admin = admin;
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
