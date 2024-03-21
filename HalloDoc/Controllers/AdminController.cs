using BusinessLogic.IRepository;
using BusinessLogic.Repository;
using DataAccess.DataContext;
using DataAccess.DataModels;
using DataAccess.ViewModel;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Newtonsoft.Json;
using OfficeOpenXml;
using Rotativa.AspNetCore;
using System.Collections;
using System.Drawing.Printing;
using System.Net.Mail;
using System.Reflection;

namespace HalloDoc.Controllers
{

    [CustomAuthorize("1")]
    public class AdminController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IAdmin _admin;
        private readonly IPatient _patient;
        private readonly IPatientRequest _patientRequest;
        private readonly Microsoft.AspNetCore.Hosting.IHostingEnvironment _hostingEnvironment;
        private readonly IEmailService _emailService;
        private readonly IOtherRequest _iOtherRequest;
        public AdminController(ApplicationDbContext context, IAdmin admin, IPatient patient, Microsoft.AspNetCore.Hosting.IHostingEnvironment hostingEnvironment, IEmailService emailService, IPatientRequest patientRequest, IOtherRequest otherRequest)
        {
            _context = context;
            _admin = admin;
            _patient = patient;
            _hostingEnvironment = hostingEnvironment;
            _emailService = emailService;
            _patientRequest = patientRequest;
            _iOtherRequest = otherRequest;
        }

        public IActionResult AdminPage()
        {
            return View();
        }
        public IActionResult AdminDashboardPartial()
        {
            ViewBag.NewCount = _context.Requests.Where(x => x.Status == 1).Count();
            ViewBag.PendingCount = _context.Requests.Where(x => x.Status == 2).Count();
            ViewBag.ActiveCount = _context.Requests.Where(x => x.Status == 4 || x.Status == 5).Count();
            ViewBag.ConcludeCount = _context.Requests.Where(x => x.Status == 6).Count();
            ViewBag.ToCloseCount = _context.Requests.Where(x => x.Status == 3 || x.Status == 7 || x.Status == 8).Count();
            ViewBag.UnpaidCount = _context.Requests.Where(x => x.Status == 9).Count();
            return PartialView("_AdminDashboardPartial");
        }

        public IActionResult MyProfileAdminPartial()
        {
            var email = HttpContext.Session.GetString("Email");
            var adminProfileViewModel = _admin.GetAdminProfile(email ?? "");
            //ViewBag.AdminProfile = adminProfileViewModel;
            return PartialView("_MyProfileAdminPartial", adminProfileViewModel);
        }


        public IActionResult ResetAdminPassword(string adminPassword)
        {
            var email = HttpContext.Session.GetString("Email");
            if (email != null)
            {
                Aspnetuser aspnetuser = _context.Aspnetusers.FirstOrDefault(x => x.Email == email);
                if (aspnetuser != null)
                {
                    aspnetuser.Passwordhash = adminPassword;
                    _context.Update(aspnetuser);
                    _context.SaveChanges();
                    TempData["message"] = "Reset Password Successful";
                }
                //var adminProfileViewModel = _admin.GetAdminProfile(email);
                //return PartialView("_MyProfileAdminPartial", adminProfileViewModel);
                return RedirectToAction("MyProfileAdminPartial");
            }
            return NotFound();
        }

        public IActionResult EditAdministrativeInfo(string firstname, string lastname, string email, string phoneAdministrator, List<int> adminRegions)
        {
            var oldEmail = HttpContext.Session.GetString("Email");
            if (oldEmail != null)
            {
                _admin.EditAdminDetails(oldEmail, firstname, lastname, email, phoneAdministrator, adminRegions);
                if (oldEmail != email)
                {
                    HttpContext.Session.SetString("Email", email);
                }
                var newemail = HttpContext.Session.GetString("Email");
                var username = string.Concat(firstname, ' ', lastname ?? "");
                HttpContext.Session.SetString("username", username);
                TempData["username"] = HttpContext.Session.GetString("username");
                TempData["message"] = "Administrative information edited successfully";
                return RedirectToAction("MyProfileAdminPartial");
            }
            return NotFound();
        }
        public IActionResult EditBillingInfo(string address1, string address2, string city, int state, string zip, string phoneBilling)
        {
            var email = HttpContext.Session.GetString("Email");
            if (email != null)
            {
                _admin.EditBillingDetails(email, address1, address2, city, state, zip, phoneBilling);
                TempData["message"] = "Mailing and Billing Information edited successfully";
                return RedirectToAction("MyProfileAdminPartial");

            }
            return NotFound();
        }

