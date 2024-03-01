using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.ViewModel
{
    public class PatientsListViewModel
    {
        public string Name { get; set; }

        [DataType(DataType.Date)]
        [DateNotInFutureAttribute(ErrorMessage = "Birthdate cannot be in future")]
        public string? DOB { get; set; }
        public string? Requestor { get; set; }

        public string RequestedDate { get; set; }
        [DataType(DataType.PhoneNumber, ErrorMessage = "Enter phone number in correct format")]
        public string? PhoneNumber { get; set; }
        public string? Address { get; set; }
        public string? Notes { get; set; }
        public int RequestTypeId { get; set; }
        public string? OtherPhoneNumber { get; set; }
        public string? OtherName { get; set; }
        public int Status { get; set; }
        public string? RegionId { get; set; }
        public int Count { get; set; }
        public int RequestId { get; set; }
        public string? Region {  get; set; }
        public string Email { get; set; }
    }
}
