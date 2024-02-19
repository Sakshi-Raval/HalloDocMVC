using DataAccess.DataContext;
using DataAccess.DataModels;
using DataAccess.ViewModel;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic.IRepository
{
    
    public interface IPatient 
    {
        public List<MedicalHistoryViewModel> GetRequestRecords(string email);
        public List<ViewDocumentsViewModel> GetDocuments(int requestId);
        public User UpdateUser(UserProfileViewModel model, string email);
        public void SubmitReqMe(PatientRequestViewModel model, int userid);
        public void SubmitReqElse(OtherRequestViewModel model, User userModel);


    }
}
