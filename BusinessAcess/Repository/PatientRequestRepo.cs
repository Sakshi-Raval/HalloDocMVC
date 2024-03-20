using BusinessLogic.IRepository;
using DataAccess.DataContext;
using DataAccess.DataModels;
using DataAccess.ViewModel;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using System.Collections;
using System.Security.Policy;

namespace BusinessLogic.Repository
{
    public class PatientRequestRepo : IPatientRequest
    {
        private readonly ApplicationDbContext _context;
        private readonly IHostingEnvironment _hostingEnvironment;

        public PatientRequestRepo(ApplicationDbContext context, IHostingEnvironment hostingEnvironment)
        {
            _context=context;
            _hostingEnvironment=hostingEnvironment;
        }
        public  void CreatePatientRequest(PatientRequestViewModel model)
        {
            User status = _context.Users.Where(x => x.Email == model.Email).FirstOrDefault();

            Aspnetuser aspnetuser = new();
            User user = new User();
            Request request = new();
            Requestclient requestclient = new();
            Aspnetuserrole aspnetuserrole = new();
            if (status == null)
            {

                Guid id = Guid.NewGuid();
                aspnetuser.Id = id.ToString();
                aspnetuser.Username = model.Email;
                aspnetuser.Passwordhash = model.Password;
                aspnetuser.Email = model.Email;
                aspnetuser.Phonenumber = model.Phone;
                aspnetuser.Createddate = DateTime.Now;
                _context.Add(aspnetuser);
                _context.SaveChanges();


                user.Aspnetuserid = aspnetuser.Id;
                user.Firstname = model.Firstname;
                user.Lastname = model.Lastname;
                user.Email = model.Email;
                user.Mobile = model.Phone;
                user.Street = model.Street;
                user.City = model.City;
                user.State = model.State;
                if (model.State != null)
                {
                    if (model.State.ToLower() == "district of columbia")
                    {
                        user.Regionid = 1;
                    }
                    else if (model.State.ToLower() == "new york")
                    {
                        user.Regionid = 2;
                    }
                    else if (model.State.ToLower() == "virginia")
                    {
                        user.Regionid = 3;
                    }
                    else if (model.State.ToLower() == "maryland")
                    {
                        user.Regionid = 4;
                    }
                }
                
                user.Zipcode = model.Zip;
                user.Intdate = model.DOB.Day;
                user.Strmonth = model.DOB.Month.ToString();
                user.Intyear = model.DOB.Year;
                user.Createdby = aspnetuser.Id;
                user.Createddate = DateTime.Now;
                user.Status = 1;
                user.Isdeleted = false;
                user.Isrequestwithemail = true;
                _context.Add(user);
                _context.SaveChanges();

                aspnetuserrole.Userid = aspnetuser.Id;
                aspnetuserrole.Roleid = _context.Aspnetroles.Where(x => x.Name == "Patient").Select(x => x.Id).FirstOrDefault()??"2";
                _context.Add(aspnetuserrole);
                _context.SaveChanges();

                request.Requesttypeid = 1;
                request.Userid = user.Userid;
                request.Firstname = model.Firstname;
                request.Lastname = model.Lastname;
                request.Phonenumber = model.Phone;
                request.Email = model.Email;
                request.Status = 1;
                request.Createddate = DateTime.Now;
                bool[] bitValues = { true };
                BitArray bits = new BitArray(bitValues);
                request.Isurgentemailsent = bits;
                _context.Add(request);
                _context.SaveChanges();

                requestclient.Requestid = request.Requestid;
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
                requestclient.Regionid = user.Regionid;
                requestclient.City = model.City;
                requestclient.Zipcode = model.Zip;

                _context.Add(requestclient);
                _context.SaveChanges();

                int count = _context.Requests.Where(x => x.Createddate.Date == request.Createddate.Date).Count()+1;
                var region = _context.Regions.Where(x => x.Regionid == requestclient.Regionid).FirstOrDefault();


                if (region != null)
                {
                    var confirmNum = string.Concat(region.Abbreviation.ToUpper(), request.Createddate.ToString("ddMMyy"), requestclient.Lastname.Substring(0, 2).ToUpper() ?? "",
                   requestclient.Firstname.Substring(0, 2).ToUpper(), count.ToString("D4"));
                    request.Confirmationnumber = confirmNum;
                }
                else
                {
                    var confirmNum = string.Concat("MD", request.Createddate.ToString("ddMMyy"), requestclient.Lastname.Substring(0, 2).ToUpper() ?? "",
                  requestclient.Firstname.Substring(0, 2).ToUpper(), count.ToString("D4"));
                    request.Confirmationnumber = confirmNum;
                }
                _context.Update(request);
                _context.SaveChanges();
  

            }
            else
            {
               
                //var netuser = _context.Aspnetusers.Where(x => x.Id == status.Aspnetuserid).FirstOrDefault();
                request.Requesttypeid = 1;
                request.Userid = status.Userid;
                request.Firstname = status.Firstname;
                request.Lastname = status.Lastname;
                request.Phonenumber = status.Mobile;
                request.Email = status.Email;
                request.Status = 1;
                request.Createddate = DateTime.Now;
                bool[] bitValues = { true };
                BitArray bits = new BitArray(bitValues);
                request.Isurgentemailsent = bits;

                _context.Add(request);
                _context.SaveChanges();

                requestclient.Requestid = request.Requestid;
                requestclient.Notes = model.Symptoms;
                requestclient.Firstname = status.Firstname;
                requestclient.Lastname = status.Lastname;
                requestclient.Intyear = model.DOB.Year;
                requestclient.Intdate = model.DOB.Day;
                requestclient.Strmonth = model.DOB.Month.ToString();
                requestclient.Phonenumber = status.Mobile;
                requestclient.Email = status.Email;
                requestclient.Street = status.Street;
                requestclient.State = status.State;
                requestclient.Regionid = status.Regionid;
                requestclient.City = status.City;
                requestclient.Zipcode = status.Zipcode;


                _context.Add(requestclient);
                _context.SaveChanges();

                int count = _context.Requests.Where(x => x.Createddate.Date == request.Createddate.Date).Count()+1;
                var region = _context.Regions.Where(x => x.Regionid == requestclient.Regionid).FirstOrDefault();

                if (region != null)
                {
                    var confirmNum = string.Concat(region.Abbreviation.ToUpper(), request.Createddate.ToString("ddMMyy"), requestclient.Lastname.Substring(0, 2).ToUpper() ?? "",
                   requestclient.Firstname.Substring(0, 2).ToUpper(), count.ToString("D4"));
                    request.Confirmationnumber = confirmNum;
                }
                else
                {
                    var confirmNum = string.Concat("MD", request.Createddate.ToString("ddMMyy"), requestclient.Lastname.Substring(0, 2).ToUpper() ?? "",
                  requestclient.Firstname.Substring(0, 2).ToUpper(), count.ToString("D4"));
                    request.Confirmationnumber = confirmNum;
                }
                _context.Update(request);
                _context.SaveChanges();
            }
           
            if(model.File != null )
            {
                foreach (var file in model.File)
                {
                    FileUpload(file, request.Requestid);
                }
                
            }

        }
        public void FileUpload(IFormFile file, int requestId)
        {
            if (file.Length > 0)
            {
                var uploadsFolder = Path.Combine(_hostingEnvironment.WebRootPath, "uploads");
                if (!Directory.Exists(uploadsFolder))
                {
                    Directory.CreateDirectory(uploadsFolder);
                }
                var filePath = Path.Combine(uploadsFolder, file.FileName);
                Requestwisefile requestwisefile = new();
                requestwisefile.Requestid = requestId;
                requestwisefile.Filename = file.FileName;
                requestwisefile.Createddate = DateTime.Now;
                _context.Add(requestwisefile);
                _context.SaveChanges();
                using (var stream = System.IO.File.Create(filePath))
                {
                    file.CopyTo(stream);
                }
            }
        }

