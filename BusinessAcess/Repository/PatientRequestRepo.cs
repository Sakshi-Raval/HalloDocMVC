using BusinessLogic.IRepository;
using DataAccess.DataContext;
using DataAccess.DataModels;
using DataAccess.ViewModel;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic.Repository
{
    public class PatientRequestRepo : IPatientRequest
    {
        private readonly ApplicationDbContext _context;
        public PatientRequestRepo(ApplicationDbContext context)
        {
            _context=context;
        }
        public void CreatePatientRequest(PatientRequestViewModel model)
        {
            User status = _context.Users.Where(x => x.Email == model.Email).FirstOrDefault();

            Aspnetuser aspnetuser = new();
            User user = new User();
            Request request = new();
            Requestclient requestclient = new();
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
                user.Zipcode = model.Zip;
                //user.Intdate = model.DOB.Day;
                //user.Strmonth = model.DOB.Month.ToString();
                //user.Intyear = model.DOB.Year;
                user.Createdby = "xyz";
                user.Createddate = DateTime.Now;
                user.Status = 1;
                user.Isdeleted = false;
                user.Isrequestwithemail = true;
                _context.Add(user);
                 _context.SaveChanges();

                request.Requesttypeid = 1;
                request.Userid = user.Userid;
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
                _context.Add(request);
                 _context.SaveChanges();

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
                 _context.SaveChanges();
                
            }

        }
    }
}
