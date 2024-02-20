using Microsoft.AspNetCore.Http;
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
        [Display(Name = "YourFirstname")]
        public string? OtherFirstname { get; set; }
        [Display(Name = "YourLastname")]
        public string? OtherLastname { get; set; }
        
        [Required]
        [Display(Name = "YourEmail")]
        [DataType(DataType.EmailAddress, ErrorMessage = "Enter email in correct format (example@email.com)")]
        public string? OtherEmail { get; set; }
        [DataType(DataType.PhoneNumber, ErrorMessage = "Enter phone number in correct format")]
        [Display(Name = "YourPhone")]
        public string? OtherPhone { get; set; }
        public string? Relation { get; set; }
        public string? HotelName { get; set; }
        public string? BusinessName { get; set; }
        //public ViewModel.PatientRequestViewModel? patientRequest;
        public string? Symptoms { get; set; }
        
        [Required]
        public string Firstname { get; set; }
        public string? Lastname { get; set; }
        [DataType(DataType.Date)]
        public DateOnly? DOB { get; set; }
        [Required]
        [DataType(DataType.EmailAddress, ErrorMessage = "Enter email in correct format (example@email.com)")]
        public string Email { get; set; }
        [DataType(DataType.PhoneNumber, ErrorMessage ="Enter phone number in correct format")]
        public string Phone { get; set; }
        public string? Street { get; set; }
        public string? City { get; set; }
        public string? State { get; set; }
        public string? Zip { get; set; }
        public string? RoomNum { get; set; }
        public string? CaseNum { get; set; }
        public List<IFormFile>? File { get; set; }


    }
}