        public IActionResult LoadPartialView(string SearchValue, string districtSelect, string selectedFilter, string currentPartialName, int[] currentStatus, int pagesize = 5, int currentpage = 1)
        {
            var newPatientsViewModel = _admin.GetPatients(SearchValue, districtSelect, selectedFilter, currentStatus);
            int totalItems = newPatientsViewModel.Count();
            int totalPages = (int)Math.Ceiling((double)totalItems / pagesize);
            if (SearchValue != null || districtSelect != null || selectedFilter != null)
            {
                if (totalPages <= 1)
                {
                    currentpage = 1;
                }
            }
            var paginatedData = newPatientsViewModel.Skip((currentpage - 1) * pagesize).Take(pagesize).ToList();
            ViewBag.Count = totalItems;
            ViewBag.CurrentPage = currentpage;
            ViewBag.TotalPages = totalPages;
            return PartialView(currentPartialName, paginatedData);
        }

        public IActionResult ViewCase(int requestid)
        {
            TempData["Requestid"] = requestid;
            var caseViewModel = _admin.ViewCase(requestid);
            return View("ViewCase", caseViewModel);
        }

        public IActionResult ViewNotes(int requestid)
        {
            var notesViewModel = _admin.ViewNotes(requestid);
            ViewBag.requestid = requestid;
            return View("ViewNotes", notesViewModel);
        }

        public IActionResult AdditionalNotes(int requestid, string additionalNotes)
        {
            Requestnote requestnote = new Requestnote();
            requestnote.Requestid = requestid;
            requestnote.Adminnotes = additionalNotes;
            var email = HttpContext.Session.GetString("Email");
            Aspnetuser aspnetuser = _context.Aspnetusers.FirstOrDefault(x => x.Email == email);
            if (aspnetuser != null)
            {
                requestnote.Createdby = aspnetuser.Id;
            }
            requestnote.Createddate = DateTime.Now;
            _context.Add(requestnote);
            _context.SaveChanges();
            TempData["message"] = "Added notes successfully";
            return Ok();
        }

        public IActionResult ViewUploads(int requestid)
        {
            var request = _context.Requests.Where(x => x.Requestid == requestid).FirstOrDefault();
            if (request != null)
            {
                var patient = _context.Requestclients.Where(x => x.Requestid == requestid).FirstOrDefault();
                ViewBag.PatientName = string.Concat(patient.Firstname, ' ', patient.Lastname ?? "");
                ViewBag.ConfNum = request.Confirmationnumber;
                ViewBag.Requestid = request.Requestid;
                var viewDocumentsViewModel = _patient.GetDocuments(requestid);
                return View(viewDocumentsViewModel);
            }

            return View();
        }


        public IActionResult UploadFile(int requestid)
        {
            var file = Request.Form.Files["files"];
            if (file != null)
            {
                _patient.FileUpload(file, requestid);
            }
            return RedirectToAction("ViewUploads", new { requestid });
        }

        public IActionResult DeleteFile(string filename)
        {
            var filePath = Path.Combine(_hostingEnvironment.WebRootPath, "uploads", filename);
            if (System.IO.File.Exists(filePath))
            {
                //System.IO.File.Delete(filePath);
                Requestwisefile reqFile = _context.Requestwisefiles.Where(x => x.Filename == filename).FirstOrDefault();
                if (reqFile != null)
                {
                    bool[] bitValues = { true };
                    BitArray bits = new BitArray(bitValues);
                    reqFile.Isdeleted = bits;
                    _context.Update(reqFile);
                    _context.SaveChanges();
                }
                return Json(new { success = true, message = "File deleted" });
            }
            else
            {
                return Json(new { success = false, message = "File not found" });

            }
        }

