using DataAccess.DataContext;
using DataAccess.ViewModel;
using DataAccess.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Net.Http.Headers;
using DataAccess.DataModels;

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
                User user = _context.Users.Where(m => m.Aspnetuserid == status.Id && m.Email ==status.Email).FirstOrDefault();
                if (status == null)
                {
                    TempData["UnsuccessfulLogin"] = "Login Unsuccessful";
                    return RedirectToAction("Login", "Home");
                }
                //TempData["UserName"] = string.Concat(user.Firstname, ' ', user.Lastname);
                //TempData.Keep("UserName");
                if (user != null)
                {
                    if (user.Lastname != null)
                    {
                        var username = string.Concat(user.Firstname, ' ', user.Lastname);
                        //HttpContext.Session.SetString("Username", username);
                        TempData["username"] = username;
                    }
                    else
                    {
                        var username = user.Firstname;
                        //HttpContext.Session.SetString("Username", username);
                        TempData["username"] = username;

                    }

                }
              
                TempData["Login"] = "Login Successful";
                HttpContext.Session.SetString("Aspnetuserid", status.Id);
                HttpContext.Session.SetString("Email", status.Email);
                ViewBag.Email=status.Email;
                return RedirectToAction("PatientDashboard", "Patient");
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

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
