using BusinessLogic.IRepository;
using DataAccess.DataContext;
using DataAccess.DataModels;
using DataAccess.ViewModel;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Collections;
using System.Security.Policy;

namespace BusinessLogic.Repository
{
    public class OtherRequestRepo : IOtherRequest
    {
        private readonly ApplicationDbContext _context;
        private readonly IHostingEnvironment _hostingEnvironment;
        private readonly IPatient _patient;
        private readonly IEmailService _emailService;
        private readonly IUrlHelper _urlHelper;
        public OtherRequestRepo(ApplicationDbContext context, IHostingEnvironment hostingEnvironment, IPatient patient, IEmailService emailService)
        {
            _context = context;
            _hostingEnvironment = hostingEnvironment;
            _patient = patient;
            _emailService = emailService;
        }
        public int CreateOtherRequest(OtherRequestViewModel model, int requestTypeId)
        {
            //Aspnetuser aspnetuser = new();
            //User user = new User();
            Request request = new();
            request.Requesttypeid = requestTypeId;
            //request.Userid = user.Userid;
            request.Firstname = model.OtherFirstname;
            request.Lastname = model.OtherLastname;
            request.Phonenumber = model.OtherPhone;
            request.Email = model.OtherEmail;
            request.Status = 1;
            request.Createddate = DateTime.Now;
            request.Relationname = model.Relation;
            request.Casenumber = model.CaseNum;
            request.Casenumber = model.CaseNum;
            bool[] bitValues = { true };
            BitArray bits = new BitArray(bitValues);
            request.Isurgentemailsent = bits;
            _context.Add(request);
            _context.SaveChanges();


            Requestclient requestclient = new();
            requestclient.Requestid = request.Requestid;
            //Console.WriteLine(model.patientRequest);
            requestclient.Notes = model.Symptoms;
            requestclient.Firstname = model.Firstname;
            requestclient.Lastname = model.Lastname;
            requestclient.Intyear = model.DOB.Year;
            requestclient.Intdate = model.DOB.Day;
            requestclient.Strmonth = model.DOB.Month.ToString();
            requestclient.Phonenumber = model.Phone;
            requestclient.Email = model.Email;
            requestclient.Street = model.Street;
            requestclient.State = model.State;
            if (model.State != null)
            {
                if (model.State.ToLower() == "district of columbia")
                {
                    requestclient.Regionid = 1;
                }
                else if (model.State.ToLower() == "new york")
                {
                    requestclient.Regionid = 2;
                }
                else if (model.State.ToLower() == "virginia")
                {
                    requestclient.Regionid = 3;
                }
                else if (model.State.ToLower() == "maryland")
                {
                    requestclient.Regionid = 4;
                }
            }
            requestclient.City = model.City;
            requestclient.Zipcode = model.Zip;


            _context.Add(requestclient);
            _context.SaveChanges();

            int count = _context.Requests.Where(x => x.Createddate.Date == request.Createddate.Date).Count() + 1;
            var region = _context.Regions.Where(x => x.Regionid == requestclient.Regionid).FirstOrDefault();


            if (region != null)
            {
                var confirmNum = string.Concat(region.Abbreviation.ToUpper(), request.Createddate.ToString("ddMMyy"), requestclient.Lastname.Substring(0, 2).ToUpper() ?? "",
               requestclient.Firstname.Substring(0, 2).ToUpper(), count.ToString("D4"));
                request.Confirmationnumber = confirmNum;
            }
            else
            {
                var confirmNum = string.Concat("ML", request.Createddate.ToString("ddMMyy"), requestclient.Lastname.Substring(0, 2).ToUpper() ?? "",
              requestclient.Firstname.Substring(0, 2).ToUpper(), count.ToString("D4"));
                request.Confirmationnumber = confirmNum;
            }
            _context.Update(request);
            _context.SaveChanges();

           
            if (model.File != null)
            {
                foreach (var file in model.File)
                {
                    _patient.FileUpload(file, request.Requestid);
                }

            }
            return request.Requestid;
        }

        public void EmailSending(IUrlHelper urlHelper,string email,int requestid, string scheme) 
        {
            if (!_patient.CheckEmail(email))
            {
                string token = Guid.NewGuid().ToString();
                DateTime expiryTime = DateTime.UtcNow.AddHours(24);

                string link = urlHelper.Action("CreateAccount", "Login", new { token = token,requestid = requestid,expiryTime = expiryTime,email=email }, scheme);
                string subject = "Create Account";
                string body = $"Here is the link to create account. Link expires in 24 hours. {link}";
                _emailService.SendEmailAsync(email, subject, body);
            }

        }
    }
}
