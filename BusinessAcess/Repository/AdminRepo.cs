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

        public List<NewPatientsViewModel> GetPatients(string SearchValue, string districtSelect, string selectedFilter)
        {
            var newPatientsViewModel = (from req in _context.Requests
                                        join reqClient in _context.Requestclients
                                        on req.Requestid equals reqClient.Requestid
                                        orderby req.Createddate descending
                                        select new NewPatientsViewModel
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
                                            Notes = reqClient.Notes ?? "---",
                                            RequestTypeId = req.Requesttypeid,
                                            Status = req.Status,
                                            RegionId = reqClient.Regionid.ToString() ?? " ",
                                            RequestId = req.Requestid,
                                        }
                                        ).Where(item => (string.IsNullOrEmpty(SearchValue) || item.Name.ToLower().Contains(SearchValue.ToLower()))
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
        

      
    }
}
