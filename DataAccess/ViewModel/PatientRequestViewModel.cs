using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess.DataModels;
using Microsoft.AspNetCore.Http;
using Npgsql.Internal.TypeHandlers.DateTimeHandlers;

namespace DataAccess.ViewModel
{
    public class PatientRequestViewModel
    {
        public string? Symptoms { get; set; }
        [DataType(DataType.Password)]
        public string? Password {  get; set; }
        [DataType(DataType.Password)]
        [Compare("Password", ErrorMessage = "Password and Confirm Password do not match")]
        public string? ConfirmPassword {  get; set; }
        [Required]
        public string Firstname { get; set; }
        [Required]
        public string? Lastname { get; set; }
        [DataType(DataType.Date)]
        public DateOnly DOB {  get; set; }
        [Required]
        [DataType(DataType.EmailAddress, ErrorMessage = "Enter email in correct format (example@email.com)")]
        public string Email { get; set; }
        [DataType(DataType.PhoneNumber, ErrorMessage = "Enter phone number in correct format")]
        public string Phone { get; set; }
        public string? Street { get; set; }
        public string? City { get; set; }
        public string? State { get; set; }
        public string? Zip { get; set; }
        public string? RoomNum { get; set; }
        
        public IFormFile? File {  get; set; }
    }
}
