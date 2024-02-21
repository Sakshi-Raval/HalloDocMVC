﻿using BusinessLogic.IRepository;
using DataAccess.DataContext;
using DataAccess.DataModels;
using DataAccess.ViewModel;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore.Metadata;
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
        private readonly IPatientRequest _iPatientRequest;
        private readonly IOtherRequest _iOtherRequest;
        public RequestsController(ApplicationDbContext context, IPatientRequest iPatientRequest, IOtherRequest iOtherRequest)
        {
            _context=context;
            _iPatientRequest=iPatientRequest;
            _iOtherRequest = iOtherRequest;
        }
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public JsonResult CheckEmail(string email)
        {
            var emailExists = _context.Users.Where(u=> u.Email == email).FirstOrDefault();
            Console.WriteLine(emailExists);
            return Json(emailExists);

        }

        public IActionResult PatientRequest()
        {
            return View();
        }

        [HttpPost]
        [AutoValidateAntiforgeryToken]
        public IActionResult PatientRequest( PatientRequestViewModel model)
        {
            if(ModelState.IsValid)
            {
                _iPatientRequest.CreatePatientRequest(model);
                TempData["message"] = "Request created successfully";
                return RedirectToAction("PatientRequest","Requests");
            }
            return View();
        }
        [HttpGet]
        public IActionResult FamilyRequest()
        {
            return View();
        }


        [HttpPost]
        public IActionResult FamilyRequest(OtherRequestViewModel model)
        {
           if(ModelState.IsValid)
            {
                _iOtherRequest.CreateOtherRequest(model,2);
                TempData["message"] = "Request created successfully";

                return RedirectToAction("FamilyRequest", "Requests");
            }
            return View();
        }
        public IActionResult ConciergeRequest()
        {
            return View();
        }
        [HttpPost]
        public IActionResult ConciergeRequest(OtherRequestViewModel model)
        {
            if (ModelState.IsValid)
            {
                _iOtherRequest.CreateOtherRequest(model, 3);
                TempData["message"] = "Request created successfully";

                return RedirectToAction("ConciergeRequest", "Requests");
            }
            return View();
        }
        public IActionResult BusinessRequest()
        {
            return View();
        }
        [HttpPost]
        public IActionResult BusinessRequest(OtherRequestViewModel model)
        {
            if (ModelState.IsValid)
            {
                _iOtherRequest.CreateOtherRequest(model,4);
                TempData["message"] = "Request created successfully";

                return RedirectToAction("BusinessRequest", "Requests");
            }
            return View();
        }
    }
}
