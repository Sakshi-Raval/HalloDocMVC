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
        public string? Password {  get; set; }
        public string? ConfirmPassword {  get; set; }
        [Required]
        public string Firstname { get; set; }
        public string? Lastname { get; set; }
        public DateOnly? DOB {  get; set; }
        [Required]
        public string Email { get; set; }
        public string Phone { get; set; }
        public string? Street { get; set; }
        public string? City { get; set; }
        public string? State { get; set; }
        public string? Zip { get; set; }
        public string? RoomNum { get; set; }
        public IFormFile? File {  get; set; }
    }
}