        public IActionResult SendDocuments(List<string> files, int requestid)
        {
            List<Attachment> attachments = new();
            //var files =_context.Requestwisefiles.Where(x=>x.Requestid == requestid).ToList();
            if (files != null)
            {
                foreach (var file in files)
                {
                    var filePath = Path.Combine(_hostingEnvironment.WebRootPath, "uploads", file);
                    var attachment = new Attachment(filePath);
                    attachments.Add(attachment);
                }
                var reqClient = _context.Requestclients.Where(x => x.Requestid == requestid).FirstOrDefault();
                var recepientEmail = reqClient != null ? reqClient.Email : "";
                var subject = "Uploaded Documents";
                var body = "PFA uploaded documents";
                _emailService.SendEmailAsync(recepientEmail, subject, body, attachments);
                TempData["message"] = "Email sent!";
            }

            return Ok();
        }

        public IActionResult CancelCase(int requestid, string cancelNotes, string reasons)
        {
            _admin.CancelCase(requestid, cancelNotes, reasons);
            return Ok();
        }

        public IActionResult AssignCase(int regions, int physician, int requestId, string description)
        {
            _admin.AssignCase(regions, physician, requestId, description);
            return Ok();
        }

        public IActionResult BlockCase(int requestID, string blockReason)
        {
            _admin.BlockCase(requestID, blockReason);
            return Ok();
        }

        public IActionResult TransferCase(int regions, int physician, int RequestID, string desc)
        {
            _admin.TransferCase(regions, physician, RequestID, desc);
            return Ok();
        }
        public IActionResult ClearCase(int Requestid)
        {
            _admin.ClearCase(Requestid);
            return Ok();
        }

        public List<Casetag> CaseTagResults()
        {
            List<Casetag> results = _context.Casetags.ToList();
            return results;
        }

        public List<Region> RegionResults()
        {
            List<Region> results = _context.Regions.ToList();
            Console.WriteLine(results);
            return results;
        }

        public List<Physician> PhysicianResults(int regionid)
        {
            List<Physician> results = _context.Physicians.Where(x => x.Regionid == regionid).ToList();
            return results;
        }

        public List<Physician> TransferPhysician(int regionid,int physicianid)
        {
            List<Physician> results = _context.Physicians.Where(x => x.Regionid == regionid && x.Physicianid != physicianid).ToList();
            return results;
        }

        public List<Healthprofessionaltype> ProfessionResults()
        {
            return _context.Healthprofessionaltypes.ToList(); ;
        }

        public List<Healthprofessional> BusinessResults(int professionid)
        {
            return _context.Healthprofessionals.Where(x => x.Profession == professionid).ToList(); ;
        }

        public JsonResult CheckSession()
        {
            var request = HttpContext.Request;
            var token = request.Cookies["jwt"];

            if (string.IsNullOrEmpty(token))
            {
                return Json(new { sessionExists = false });
            }
            else
            {
                return Json(new { sessionExists = true });
            }
        }

        [HttpGet]
        public IActionResult SendOrder(int requestId)
        {
            ViewBag.RequestId = requestId;
            return View();
        }

        [HttpPost]
        public IActionResult SendOrder(SendOrderViewModel model)
        {
            if (ModelState.IsValid)
            {
                _admin.SendOrderDetails(model);
                TempData["message"] = "Order sent!";
            }
            return RedirectToAction("SendOrder");
        }
        public SendOrderViewModel SendOrderViewModel(int healthProfessionalId)
        {

            var healthProfessional = _context.Healthprofessionals.Where(x => x.Vendorid == healthProfessionalId).FirstOrDefault();
            if (healthProfessional != null)
            {
                SendOrderViewModel viewModel = new();
                viewModel.FaxNumber = healthProfessional.Faxnumber;
                viewModel.Email = healthProfessional.Email;
                viewModel.BusinessContact = healthProfessional.Businesscontact;
                return viewModel;

            }
            return new SendOrderViewModel();
        }

