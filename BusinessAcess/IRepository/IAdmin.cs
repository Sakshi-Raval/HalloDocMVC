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
        public List<NewPatientsViewModel> GetPatients(string SearchValue, string districtSelect, string selectedFilter);
        public CaseViewModel ViewCase(int requestid);
        public List<NotesViewModel> ViewNotes(int requestid);
    }
}
