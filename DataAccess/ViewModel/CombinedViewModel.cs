using DataAccess.DataModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.ViewModel
{
    public class CombinedViewModel
    {
        MedicalHistoryViewModel MedicalHistoryViewModel { get; set; }
        User User {  get; set; }
    }
}
