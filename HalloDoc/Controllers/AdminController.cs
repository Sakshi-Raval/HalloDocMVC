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

            return View();
        }
        public IActionResult AdminDashboardPartial()
        {
            return PartialView("_AdminDashboardPartial");
        }
        public IActionResult NewStatePartial(string SearchValue, string districtSelect, string selectedFilter)
        {
                var newPatientsViewModel = _admin.GetPatients(SearchValue,districtSelect,selectedFilter);
                newPatientsViewModel = newPatientsViewModel.Where(x => x.Status == 1).ToList();
                
                return PartialView("_NewStatePartial", newPatientsViewModel);
        }
        public IActionResult PendingStatePartial(string SearchValue, string districtSelect , string selectedFilter)
        {
            var newPatientsViewModel = _admin.GetPatients(SearchValue,districtSelect, selectedFilter);
            newPatientsViewModel = newPatientsViewModel.Where(x => x.Status == 2).ToList();

            return PartialView("_PendingStatePartial", newPatientsViewModel);
        }
    }
}
