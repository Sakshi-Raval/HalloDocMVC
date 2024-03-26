using BusinessLogic.IRepository;
using DataAccess.DataContext;
using DataAccess.DataModels;
using DataAccess.ViewModel;
using Microsoft.AspNetCore.Identity;
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
        private readonly IPatient _patient;
        public LoginController(ApplicationDbContext context, IEmailService emailService,IJwtService jwtService,IPatient patient) { 
            _context = context;
            _emailService = emailService;
            _jwtService = jwtService;
            _patient = patient;
        }
        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [AutoValidateAntiforgeryToken]
        public async Task<IActionResult> Login( [Bind("Username", "Passwordhash")] AspnetuserViewModel aspnetuserDTO)
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
                var userRoles = _context.Aspnetuserroles.Where(m => m.Userid == status.Id).FirstOrDefault();
                var role = _context.Aspnetroles.Where(m => m.Id == userRoles.Roleid).FirstOrDefault();
                HttpContext.Session.SetString("Aspnetuserid", status.Id);
                HttpContext.Session.SetString("Email", status.Email);
                HttpContext.Session.SetString("Role", role.Name);
                ViewBag.Email = status.Email;
                
                var jwtToken = _jwtService.GenerateToken(status);
                Response.Cookies.Append("jwt", jwtToken);
                TempData["message"] = "Login Successful";
                if(role.Name=="Patient")
                {
                    var user = _context.Users.Where(m => m.Aspnetuserid == status.Id && m.Email == status.Email).FirstOrDefault();
                    if (user != null)
                    {
                        if (user.Lastname != null)
                        {
                            var username = string.Concat(user.Firstname, ' ', user.Lastname);
                            //HttpContext.Session.SetString("Username", username);
                            HttpContext.Session.SetString("username", username);
                        }
                        else
                        {
                            var username = user.Firstname;
                            //HttpContext.Session.SetString("Username", username);
                            HttpContext.Session.SetString("username", username);

                        }

                    }
                    TempData["username"] = HttpContext.Session.GetString("username");
                    return RedirectToAction("PatientDashboard", "Patient");

                }
                else if (role.Name == "Admin")
                {
                    Admin admin = _context.Admins.FirstOrDefault(x => x.Email == status.Email);
                    if (admin != null)
                    {
                        if (admin.Lastname != null)
                        {
                            var username = string.Concat(admin.Firstname, ' ', admin.Lastname);
                            //HttpContext.Session.SetString("Username", username);
                            HttpContext.Session.SetString("username", username);
                        }
                        else
                        {
                            var username = admin.Firstname;
                            //HttpContext.Session.SetString("Username", username);
                            HttpContext.Session.SetString("username", username);

                        }

                    }
                    TempData["username"] = HttpContext.Session.GetString("username");
                    return RedirectToAction("AdminPage", "Admin");

                }
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
            return Ok();
            //return RedirectToAction("Login", "Login");
        }

        [HttpGet]
        public IActionResult CreateAccount(string token,string requestid,DateTime expiryTime,string email)
        {
            if(DateTime.UtcNow > expiryTime)
            {
                string htmlContent = "<html><body><h1>Link Expired</h1></body></html>";
                return new ContentResult
                {
                    Content = htmlContent,
                    ContentType = "text/html"
                };
            }
            if (_patient.CheckEmail(email))
            {
                string htmlTags = "<html><body><h1>Account already Exists!</h1></body></html>";
                return new ContentResult
                {
                    Content = htmlTags,
                    ContentType = "text/html"
                };
            }
            ViewBag.Requestid = requestid;
            ViewBag.Email = email;
            return View();
        }

        [HttpPost]
        public IActionResult CreateAccount(string email, string passwordCreateAcc, string requestId)
        {
            Request request = _context.Requests.FirstOrDefault(x => x.Requestid == int.Parse(requestId));
            Requestclient requestclient= _context.Requestclients.FirstOrDefault(x => x.Requestid == int.Parse(requestId));
            if (request != null && requestclient!=null)
            {
                Aspnetuser aspnetuser = new();
                Guid guid = Guid.NewGuid(); 
                aspnetuser.Id = guid.ToString();
                aspnetuser.Email = email;
                aspnetuser.Username = email;
                aspnetuser.Passwordhash = passwordCreateAcc;
                aspnetuser.Phonenumber = requestclient.Phonenumber;
                aspnetuser.Createddate = DateTime.Now;
                _context.Add(aspnetuser);
                _context.SaveChanges();

                Aspnetuserrole aspnetuserrole = new();
                aspnetuserrole.Userid = aspnetuser.Id;
                aspnetuserrole.Roleid = _context.Aspnetroles.Where(x => x.Name == "Patient").Select(x=>x.Id).FirstOrDefault().ToString()??"2";
                _context.Add(aspnetuserrole);
                _context.SaveChanges();

                User user = new();
                user.Aspnetuserid = aspnetuser.Id;
                user.Firstname = requestclient.Firstname;
                user.Lastname = requestclient.Lastname;
                user.Email = email;
                user.Mobile = requestclient.Phonenumber;
                user.Street = requestclient.Street;
                user.State = requestclient.State;
                user.City = requestclient.City;
                user.Regionid = requestclient.Regionid;
                user.Zipcode = requestclient.Zipcode;
                user.Strmonth = requestclient.Strmonth;
                user.Intdate = requestclient.Intdate;
                user.Intyear = requestclient.Intyear;
                user.Createdby = aspnetuser.Id;
                _context.Add(user);
                _context.SaveChanges();

                request.Userid = user.Userid;
                _context.Update(request);
                _context.SaveChanges();

                TempData["message"] = "Account Created Successfully";

                return RedirectToAction("CreateAccount");

            }
            return View();
        }

    }
}
