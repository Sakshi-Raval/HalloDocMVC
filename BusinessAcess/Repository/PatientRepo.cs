using BusinessLogic.IRepository;
using DataAccess.DataContext;
using DataAccess.DataModels;
using DataAccess.ViewModel;
using Microsoft.AspNetCore.Hosting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace BusinessLogic.Repository
{
    public class PatientRepo : IPatient
    {
        private readonly ApplicationDbContext _context;
        private readonly IHostingEnvironment _hostingEnvironment;
        public PatientRepo(ApplicationDbContext context, IHostingEnvironment hostingEnvironment) {
            _context = context;
            _hostingEnvironment = hostingEnvironment;
        }
        public List<MedicalHistoryViewModel> GetRequestRecords(string email)
        {
           var medicalHistoryViewModel = (from req in _context.Requests
                   join reqFile in _context.Requestwisefiles
                   on req.Requestid equals reqFile.Requestid into fileGroup
                   where req.Email == email
                   from reqFile in fileGroup.DefaultIfEmpty()
                          //group fileGroup by new {req.Requestid} into g   
                   select new MedicalHistoryViewModel
                   {
                        CreatedDate = req.Createddate.ToString("MMM dd, yyyy"),
                        Status = req.Status,
                        DocumentCount = fileGroup.Count(),
                        requestid = req.Requestid,
                        Name = "Sakshi"
                   });
            return (medicalHistoryViewModel.ToList());

            
        }

        public List<ViewDocumentsViewModel> GetDocuments(int requestId)
        {
            return ((from reqFile in _context.Requestwisefiles
                     join req in _context.Requests
                     on reqFile.Requestid equals req.Requestid
                     where req.Requestid == requestId
                    select new ViewDocumentsViewModel
                     {
                         Filename = reqFile.Filename,
                         UploaderName = string.Concat(req.Firstname, ' ', req.Lastname),
                         CreatedDate = reqFile.Createddate.Date.ToString("MMM dd, yyyy"),
                    }).ToList());
        }

        public User UpdateUser(UserProfileViewModel model, string email)
        {
            
                User user = _context.Users.Where(x => x.Email == email).FirstOrDefault();
                user.Firstname = model.Firstname;
                user.Lastname = model.Lastname;
                user.Email = model.Email;
                user.Mobile = model.Phone;
                user.Street = model.Street;
                user.City = model.City;
                user.State = model.State;
                user.Zipcode = model.Zip;
                user.Intdate = model.DOB.Day;
                user.Strmonth = model.DOB.Month.ToString();
                user.Intyear = model.DOB.Year;
                user.Modifieddate = DateTime.Now;
                user.Modifiedby = user.Aspnetuserid;
                _context.Update(user);
                _context.SaveChanges();
                return user;
          
           
        }

        public void SubmitReqMe(PatientRequestViewModel model, int userid)
        {
            Request request = new();
            Requestclient requestclient = new();

            request.Requesttypeid = 1;
            request.Userid = userid;
            request.Firstname = model.Firstname;
            request.Lastname = model.Lastname;
            request.Phonenumber = model.Phone;
            request.Email = model.Email;
            request.Status = 1;
            request.Createddate = DateTime.Now;
            _context.Add(request);
            _context.SaveChanges();

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
            _context.SaveChanges();

            if (model.File != null)
            {
                foreach (var file in model.File)
                {
                    if (file.Length > 0)
                    {
                        var uploadsFolder = Path.Combine(_hostingEnvironment.WebRootPath, "uploads");
                        Requestwisefile requestwisefile = new();
                        requestwisefile.Requestid = request.Requestid;
                        requestwisefile.Filename = file.FileName;
                        requestwisefile.Createddate = DateTime.Now;
                        _context.Add(requestwisefile);
                        _context.SaveChanges();

                        if (!Directory.Exists(uploadsFolder))
                        {
                            Directory.CreateDirectory(uploadsFolder);
                        }
                        var filePath = Path.Combine(uploadsFolder, file.FileName);
                        using (var stream = System.IO.File.Create(filePath))
                        {
                            file.CopyTo(stream);
                        }
                    }
                }

            }
        }

        public void SubmitReqElse(OtherRequestViewModel model, User userModel)
        {
            Request request = new();
            request.Requesttypeid = 2;
            //request.Userid = user.Userid;
            request.Firstname = userModel.Firstname;
            request.Lastname = userModel.Lastname;
            request.Phonenumber = userModel.Mobile;
            request.Email = userModel.Email;
            request.Status = 1;
            request.Createddate = DateTime.Now;
            request.Relationname = model.Relation;
            _context.Add(request);
            _context.SaveChanges();

            Requestclient requestclient = new();
            requestclient.Requestid = request.Requestid;
            //Console.WriteLine(model.patientRequest);
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
            _context.SaveChanges();

            if (model.File != null && model.File.Length > 0)
            {
                var uploadsFolder = Path.Combine(_hostingEnvironment.WebRootPath, "uploads");
                if (!Directory.Exists(uploadsFolder))
                {
                    Directory.CreateDirectory(uploadsFolder);
                }
                var filePath = Path.Combine(uploadsFolder, model.File.FileName);
                Requestwisefile requestwisefile = new();
                requestwisefile.Requestid = request.Requestid;
                requestwisefile.Filename = model.File.FileName;
                requestwisefile.Createddate = DateTime.Now;
                using (var stream = File.Create(filePath))
                {
                    model.File.CopyTo(stream);
                }

            }

        }

    }
}
