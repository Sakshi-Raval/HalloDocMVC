using BusinessLogic.IRepository;
using DataAccess.DataContext;
using DataAccess.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic.Repository
{
    public class PatientRepo : IPatient
    {
        private readonly ApplicationDbContext _context;
        public PatientRepo(ApplicationDbContext context) {
            _context = context;
        }
        public List<MedicalHistoryViewModel> GetRequestRecords(string email)
        {
           var medicalHistoryViewModel = (from req in _context.Requests
                   join reqFile in _context.Requestwisefiles
                   on req.Requestid equals reqFile.Requestid into fileGroup
                   where req.Email == email
                   from reqFile in fileGroup.DefaultIfEmpty()
                          //group fileGroup by new {req.Requestid} into g   
                   select new MedicalHistoryViewModel
                   {
                        CreatedDate = req.Createddate.ToString("MMM dd, yyyy"),
                        Status = req.Status,
                        DocumentCount = fileGroup.Count(),
                        requestid = req.Requestid,
                        Name = "Sakshi"
                   });
            return (medicalHistoryViewModel.ToList());

            
        }

        public List<ViewDocumentsViewModel> GetDocuments(int requesetId)
        {
            return ((from reqFile in _context.Requestwisefiles
                     join req in _context.Requests
                     on reqFile.Requestid equals req.Requestid
                     where req.Requestid == requesetId
                    select new ViewDocumentsViewModel
                     {
                         Filename = reqFile.Filename,
                         UploaderName = string.Concat(req.Firstname, ' ', req.Lastname),
                         CreatedDate = reqFile.Createddate.Date.ToString("MMM dd, yyyy"),
                     }).ToList());
        }
    }
}
