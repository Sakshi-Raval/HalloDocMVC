using BusinessLogic.IRepository;
using DataAccess.DataContext;
using Microsoft.AspNetCore.Mvc;

namespace HalloDoc.Controllers
{
    public class AdminController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IAdmin _admin;
        public AdminController(ApplicationDbContext context,IAdmin admin) 
        {
            _context = context;
            _admin = admin;
        }
        public IActionResult AdminPage()
        {

            var newPatientsViewModel = _admin.GetNewPatients();
            return View(newPatientsViewModel);
        }
        public IActionResult _AdminDashboardPartial()
        {
           return View();
        }
        
    }
}
