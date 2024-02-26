using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.ViewModel
{
    public class CaseViewModel
    {
        public string PatientNotes { get; set; }
        public string ConfirmNum { get; set; }
        public string Firstname { get; set; }
        public string? Lastname { get; set; }
        public DateOnly DOB { get; set; }
        public string Phonenumber { get; set; }
        public string Email { get; set; }
        public string? Region { get; set; }
        public string? Address { get; set; }
        public string? RoomNum { get; set; }
        public int Status { get; set; }
    }
}
