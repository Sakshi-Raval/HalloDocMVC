using BusinessLogic.IRepository;
using DataAccess.DataContext;
using DataAccess.ViewModel;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Build.Framework;
using Microsoft.EntityFrameworkCore;

namespace HalloDoc.Controllers
{
    public class LoginController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IEmailService _emailService;
        private readonly IJwtService _jwtService;

        public LoginController(ApplicationDbContext context, IEmailService emailService,IJwtService jwtService) { 
            _context = context;
            _emailService = emailService;
            _jwtService = jwtService;
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
                    return RedirectToAction("Login", "Login");
                }
                //TempData["UserName"] = string.Concat(user.Firstname, ' ', user.Lastname);
                //TempData.Keep("UserName");
                var jwtToken = _jwtService.GenerateToken(status);
                Response.Cookies.Append("jwt", jwtToken);
                var user = _context.Users.Where(m => m.Aspnetuserid == status.Id && m.Email == status.Email).FirstOrDefault();
                var userRoles = _context.Aspnetuserroles.Where(m => m.Userid == status.Id).FirstOrDefault();
                var role = _context.Aspnetroles.Where(m => m.Id == userRoles.Roleid).FirstOrDefault();
                TempData["Login"] = "Login Successful";
                HttpContext.Session.SetString("Aspnetuserid", status.Id);
                HttpContext.Session.SetString("Email", status.Email);
                HttpContext.Session.SetString("Role", role.Name);
                ViewBag.Email = status.Email;

                return RedirectToAction("PatientDashboard", "Patient");
            }
            return View();

        }
        [HttpGet]
        public IActionResult ForgotPassword()
        {

            return View();
        }
        [HttpPost]
        public IActionResult ForgotPasswordAsync(ForgotPwdViewModel model)
        {
            if (ModelState.IsValid)
            {
                string token = Guid.NewGuid().ToString();
                DateTime expiryTime = DateTime.UtcNow.AddHours(24);

                string link = Url.Action("Login", "Login", new { token = token }, Request.Scheme);

                link += $"?expiryTime={expiryTime}";
                string subject = "Reset Password";
                _emailService.SendEmailAsync(model.email, subject, $"Here is the link to reset password. Link expires in 1 hour. {link}");
            }
            return View();
        }
        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            Response.Cookies.Delete("jwt");
            return RedirectToAction("Login", "Login");
        }
        


    }
}
