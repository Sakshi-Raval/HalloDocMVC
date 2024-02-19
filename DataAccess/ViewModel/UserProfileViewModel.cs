using DataAccess.DataModels;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.ViewModel
{
    public class UserProfileViewModel
    {
        [Required]
        public string Firstname { get; set; }
        [Required]
        public string? Lastname { get; set; }
        [DataType(DataType.Date)]
        public DateOnly DOB { get; set; }
        [Required]
        [DataType(DataType.EmailAddress, ErrorMessage = "Enter email in correct format (example@email.com)")]
        public string Email { get; set; }
        [DataType(DataType.PhoneNumber, ErrorMessage = "Enter phone number in correct format")]
        public string Phone { get; set; }
        public string? Street { get; set; }
        public string? City { get; set; }
        public string? State { get; set; }
        public string? Zip { get; set; }

    }
}
