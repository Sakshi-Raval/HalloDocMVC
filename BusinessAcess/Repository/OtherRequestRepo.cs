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
    public class OtherRequestRepo : IOtherRequest
    {
        private readonly ApplicationDbContext _context;
        public OtherRequestRepo(ApplicationDbContext context)
        {
            _context = context;
        }
        public void CreateOtherRequest(OtherRequestViewModel model)
        {
            //Aspnetuser aspnetuser = new();
            //User user = new User();
            Request request = new();
            request.Requesttypeid = 2;
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
        }
    }
}
