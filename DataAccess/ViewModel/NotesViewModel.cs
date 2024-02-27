using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.ViewModel
{
    public class NotesViewModel
    {
        public string? TransferNotes { get; set; }
        public string? PhysicianNotes { get; set; }
        public string? AdminNotes { get; set; }
        public string? AdditionalNotes { get; set; }
        public string? AdminCancelNotes { get; set; }
        public string? PatientCancelNotes { get; set; }
    }
}
