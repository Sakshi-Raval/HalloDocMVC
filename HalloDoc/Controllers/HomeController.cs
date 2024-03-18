using DataAccess.DataContext;
using DataAccess.ViewModel;
using DataAccess.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Net.Http.Headers;
using DataAccess.DataModels;
using BusinessLogic.IRepository;
using System.Web.Helpers;
using Microsoft.AspNetCore.Mvc.Filters;
using System.Security.Claims;

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

        
        public IActionResult SubmitReq()
        {
            return View();
        }
        public IActionResult AccessDenied()
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
