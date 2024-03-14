﻿using BusinessLogic.IRepository;
using DataAccess.DataContext;
using DataAccess.DataModels;
using DataAccess.ViewModel;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Caching.Memory;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.WebPages;

namespace BusinessLogic.Repository
{
    public class AdminRepo : IAdmin
    {
        private readonly ApplicationDbContext _context;
        public AdminRepo(ApplicationDbContext context)
        {
            _context = context;
        }

        public List<PatientsListViewModel> GetPatients(string SearchValue, string districtSelect, string selectedFilter, int[] currentStatus)
        {
            var newPatientsViewModel = (from req in _context.Requests
                                        join reqClient in _context.Requestclients
                                        on req.Requestid equals reqClient.Requestid
                                        join encForm in _context.EncounterForms
                                        on req.Requestid equals encForm.Requestid into encounterFormJoin
                                        from encounterForm in encounterFormJoin.DefaultIfEmpty()
                                        orderby req.Createddate descending
                                        select new PatientsListViewModel
                                        {
                                            Name = (reqClient.Firstname ?? "") + ", " + (reqClient.Lastname ?? ""),
                                            DOB = reqClient.Intyear != null && reqClient.Strmonth != null && reqClient.Intdate != null ?
                                                    string.Concat(new DateOnly((int)reqClient.Intyear, int.Parse(reqClient.Strmonth), (int)reqClient.Intdate).ToString("MMM dd,yyyy")," (",(DateTime.Now.Year - reqClient.Intyear).ToString(),")")   :
                                                    "---",
                                            Requestor = (req.Firstname) + " " + (req.Lastname ?? ""),
                                            RequestedDate = req.Createddate.ToString("MMM dd, yyyy")+" "+ (DateTime.Now.Subtract(req.Createddate).Days*24+DateTime.Now.Subtract(req.Createddate).Hours).ToString() + "h "+
                                            (DateTime.Now.Subtract(req.Createddate).Minutes).ToString()+ "m " + (DateTime.Now.Subtract(req.Createddate).Seconds).ToString() + "s",
                                            PhoneNumber = reqClient.Phonenumber,
                                            OtherPhoneNumber = req.Phonenumber,
                                            Address = (reqClient.Street ?? "") + " " + (reqClient.City ?? "") + " " + (reqClient.State ?? "") + " " + (reqClient.Zipcode ?? ""),
                                            Notes = _context.Requeststatuslogs.Where(x=>x.Requestid == req.Requestid).Select(x=>x.Notes).ToList(),
                                            RequestTypeId = req.Requesttypeid,
                                            Status = req.Status,
                                            RegionId = reqClient.Regionid.ToString() ?? " ",
                                            Region = _context.Regions.Where(x => x.Regionid == reqClient.Regionid).FirstOrDefault().Name ?? "",
                                            RequestId = req.Requestid,
                                            Email = reqClient.Email ?? "",
                                            IsFinalize = encounterForm.IsFinalize
                                        }
                                        ).Where(item => (currentStatus.Any(x=>x==item.Status)) 
                                        && (string.IsNullOrEmpty(SearchValue) || item.Name.ToLower().Contains(SearchValue.ToLower()))
                                        && (string.IsNullOrEmpty(districtSelect) || item.RegionId == districtSelect) 
                                        && (string.IsNullOrEmpty(selectedFilter) || item.RequestTypeId == int.Parse(selectedFilter))).ToList();
          
            return newPatientsViewModel;

            
           
        }
        public CaseViewModel ViewCase(int requestid)
        {
            var caseViewModel = (from reqClient in _context.Requestclients
                                 join req in _context.Requests
                                 on reqClient.Requestid equals req.Requestid
                                 join region in _context.Regions
                                 on reqClient.Regionid equals region.Regionid
                                 where req.Requestid == requestid
                                 select new CaseViewModel
                                 {
                                     ConfirmNum = req.Confirmationnumber ?? "",
                                     PatientNotes = reqClient.Notes ?? "",
                                     Firstname = reqClient.Firstname,
                                     Lastname = reqClient.Lastname ?? "",
                                     DOB = reqClient.Intyear != null && reqClient.Strmonth != null && reqClient.Intdate != null ?
                                                    new DateOnly((int)reqClient.Intyear, int.Parse(reqClient.Strmonth), (int)reqClient.Intdate) : new DateOnly(),
                                     Phonenumber = reqClient.Phonenumber ?? "",
                                     Email = reqClient.Email ?? "",
                                     Region = region.Name,
                                     Address = (reqClient.Street ?? "") + " " + (reqClient.City ?? "") + " " + (reqClient.State ?? "") + " " + (reqClient.Zipcode ?? ""),
                                     Status = req.Status,
                                     Requestid = req.Requestid,

                                 }
                                 ).FirstOrDefault();
            return caseViewModel;

        }
        public List<NotesViewModel> ViewNotes(int requestid)
        {
            var leftJoin = from rn in _context.Requestnotes
                           join rs in _context.Requeststatuslogs on rn.Requestid equals rs.Requestid into rsJoin
                           from rs in rsJoin.DefaultIfEmpty()
                           join a in _context.Admins on rs.Adminid equals a.Adminid into aJoin
                           from a in aJoin.DefaultIfEmpty()
                           join p in _context.Physicians on rs.Physicianid equals p.Physicianid into pJoin
                           from p in pJoin.DefaultIfEmpty()
                           where rn.Requestid == requestid
                           select new NotesViewModel
                           {
                               TransToPhysicianId = rs.Transtophysicianid,
                               Status = rs.Status,
                               AdminName = a.Firstname ?? "" + " " + a.Lastname ?? "",
                               PhysicianName = p.Firstname ?? "" + " " + p.Lastname ?? "",
                               AdminNotes = rn.Adminnotes,
                               PhysicianNotes = rn.Physiciannotes,
                               TransferNotes = rs.Notes,
                               Cancelcount = _context.Requeststatuslogs.Count(item => item.Status == 3 || item.Status == 7)
                           };

            var rightJoin = from rs in _context.Requeststatuslogs
                            join rn in _context.Requestnotes on rs.Requestid equals rn.Requestid into rnJoin
                            from rn in rnJoin.DefaultIfEmpty()
                            join a in _context.Admins on rs.Adminid equals a.Adminid into aJoin
                            from a in aJoin.DefaultIfEmpty()
                            join p in _context.Physicians on rs.Physicianid equals p.Physicianid into pJoin
                            from p in pJoin.DefaultIfEmpty()
                            where rs.Requestid == requestid // Filter only records not in left join result
                            select new NotesViewModel
                            {
                                TransToPhysicianId = rs.Transtophysicianid,
                                Status = rs.Status,
                                AdminName = a.Firstname ?? "" + " " + a.Lastname ?? "",
                                PhysicianName = p.Firstname ?? "" + " " + p.Lastname ?? "",
                                AdminNotes = rn.Adminnotes,
                                PhysicianNotes = rn.Physiciannotes,
                                TransferNotes = rs.Notes,
                                Cancelcount = _context.Requeststatuslogs.Count(item => item.Status == 3 || item.Status == 7)
                            };
            var result = leftJoin.Union(rightJoin).ToList();
            return result;

        }
        public void CancelCase(int requestid, string cancelNotes, string reasons)
        {
            var request = _context.Requests.Where(x => x.Requestid == requestid).FirstOrDefault();
            if (request != null)
            {
                request.Status = 3;
                request.Casetag = reasons;

               var requestLog = new Requeststatuslog();
               requestLog.Requestid = requestid;
               requestLog.Status = 3;
               requestLog.Notes = cancelNotes ?? "";
               requestLog.Createddate = DateTime.Now;
               _context.Add(requestLog);
               _context.SaveChanges();
               
               _context.Update(request);
               _context.SaveChanges();
            }
            
        }
        public void AssignCase(int regions,int physician,int requestId, string description)
        {
            var request = _context.Requests.Where(x => x.Requestid == requestId).FirstOrDefault();
            if (request != null)
            {
                request.Status = 2;
                request.Physicianid = physician;

                var requestLog = new Requeststatuslog();
                requestLog.Requestid = requestId;
                requestLog.Status = 2;
                requestLog.Notes = description ?? "";
                requestLog.Createddate = DateTime.Now;
                requestLog.Physicianid = physician;
                _context.Add(requestLog);
                _context.SaveChanges();

                _context.Update(request);
                _context.SaveChanges();
            }

        }

