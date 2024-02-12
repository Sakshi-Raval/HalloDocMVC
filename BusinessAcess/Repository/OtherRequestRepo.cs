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
            Requestclient requestclient = new();


            request.Requesttypeid = 2;
            //request.Userid = user.Userid;
            request.Firstname = model.OtherFirstname;
            request.Lastname = model.OtherLastname;
            request.Phonenumber = model.OtherPhone;
            request.Email = model.OtherEmail;
            request.Status = 1;
            request.Createddate = DateTime.Now;
            request.Relationname = model.Relation;
            _context.Add(request);
             _context.SaveChangesAsync();

            requestclient.Requestid = request.Requestid;
            Console.WriteLine(model.patientRequest);
            requestclient.Notes = model.patientRequest.Symptoms.ToString();
            requestclient.Firstname = model.patientRequest.Firstname;
            requestclient.Lastname = model.patientRequest.Lastname;
            requestclient.Phonenumber = model.patientRequest.Phone;
            requestclient.Email = model.patientRequest.Email;
            requestclient.Street = model.patientRequest.Street;
            requestclient.State = model.patientRequest.State;
            requestclient.City = model.patientRequest.City;
            requestclient.Zipcode = model.patientRequest.Zip;
            _context.Add(requestclient);
            _context.SaveChangesAsync();
        }
    }
}