        public IActionResult ReviewAgreement(int id)
        {
            ViewBag.Id = id;
            var patient = _context.Requestclients.Where(x => x.Requestid == id).FirstOrDefault();
            if (patient != null)
            {
                ViewBag.Name = patient.Firstname + " " + patient.Lastname ?? "";
            }
            return View();
        }

        public IActionResult Agreed(int id)
        {
            _admin.Agreed(id);
            //return RedirectToAction("ReviewAgreement","Admin", new {id = id});
            return RedirectToAction("Login", "Login");

        }

        public IActionResult SendAgreementEmail(int RequestId, string phone, string email)
        {
            var subject = "Review Agreement";
            var url = Url.Action("ReviewAgreement", "Admin", new { id = RequestId }, Request.Scheme);
            var body = $"Click on the link below to review agreement. {url}";
            _emailService.SendEmailAsync(email, subject, body);
            return Ok();
        }

        public IActionResult CancelCaseByPatient(int requestid, string cancelNotes)
        {
            _admin.CancelCaseByPatient(requestid, cancelNotes);
            return RedirectToAction("Login", "Login");
        }

        [HttpGet]
        public IActionResult EncounterForm(int requestid)
        {
            var encounterForm = _admin.DisplayEncounterForm(requestid);
            if (encounterForm == null)
            {
                return View();
            }

            return View("EncounterForm", encounterForm);

        }


        [HttpPost]
        public IActionResult EncounterForm(EncounterFormViewModel encFormModel)
        {
            _admin.SaveEncounterForm(encFormModel);
            TempData["message"] = "Saved Changes";
            return RedirectToAction("EncounterForm", "Admin", new { requestid = encFormModel.Requestid });
        }
        public IActionResult Finalize(int requestid)
        {
            var encounterForm = _context.EncounterForms.Where(x => x.Requestid == requestid).FirstOrDefault();
            encounterForm.IsFinalize = true;
            _context.Update(encounterForm);
            _context.SaveChanges();
            return Ok();
        }

        public IActionResult CloseCase(int requestid)
        {
            var request = _context.Requests.Where(x => x.Requestid == requestid).FirstOrDefault();
            if (request != null)
            {
                var patient = _context.Requestclients.Where(x => x.Requestid == requestid).FirstOrDefault();
                ViewBag.PatientName = string.Concat(patient.Firstname, ' ', patient.Lastname ?? "");
                ViewBag.ConfNum = request.Confirmationnumber;
                ViewBag.Requestid = request.Requestid;
                var viewDocumentsViewModel = _patient.GetDocuments(requestid);
                return View(viewDocumentsViewModel);
            }

            return View();
        }

        public Requestclient RequestedClient(int requestid)
        {
            Requestclient requestclient = _context.Requestclients.Where(x => x.Requestid == requestid).FirstOrDefault();
            return requestclient;
        }

        public IActionResult SaveChangesCloseCase(int requestid, string email, string phone)
        {
            Requestclient requestclient = _context.Requestclients.Where(x => x.Requestid == requestid).FirstOrDefault();
            requestclient.Email = email;
            requestclient.Phonenumber = phone;
            _context.Update(requestclient);
            _context.SaveChanges();
            return Json(new { success = true });
        }
        public IActionResult CloseCaseInstance(int requestid)
        {
            _admin.CloseCase(requestid);
            return RedirectToAction("AdminPage", "Admin");
        }

        public IActionResult EncounterFormDetails(int requestid)
        {
            var encounterForm = _admin.DisplayEncounterForm(requestid);
            return View(encounterForm);
        }


        public IActionResult GeneratePDF(int ReqId)
        {

            var viewEncounterForm = _admin.DisplayEncounterForm(ReqId);

            if (viewEncounterForm == null)
            {
                return NotFound();
            }
            //TempData["message"] = "PDF Downloaded";
            //return View("EncounterFormDetails", encounterFormView);
            return new ViewAsPdf("EncounterFormDetails", viewEncounterForm)
            {
                FileName = "Encounter_Form.pdf"
            };

        }