        public void TransferCase(int regions, int physician, int RequestID, string desc)
        {
            var request = _context.Requests.Where(x => x.Requestid == RequestID).FirstOrDefault();
            if (request != null)
            {
                var requestLog = new Requeststatuslog();
                requestLog.Requestid = RequestID;
                requestLog.Status = 2;
                requestLog.Notes = desc ?? "";
                requestLog.Createddate = DateTime.Now;
                requestLog.Physicianid = physician;
                requestLog.Transtophysicianid = physician;
                var physicianName = _context.Physicians.Where(x => x.Physicianid == physician).FirstOrDefault();
                _context.Add(requestLog);
                _context.SaveChanges();

                request.Status = 2;
                request.Physicianid = physician;
                _context.Update(request);
                _context.SaveChanges();
            }

        }

        public void ClearCase(int Requestid)
        {
            var request = _context.Requests.Where(x => x.Requestid == Requestid).FirstOrDefault();
            if (request != null)
            {
                request.Status = 10;

                var requestLog = new Requeststatuslog();
                requestLog.Requestid = Requestid;
                requestLog.Status = 10;
                requestLog.Createddate = DateTime.Now;
                _context.Add(requestLog);
                _context.SaveChanges();

                _context.Update(request);
                _context.SaveChanges();
            }
        }

