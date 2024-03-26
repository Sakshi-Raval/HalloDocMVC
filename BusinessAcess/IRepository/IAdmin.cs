using DataAccess.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic.IRepository
{
    public interface IAdmin
    {
        public List<PatientsListViewModel> GetPatients(string SearchValue, string districtSelect, int[] checkFilter, int[] currentStatus);
        public CaseViewModel ViewCase(int requestid);
        public NotesViewModel ViewNotes(int requestid);
        public void CancelCase(int requestid, string cancelNotes, string reasons);
        public void AssignCase(int regions, int physician, int requestid, string description);
        public void TransferCase(int regions, int physician, int RequestID, string desc);
        public void BlockCase(int requestID, string blockReason);
        public void ClearCase(int Requestid);
        public void CloseCase(int requestid);
        public void SendOrderDetails(SendOrderViewModel model);
        public void Agreed(int id);
        public void CancelCaseByPatient(int requestid, string cancelNotes);
        public EncounterFormViewModel DisplayEncounterForm(int requestid);
        public void SaveEncounterForm(EncounterFormViewModel encFormModel);
        public AdminProfileViewModel GetAdminProfile(string email);
        public void EditAdminDetails(string oldEmail, string firstname, string lastname, string email, string phoneAdministrator, List<int> adminRegions);
        public void EditBillingDetails(string email, string address1, string address2, string city, int state, string zip, string phoneBilling);
        public List<ProviderMenuViewModel> GetProvidersList(string regionid);
        public void ProviderAccount(CreateProviderViewModel createProviderViewModel,string email);

    }
}
