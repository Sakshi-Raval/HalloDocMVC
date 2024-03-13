using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.ViewModel
{
    public class NotesViewModel
    {
        //    public List<string?> TransferNotes { get; set; }
        //    public List<string?> PhysicianNotes { get; set; }
        //    public List<string?> AdminNotes { get; set; }
        //    public List<string?> AdditionalNotes { get; set; }
        //    public List<string?> AdminCancelNotes { get; set; }
        //    public List<string?> PatientCancelNotes { get; set; }

        public string? TransferNotes { get; set; }
        public string? AdminName { get; set; }
        public string? PhysicianName { get; set; }
        public int? TransToPhysicianId { get; set; }
        public string? PhysicianNotes { get; set; }
        public string? AdminNotes { get; set; }
        public string? AdditionalNotes { get; set; }
        public string? AdminCancelNotes { get; set; }
        public string? PatientCancelNotes { get; set; } 
        public int? Status { get; set; }
        public int? Cancelcount { get; set; }


    }
}
