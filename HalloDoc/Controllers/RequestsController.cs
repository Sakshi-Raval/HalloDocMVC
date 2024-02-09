using DataAccess.DataContext;
using DataAccess.DataModels;
using DataAccess.ViewModel;
using Microsoft.AspNetCore.Mvc;
using System.Collections;
using System.Web.Helpers;

namespace HalloDoc.Controllers
{
    public class RequestsController : Controller
    {
        //private Aspnetuser _aspnetuser;
        //private User _user;
        //private Request _request;
        //private Requestclient _requestclient;
        private readonly ApplicationDbContext _context;
        public RequestsController(ApplicationDbContext context/*, Aspnetuser aspnetuser, User user, Request request, Requestclient requestclient*/)
        {
            _context=context;
            //_aspnetuser = aspnetuser;
            //_user = user;
            //_request = request;
            //_requestclient = requestclient;
        }
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult PatientRequest()
        {
            return View();
        }

        [HttpPost]
        [AutoValidateAntiforgeryToken]
        public async Task<IActionResult> PatientRequest([Bind("Symptoms", "ConfirmPassword", "Password", "Firstname", "Lastname", "DOB", "Email","Phone","Street","City","State","Zip","RoomNum","File")] PatientRequestViewModel model)
        {
            User status = _context.Users.Where(x => x.Email == model.Email).FirstOrDefault();
           
            Aspnetuser aspnetuser = new();
            User user = new User();
            Request request = new();
            Requestclient requestclient = new();
            if (status == null) {

                TempData["record"] = "NotPresent";
                Guid id = Guid.NewGuid();
                aspnetuser.Id = id.ToString();
                aspnetuser.Username = model.Email;
                aspnetuser.Email = model.Email;
                aspnetuser.Phonenumber = model.Phone;
                aspnetuser.Createddate = DateTime.Now;
                _context.Add(aspnetuser);
                await _context.SaveChangesAsync();

                
                user.Aspnetuserid = aspnetuser.Id;
                user.Firstname = model.Firstname;
                user.Lastname = model.Lastname;
                user.Email = model.Email;
                user.Mobile = model.Phone;
                user.Street = model.Street;
                user.City = model.City;
                user.State = model.State;
                user.Zipcode = model.Zip;
                //user.Strmonth = model.DOB.ToDateTime;
                //user.Intyear = new DateTime(model.DOB.Year, model.DOB.Month, model.DOB.Day).Year;
                user.Createdby = "xyz";
                user.Createddate = DateTime.Now;
                user.Status = 1;
                user.Isdeleted = false;
                user.Isrequestwithemail = true;
                _context.Add(user);
                await _context.SaveChangesAsync();

                request.Requesttypeid = 1;
                request.Userid = user.Userid;
                request.Firstname = model.Firstname;
                request.Lastname = model.Lastname;
                request.Phonenumber = model.Phone;
                request.Email = model.Email;
                request.Status = 1;
                request.Createddate = DateTime.Now;
                _context.Add(request);
                await _context.SaveChangesAsync();

                requestclient.Requestid = request.Requestid;
                requestclient.Notes = model.Symptoms;
                requestclient.Firstname = model.Firstname;
                requestclient.Lastname = model.Lastname;
                requestclient.Phonenumber = model.Phone;
                requestclient.Email = model.Email;
                requestclient.Street = model.Street;
                requestclient.State = model.State;
                requestclient.City = model.City;
                requestclient.Zipcode = model.Zip;
                _context.Add(requestclient);
                await _context.SaveChangesAsync();

            }
            else
            {
                TempData["record"] = "Present";
                //var netuser = _context.Aspnetusers.Where(x => x.Id == status.Aspnetuserid).FirstOrDefault();
                request.Requesttypeid = 1;
                request.Userid = status.Userid;
                request.Firstname = status.Firstname;
                request.Lastname = status.Lastname;
                request.Phonenumber = status.Mobile;
                request.Email = status.Email;
                request.Status = 1;
                request.Createddate = DateTime.Now;
                _context.Add(request);
                await _context.SaveChangesAsync();

                requestclient.Requestid = request.Requestid;
                requestclient.Notes = model.Symptoms;
                requestclient.Firstname = status.Firstname;
                requestclient.Lastname = status.Lastname;
                requestclient.Phonenumber = status.Mobile;
                requestclient.Email = status.Email;
                requestclient.Street = status.Street;
                requestclient.State = status.State;
                requestclient.City = status.City;
                requestclient.Zipcode = status.Zipcode;
                _context.Add(requestclient);
                await _context.SaveChangesAsync();
            }
           
            

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
    }
}