        public void BlockCase(int requestID, string blockReason)
        {
            var request = _context.Requests.Where(x => x.Requestid == requestID).FirstOrDefault();
            if (request != null)
            {
                request.Status = 11;//block status = 11

                var blockRequest = new Blockrequest();
                blockRequest.Requestid = requestID.ToString();
                blockRequest.Reason = blockReason;
                blockRequest.Createddate = DateTime.Now;
                blockRequest.Phonenumber = request.Phonenumber;
                blockRequest.Email = request.Email;
                _context.Add(blockRequest);
                _context.SaveChanges();

                var requestLog = new Requeststatuslog();
                requestLog.Requestid = requestID;
                requestLog.Status = 11;
                requestLog.Notes = blockReason ?? "";
                requestLog.Createddate = DateTime.Now;
                _context.Add(requestLog);
                _context.SaveChanges();

                _context.Update(request);
                _context.SaveChanges();
            }
        }
        public void SendOrderDetails(SendOrderViewModel model)
        {
            Orderdetail orderDetails = new();
            orderDetails.Vendorid = model.Vendorid;
            orderDetails.Requestid = model.Requestid;
            orderDetails.Faxnumber = model.FaxNumber;
            orderDetails.Email = model.Email;
            orderDetails.Businesscontact = model.BusinessContact;
            orderDetails.Prescription = model.Prescription;
            orderDetails.Noofrefill = model.NoOfRefill;
            orderDetails.Createddate = DateTime.Now;
            _context.Add(orderDetails);
            _context.SaveChanges();
        }

        public void Agreed(int id)
        {
            var request = _context.Requests.Where(x => x.Requestid == id).FirstOrDefault();
            if (request != null)
            {
                request.Status = 4;

                var requestLog = new Requeststatuslog();
                requestLog.Requestid = id;
                requestLog.Status = 4;
                requestLog.Physicianid = request.Physicianid;
                requestLog.Createddate = DateTime.Now;
                _context.Add(requestLog);
                _context.SaveChanges();

                _context.Update(request);
                _context.SaveChanges();
            }
        }

        public void CancelCaseByPatient(int requestid, string cancelNotes)
        {
            var request = _context.Requests.Where(x => x.Requestid == requestid).FirstOrDefault();
            if (request != null)
            {
                request.Status = 7;

                var requestLog = new Requeststatuslog();
                requestLog.Requestid = requestid;
                requestLog.Status = 7;
                requestLog.Notes = cancelNotes ;
                requestLog.Createddate = DateTime.Now;
                _context.Add(requestLog);
                _context.SaveChanges();

                _context.Update(request);
                _context.SaveChanges();
            }

        }

