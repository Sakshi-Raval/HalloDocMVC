using BusinessLogic.IRepository;
using DataAccess.DataContext;
using DataAccess.ViewModel;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
                                                    new DateOnly((int)reqClient.Intyear, int.Parse(reqClient.Strmonth), (int)reqClient.Intdate).ToString("MMM dd,yyyy") :
                                                    "---",
                                            Requestor = (req.Firstname) + " " + (req.Lastname ?? ""),
                                            RequestedDate = req.Createddate.ToString("MMM dd, yyyy") + DateTime.Now.Subtract(req.Createddate).ToString(),
                                            PhoneNumber = reqClient.Phonenumber,
                                            OtherPhoneNumber = req.Phonenumber,
                                            Address = (reqClient.Street ?? "") + " " + (reqClient.City ?? "") + " " + (reqClient.State ?? "") + " " + (reqClient.Zipcode ?? ""),
                                            Notes = reqClient.Notes ?? "---",
                                            RequestTypeId = req.Requesttypeid,
                                            Status = req.Status,
                                            RegionId = reqClient.Regionid.ToString() ?? " ",
                                        }
                                        ).Where(item => (string.IsNullOrEmpty(SearchValue) || item.Name.ToLower().Contains(SearchValue.ToLower()))
                                        && (string.IsNullOrEmpty(districtSelect) || item.RegionId == districtSelect) 
                                        && (string.IsNullOrEmpty(selectedFilter) || item.RequestTypeId == int.Parse(selectedFilter))).ToList();
            var count = newPatientsViewModel.Count();
            
          
            return newPatientsViewModel;

            
           
        }

      
    }
}
