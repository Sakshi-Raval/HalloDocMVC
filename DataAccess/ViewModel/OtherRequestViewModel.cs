using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.ViewModel
{
    public class OtherRequestViewModel
    {
        [Required]
        public string OtherFirstname { get; set; }
        public string? OtherLastname { get; set; }
        
        [Required]
        [DataType(DataType.EmailAddress)]
        public string OtherEmail { get; set; }
        public string OtherPhone { get; set; }
        public string? Relation { get; set; }
        public ViewModel.PatientRequestViewModel? patientRequest;

        
    }
}
