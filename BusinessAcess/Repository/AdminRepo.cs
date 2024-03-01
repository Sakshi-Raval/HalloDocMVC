using BusinessLogic.IRepository;
using DataAccess.DataContext;
using DataAccess.DataModels;
using DataAccess.ViewModel;
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
                                        join reqStatusLog in _context.Requeststatuslogs
                                        on req.Requestid equals reqStatusLog.Requestid into statusLogs
                                        from statusLog in statusLogs.DefaultIfEmpty()
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
                                            Notes = statusLog.Notes ?? "---",
                                            RequestTypeId = req.Requesttypeid,
                                            Status = req.Status,
                                            RegionId = reqClient.Regionid.ToString() ?? " ",
                                            Region = _context.Regions.Where(x => x.Regionid == reqClient.Regionid).FirstOrDefault().Name ?? "",
                                            RequestId = req.Requestid,
                                            Email = reqClient.Email ?? "",
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


                                 }
                                 ).FirstOrDefault();
            return caseViewModel;

        }
        public List<NotesViewModel> ViewNotes(int requestid)
        {
            var notesViewModel = (from req in _context.Requests
                                  join reqNotes in _context.Requestnotes
                                  on req.Requestid equals reqNotes.Requestid into rnJoin
                                  from reqNotes in rnJoin.DefaultIfEmpty()
                                  join reqLog in _context.Requeststatuslogs
                                  on req.Requestid equals reqLog.Requestid into rlJoin
                                  from reqLog in rlJoin.DefaultIfEmpty()
                                  where req.Requestid == requestid
                                  select new NotesViewModel
                                  {
                                      AdminNotes = reqNotes.Adminnotes ?? "--",
                                      PhysicianNotes = reqNotes.Physiciannotes ?? "--",
                                      TransferNotes = reqLog.Notes ?? "--",  

                                  }
                                 ).ToList();
            return notesViewModel;
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

    }
}