        public EncounterFormViewModel DisplayEncounterForm(int requestid)
        {
            var req = _context.Requests.Where(x => x.Requestid == requestid).FirstOrDefault();
            var reqClient = _context.Requestclients.Where(x => x.Requestid == requestid).FirstOrDefault();
            var ef = _context.EncounterForms.Where(x => x.Requestid == requestid).FirstOrDefault();
            if(reqClient!=null && req != null)
            {
                EncounterFormViewModel encounterFormModel = new();

                encounterFormModel.Requestid = requestid;
                encounterFormModel.Firstname = reqClient.Firstname;
                encounterFormModel.Lastname = reqClient.Lastname ?? "";
                encounterFormModel.Location = (reqClient.Street ?? "") + " " + (reqClient.City ?? "") + " " + (reqClient.State ?? "") + " " + (reqClient.Zipcode ?? "");
                encounterFormModel.Birthdate = reqClient.Intyear != null && reqClient.Strmonth != null && reqClient.Intdate != null?
                                                    new DateOnly((int)reqClient.Intyear, int.Parse(reqClient.Strmonth), (int)reqClient.Intdate) : new DateOnly();
                encounterFormModel.DateOfService = reqClient.Intyear != null && reqClient.Strmonth != null && reqClient.Intdate != null ?
                                                    new DateOnly((int)reqClient.Intyear, int.Parse(reqClient.Strmonth), (int)reqClient.Intdate) : new DateOnly();
                encounterFormModel.Phone = reqClient.Phonenumber ?? "";
                encounterFormModel.Email = reqClient.Email;
                encounterFormModel.Physicianid = req.Physicianid;
                encounterFormModel.Adminid = 1;
                if (ef != null)
                {
                    encounterFormModel.HistoryOfIllness = ef.HistoryOfPresentIllnessOrInjury != null ? ef.HistoryOfPresentIllnessOrInjury : "";
                    encounterFormModel.MedicalHistory = ef.MedicalHistory != null ? ef.MedicalHistory : "";
                    encounterFormModel.Medications = ef.Medications != null ? ef.Medications : "";
                    encounterFormModel.Allergies = ef.Allergies != null ? ef.Allergies : "";
                    encounterFormModel.Temp = ef.Temp != null ? ef.Temp : "";
                    encounterFormModel.HR = ef.Hr != null ? ef.Hr : "";
                    encounterFormModel.RR = ef.Rr != null ? ef.Rr : "";
                    encounterFormModel.BloodPressureSys = ef.BloodPressureSystolic != null ? ef.BloodPressureSystolic : "";
                    encounterFormModel.BloodPressureDia = ef.BloodPressureDiastolic != null ? ef.BloodPressureDiastolic : "";
                    encounterFormModel.O2 = ef.O2 != null ? ef.O2 : "";
                    encounterFormModel.Pain = ef.Pain != null ? ef.Pain : "";
                    encounterFormModel.Heent = ef.Heent != null ? ef.Heent : "";
                    encounterFormModel.CV = ef.Cv != null ? ef.Cv : "";
                    encounterFormModel.Chest = ef.Chest != null ? ef.Chest : "";
                    encounterFormModel.ABD = ef.Abd != null ? ef.Abd : "";
                    encounterFormModel.Extremeties = ef.Extremeties != null ? ef.Extremeties : "";
                    encounterFormModel.Skin = ef.Skin != null ? ef.Skin : "";
                    encounterFormModel.Neuro = ef.Neuro != null ? ef.Neuro : "";
                    encounterFormModel.Other = ef.Other != null ? ef.Other : "";
                    encounterFormModel.Diagnosis = ef.Diagnosis != null ? ef.Diagnosis : "";
                    encounterFormModel.TreatmentPlan = ef.TreatmentPlan != null ? ef.TreatmentPlan : "";
                    encounterFormModel.MedicationsDispensed = ef.MedicationsDispensed != null ? ef.MedicationsDispensed : "";
                    encounterFormModel.Procedures = ef.Procedures != null ? ef.Procedures : "";
                    encounterFormModel.Followup = ef.FollowUp != null ? ef.FollowUp : "";
                    encounterFormModel.IsFinalize = ef.IsFinalize;
                }
                   
                
                return encounterFormModel;
            }
            return new EncounterFormViewModel();
            
                    
        }
        public void SaveEncounterForm(EncounterFormViewModel encFormModel) 
        {
            var request = _context.Requests.Where(x => x.Requestid == encFormModel.Requestid).FirstOrDefault();
            EncounterForm encForm= _context.EncounterForms.Where(x => x.Requestid == encFormModel.Requestid).FirstOrDefault();
            if (request!=null && encForm == null)
            {
                EncounterForm form = new();
                form.Requestid = request.Requestid;
                form.HistoryOfPresentIllnessOrInjury = encFormModel.HistoryOfIllness;
                form.MedicalHistory = encFormModel.MedicalHistory;
                form.Medications = encFormModel.Medications;
                form.Allergies = encFormModel.Allergies;
                form.Temp = encFormModel.Temp;
                form.Hr = encFormModel.HR;
                form.Rr = encFormModel.RR;
                form.BloodPressureDiastolic = encFormModel.BloodPressureDia;
                form.BloodPressureSystolic = encFormModel.BloodPressureSys;
                form.O2 = encFormModel.O2;
                form.Pain = encFormModel.Pain;
                form.Heent = encFormModel.Heent;
                form.Cv = encFormModel.CV;
                form.Chest = encFormModel.Chest;
                form.Abd = encFormModel.ABD;
                form.Extremeties = encFormModel.Extremeties;
                form.Skin = encFormModel.Skin;
                form.Neuro = encFormModel.Neuro;
                form.Other = encFormModel.Other;
                form.Diagnosis = encFormModel.Diagnosis;
                form.TreatmentPlan = encFormModel.TreatmentPlan;
                form.MedicationsDispensed = encFormModel.MedicationsDispensed;
                form.Procedures = encFormModel.Procedures;
                form.FollowUp = encFormModel.Followup;

                //admin id is to be taken
                form.PhysicianId = request.Physicianid;
                form.IsFinalize = false;

                _context.Add(form);
                _context.SaveChanges();
            }
            else if(request != null && encForm != null)
            {
                encForm.Requestid = encFormModel.Requestid;
                encForm.HistoryOfPresentIllnessOrInjury = encFormModel.HistoryOfIllness;
                encForm.MedicalHistory = encFormModel.MedicalHistory;
                encForm.Medications = encFormModel.Medications;
                encForm.Allergies = encFormModel.Allergies;
                encForm.Temp = encFormModel.Temp;
                encForm.Hr = encFormModel.HR;
                encForm.Rr = encFormModel.RR;
                encForm.BloodPressureDiastolic = encFormModel.BloodPressureDia;
                encForm.BloodPressureSystolic = encFormModel.BloodPressureSys;
                encForm.O2 = encFormModel.O2;
                encForm.Pain = encFormModel.Pain;
                encForm.Heent = encFormModel.Heent;
                encForm.Cv = encFormModel.CV;
                encForm.Chest = encFormModel.Chest;
                encForm.Abd = encFormModel.ABD;
                encForm.Extremeties = encFormModel.Extremeties;
                encForm.Skin = encFormModel.Skin;
                encForm.Neuro = encFormModel.Neuro;
                encForm.Other = encFormModel.Other;
                encForm.Diagnosis = encFormModel.Diagnosis;
                encForm.TreatmentPlan = encFormModel.TreatmentPlan;
                encForm.MedicationsDispensed = encFormModel.MedicationsDispensed;
                encForm.Procedures = encFormModel.Procedures;
                encForm.FollowUp = encFormModel.Followup;

                //admin id is to be taken
                encForm.PhysicianId = request.Physicianid;
                encForm.IsFinalize = false;

                _context.Update(encForm);
                _context.SaveChanges();
            }
            
        }
    }
}
