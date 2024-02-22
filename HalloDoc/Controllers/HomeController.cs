using DataAccess.DataContext;
using DataAccess.ViewModel;
using DataAccess.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Net.Http.Headers;
using DataAccess.DataModels;
using BusinessLogic.IRepository;
using System.Web.Helpers;

namespace HalloDoc.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly ApplicationDbContext _context;
        private readonly IEmailService _emailService;

        public HomeController(ILogger<HomeController> logger, ApplicationDbContext context, IEmailService emailService)
        {
            _logger = logger;
            _context = context; 
            _emailService = emailService;
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
                    TempData["UnsuccessfulLogin"] = "Login Unsuccessful";
                    return RedirectToAction("Login", "Home");
                }
                //TempData["UserName"] = string.Concat(user.Firstname, ' ', user.Lastname);
                //TempData.Keep("UserName");
                var user = _context.Users.Where(m => m.Aspnetuserid == status.Id && m.Email == status.Email).FirstOrDefault();
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
        [HttpGet]
        public IActionResult ForgotPassword()
        {

            return View();
        }

        [HttpPost]
        public async Task<IActionResult> ForgotPasswordAsync(ForgotPwdViewModel model)
        {
            if (ModelState.IsValid)
            {
                string token = Guid.NewGuid().ToString();
                DateTime expiryTime = DateTime.UtcNow.AddHours(24);

                string link = Url.Action("Login", "Home", new { token = token }, Request.Scheme);

                link += $"?expiryTime={expiryTime}";
                string subject = "Reset Password";
                await _emailService.SendEmailAsync(model.email, subject, $"Here is the link to reset password. Link expires in 1 hour. {link}");
            }
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
