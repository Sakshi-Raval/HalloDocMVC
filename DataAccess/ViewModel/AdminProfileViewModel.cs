using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.ViewModel
{
    public class AdminProfileViewModel
    {
        public string Username { get; set; }
        //public string Password { get; set; }
        public string Firstname { get; set; }
        public string? Lastname { get; set; }
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }
        [DataType(DataType.PhoneNumber)]
        public string? Phonenumber { get; set; }
        public string? Address1 { get; set; }
        public string? Address2 { get; set; }
        public string? City { get; set; }
        public string? State { get; set; }
        public string? Zip { get; set; }
        [DataType(DataType.PhoneNumber)]
        public string? BillingPhones { get; set; }
    }
}
