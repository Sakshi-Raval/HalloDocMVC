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
            //int[] status = { 1 };
            var newPatientsViewModel = _admin.GetPatients(SearchValue,districtSelect,selectedFilter,currentStatus);
            return PartialView(currentPartialName, newPatientsViewModel);
        }
        //public IActionResult PendingStatePartial(string SearchValue, string districtSelect , string selectedFilter)
        //{
        //    int[] status = { 2 };
        //    var newPatientsViewModel = _admin.GetPatients(SearchValue,districtSelect, selectedFilter, status);
        //    return PartialView("_PendingStatePartial", newPatientsViewModel);
        //}
        public IActionResult ViewCasePartial(int requestid)
        {
            var caseViewModel = _admin.ViewCase(requestid);
            return PartialView("_ViewCasePartial",caseViewModel);
        }
        public IActionResult ViewNotesPartial(int requestid)
        {
           var notesViewModel = _admin.ViewNotes(requestid);
            return PartialView("_ViewNotesPartial",notesViewModel);
        }
        public IActionResult CancelCase()
        {

            return View();
        }
    }
}
