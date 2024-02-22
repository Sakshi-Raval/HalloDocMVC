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
        public IActionResult NewStatePartial(int state)
        {
            //new
            if (state == 1)
            {
                var newPatientsViewModel = _admin.GetPatients(1);
                return PartialView("_NewStatePartial", newPatientsViewModel);
            }
            //pending
            else if (state == 2)
            {
                var newPatientsViewModel = _admin.GetPatients(2);
                return PartialView("_NewStatePartial", newPatientsViewModel);
            }
            //active
            else if (state == 3)
            {
                var newPatientsViewModel = _admin.GetPatients(2);
                return PartialView("_NewStatePartial", newPatientsViewModel);
            }
            //conclude
            else if (state == 4)
            {
                var newPatientsViewModel = _admin.GetPatients(2);
                return PartialView("_NewStatePartial", newPatientsViewModel);
            }
            //to close
            else if (state == 5)
            {
                var newPatientsViewModel = _admin.GetPatients(2);
                return PartialView("_NewStatePartial", newPatientsViewModel);
            }
            //unpaid
            else
            {
                var newPatientsViewModel = _admin.GetPatients(2);
                return PartialView("_NewStatePartial", newPatientsViewModel);
            }


        }
    }
}
