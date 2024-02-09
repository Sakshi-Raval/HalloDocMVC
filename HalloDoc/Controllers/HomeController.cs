using DataAccess.DataContext;
using DataAccess.ViewModel;
using DataAccess.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Net.Http.Headers;
namespace HalloDoc.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly ApplicationDbContext _context;

        public HomeController(ILogger<HomeController> logger, ApplicationDbContext context)
        {
            _logger = logger;
            _context = context; 
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [AutoValidateAntiforgeryToken]
        public async Task<IActionResult> Login(string Username, string? Passwordhash, [Bind("Username", "Passwordhash")] AspnetuserViewModel aspnetuserDTO)
        {
            if (ModelState.IsValid)
            {
                if (_context.Aspnetusers == null)
                {
                    return Problem("Entity set 'ApplicationDbContext.Aspnetusers'  is null.");
                }
                var status = _context.Aspnetusers.Where(m => m.Username == aspnetuserDTO.Username && m.Passwordhash == aspnetuserDTO.Passwordhash).FirstOrDefault();
                if (status == null)
                {
                    return RedirectToAction("Login", "Home");
                }
                return RedirectToAction("SubmitReq", "Home");
            }
            return View();
           
        }

        public IActionResult SubmitReq()
        {
            return View();
        }
        public IActionResult ForgotPassword()
        {
            return View();
        }
        public IActionResult PatientRequest()
        {
            return View();
        }
        public IActionResult FamilyRequest()
        {
            return View();
        }
        public IActionResult ConciergeRequest()
        {
            return View();
        }
        public IActionResult BusinessRequest()
        {
            return View();
        }
        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