        public IActionResult SendLinkEmail(string sendLinkFirstname, string sendLinkLarstname, string sendLinkEmail)
        {
            var url = Url.Action("PatientRequest", "Requests", null, Request.Scheme);
            string subject = "Submit Request for " + sendLinkFirstname + " " + sendLinkLarstname ?? "";
            var body = $"Click on the link below to submit request. {url}";
            _emailService.SendEmailAsync(sendLinkEmail, subject, body);
            return Ok();
        }

        [HttpGet]
        public IActionResult AdminCreateReq()
        {
            return View();
        }

        [HttpPost]
        public IActionResult AdminCreateReq(PatientRequestViewModel patientRequestViewModel)
        {
            if (ModelState.IsValid)
            {
                var email = HttpContext.Session.GetString("Email");
                int requestid = _patientRequest.PatientRequestAdmin(patientRequestViewModel, email);
                IUrlHelper urlHelper = Url;
                string scheme = HttpContext.Request.Scheme;
                _iOtherRequest.EmailSending(urlHelper, patientRequestViewModel.Email, requestid, scheme);
                TempData["message"] = "Request Created";
                return RedirectToAction("AdminCreateReq");
            }
            return View("AdminCreateReq");
        }

        public IActionResult ExportAllToExcel()
        {
            int[] allStatus = { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
            List<PatientsListViewModel> patientList = _admin.GetPatients("", "", "", allStatus);

            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
            using (var package = new ExcelPackage())
            {
                var worksheet = package.Workbook.Worksheets.Add("Sheet1");

                PropertyInfo[] properties = typeof(PatientsListViewModel).GetProperties();
                for (int i = 0; i < properties.Length; i++)
                {
                    worksheet.Cells[1, i + 1].Value = properties[i].Name;
                }
                for (int rowIndex = 0; rowIndex < patientList.Count; rowIndex++)
                {
                    for (int colIndex = 0; colIndex < properties.Length; colIndex++)
                    {
                        worksheet.Cells[rowIndex + 2, colIndex + 1].Value = properties[colIndex].GetValue(patientList[rowIndex]);
                    }
                }
                //save excel package to a memory stream
                MemoryStream stream = new MemoryStream();
                package.SaveAs(stream);

                stream.Position = 0; //set it as 0 to ensure that it is read from the beginning
                string excelName = $"ExportAll_{DateTime.Now.ToString("yyyyMMddHHmmss")}.xlsx";

                //return excel file as downloadable file
                return File(stream, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", excelName);
            }
        }
        public IActionResult ExportToExcel(int currentpage, string currentPartialName, string currentStatus, string searchFilter, string districtFilter, string btnFilter, int pagesize = 5)
        {
            List<int> status = new();
            string[] strStatuses = currentStatus.Split(',');
            foreach (string strStatus in strStatuses)
            {
                status.Add(int.Parse(strStatus));
            }
            int[] statusArray = status.ToArray();
            List<PatientsListViewModel> patientList = _admin.GetPatients(searchFilter, districtFilter, btnFilter, statusArray);
            var paginatedData = patientList.Skip((currentpage - 1) * pagesize).Take(pagesize).ToList();
            if (paginatedData != null)
            {

                ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
                using (var package = new ExcelPackage())
                {
                    var worksheet = package.Workbook.Worksheets.Add("Sheet1");

                    PropertyInfo[] properties = typeof(PatientsListViewModel).GetProperties();
                    for (int i = 0; i < properties.Length; i++)
                    {
                        worksheet.Cells[1, i + 1].Value = properties[i].Name;
                    }
                    for (int rowIndex = 0; rowIndex < paginatedData.Count; rowIndex++)
                    {
                        for (int colIndex = 0; colIndex < properties.Length; colIndex++)
                        {
                            worksheet.Cells[rowIndex + 2, colIndex + 1].Value = properties[colIndex].GetValue(paginatedData[rowIndex]);
                        }
                    }
                    //save excel package to a memory stream
                    MemoryStream stream = new MemoryStream();
                    package.SaveAs(stream);

                    stream.Position = 0; //set it as 0 to ensure that it is read from the beginning
                    string excelName = $"Export_{DateTime.Now.ToString("yyyyMMddHHmmss")}.xlsx";

                    //return excel file as downloadable file
                    return File(stream, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", excelName);
                }
            }
            return NotFound();
        }
    }
}