        public void PatientRequestAdmin(PatientRequestViewModel patientRequestViewModel, string email)
        {
            Request request = new();
            Requestclient requestclient = new();

            request.Requesttypeid = 1;
            request.Firstname = patientRequestViewModel.Firstname;
            request.Lastname = patientRequestViewModel.Lastname;
            request.Phonenumber = patientRequestViewModel.Phone;
            request.Email = patientRequestViewModel.Email;
            request.Status = 1;
            request.Createddate = DateTime.Now;
            bool[] bitValues = { true };
            BitArray bits = new BitArray(bitValues);
            request.Isurgentemailsent = bits;

            _context.Add(request);
            _context.SaveChanges();

            requestclient.Requestid = request.Requestid;
            requestclient.Firstname = patientRequestViewModel.Firstname;
            requestclient.Lastname = patientRequestViewModel.Lastname;
            requestclient.Intyear = patientRequestViewModel.DOB.Year;
            requestclient.Intdate = patientRequestViewModel.DOB.Day;
            requestclient.Strmonth = patientRequestViewModel.DOB.Month.ToString();
            requestclient.Phonenumber = patientRequestViewModel.Phone;
            requestclient.Email = patientRequestViewModel.Email;
            requestclient.Street = patientRequestViewModel.Street;
            requestclient.State =  _context.Regions.Where(x => x.Regionid == int.Parse(patientRequestViewModel.State)).Select(x => x.Name).FirstOrDefault();
            requestclient.Regionid = patientRequestViewModel.State != null ? int.Parse(patientRequestViewModel.State) : null;
            requestclient.City = patientRequestViewModel.City;
            requestclient.Zipcode = patientRequestViewModel.Zip;

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
                var confirmNum = string.Concat("MD", request.Createddate.ToString("ddMMyy"), requestclient.Lastname.Substring(0, 2).ToUpper() ?? "",
              requestclient.Firstname.Substring(0, 2).ToUpper(), count.ToString("D4"));
                request.Confirmationnumber = confirmNum;
            }
            _context.Update(request);
            _context.SaveChanges();

            if (patientRequestViewModel.Notes != null)
            {
                Requestnote requestnote = new();
                Aspnetuser aspnetuser = _context.Aspnetusers.FirstOrDefault(x => x.Email == email);
                if (aspnetuser != null)
                {
                    var roleid = _context.Aspnetuserroles.Where(x=>x.Userid==aspnetuser.Id).Select(x=>x.Roleid).FirstOrDefault();
                    requestnote.Requestid = request.Requestid;
                    requestnote.Createddate = DateTime.Now;
                    if(roleid=="1")
                    {
                        requestnote.Adminnotes = patientRequestViewModel.Notes;
                        requestnote.Createdby = aspnetuser.Id;
                    }
                    else if (roleid == "3")
                    {
                        requestnote.Physiciannotes = patientRequestViewModel.Notes;
                        requestnote.Createdby = aspnetuser.Id;
                    }
                    _context.Add(requestnote);
                    _context.SaveChanges();
                }
            }

            //send email if not an existing user
         
        }

    }
}

