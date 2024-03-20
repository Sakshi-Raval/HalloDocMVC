using BusinessLogic.IRepository;
using DataAccess.DataContext;
using DataAccess.DataModels;
using DataAccess.ViewModel;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections;
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
            //var medicalHistoryViewModel = (from req in _context.Requests
            //        join reqFile in _context.Requestwisefiles
            //        on req.Requestid equals reqFile.Requestid into fileGroup
            //        where req.Email == email
            //        from reqFile in fileGroup.DefaultIfEmpty()
            //        orderby req.Createddate descending
            //        select new MedicalHistoryViewModel
            //        {
            //             CreatedDate = req.Createddate.ToString("MMM dd, yyyy"),
            //             Status = req.Status,
            //             DocumentCount = fileGroup.Count(),
            //        });
            var medicalHistoryViewModel = (from req in _context.Requests
                                           join reqFile in _context.Requestwisefiles
                                           on req.Requestid equals reqFile.Requestid into reqFilesGroup
                                           from reqFile in reqFilesGroup.DefaultIfEmpty()
                                           where req.Email == email
                                           group reqFile by new
                                           {
                                               req.Requestid,
                                               req.Createddate,
                                               req.Status,

                                           } into reqGroup
                                           orderby reqGroup.Key.Createddate descending
                                           select new MedicalHistoryViewModel
                                           {
                                               CreatedDate = reqGroup.Key.Createddate.ToString("MMM dd, yyyy"),
                                               Status = reqGroup.Key.Status,
                                               DocumentCount = reqGroup.Count(r=>r!=null),
                                               requestid = reqGroup.Key.Requestid
                                               
                                           }
                                          );
            return (medicalHistoryViewModel.ToList());

            
        }

        public List<ViewDocumentsViewModel> GetDocuments(int requestId)
        {
            bool[] bitValues = { false };
            BitArray bits = new BitArray(bitValues);
            return ((from reqFile in _context.Requestwisefiles
                     join req in _context.Requests
                     on reqFile.Requestid equals req.Requestid
                     where req.Requestid == requestId && (reqFile.Isdeleted == bits || reqFile.Isdeleted == null)
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
                user.Modifieddate = DateTime.Now;
                user.Modifiedby = user.Aspnetuserid;
                _context.Update(user);
                _context.SaveChanges();

                Aspnetuser aspnetuser = _context.Aspnetusers.Where(x=>x.Email==email).FirstOrDefault();
                aspnetuser.Email = email;
                aspnetuser.Modifieddate = DateTime.Now;
                aspnetuser.Phonenumber = model.Phone;
                _context.Update(aspnetuser);
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
            bool[] bitValues = { true };
            BitArray bits = new BitArray(bitValues);
            request.Isurgentemailsent = bits;
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
            var id = _context.Users.Where(x => x.Userid == userid).FirstOrDefault();
            if (id!=null && id.Regionid!=null)
            {
                requestclient.Regionid = id.Regionid;
            }
            requestclient.City = model.City;
            requestclient.Zipcode = model.Zip;

            _context.Add(requestclient);
            _context.SaveChanges();

            //confirmation number generation
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
                    FileUpload(file, request.Requestid);
                }

            }
        }

        public void SubmitReqElse(PatientRequestViewModel model, User userModel)
        {
            Request request = new();
            request.Requesttypeid = 2;
            //request.Userid = user.Userid;
            request.Userid = userModel.Userid;
            request.Firstname = userModel.Firstname;
            request.Lastname = userModel.Lastname;
            request.Phonenumber = userModel.Mobile;
            request.Email = userModel.Email;
            request.Status = 1;
            request.Createddate = DateTime.Now;
            request.Relationname = model.Relation;
            bool[] bitValues = { true };
            BitArray bits = new BitArray(bitValues);
            request.Isurgentemailsent = bits;

            _context.Add(request);
            _context.SaveChanges();

            Requestclient requestclient = new();
            requestclient.Requestid = request.Requestid;
            Console.WriteLine("sudbgfvaisud");
            requestclient.Notes = model.Symptoms;
            requestclient.Firstname = model.Firstname;
            requestclient.Lastname = model.Lastname;
            requestclient.Phonenumber = model.Phone;
            requestclient.Email = model.Email;
            requestclient.Street = model.Street;
            requestclient.State = model.State;
            requestclient.Regionid = userModel.Regionid;
            requestclient.City = model.City;
            requestclient.Zipcode = model.Zip;

            _context.Add(requestclient);
            _context.SaveChanges();

            //confirmation number generation
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
                var uniqueFileName = $"{Guid.NewGuid()}_{file.FileName}";
                var filePath = Path.Combine(uploadsFolder, uniqueFileName);
                Requestwisefile requestwisefile = new();
                requestwisefile.Requestid = requestId;
                requestwisefile.Filename = uniqueFileName;
                requestwisefile.Createddate = DateTime.Now;
                _context.Add(requestwisefile);
                _context.SaveChanges();
                using (var stream = System.IO.File.Create(filePath))
                {
                    file.CopyTo(stream);
                }
            }
        }

        public bool CheckEmail(string email)
        {
            Aspnetuser aspnetuser=_context.Aspnetusers.FirstOrDefault(x=>x.Email==email);
            if (aspnetuser != null)
            {
                return true;
            }
            return false;
        }
    }
}
