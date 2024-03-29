﻿using Microsoft.AspNetCore.Http;
using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.ViewModel
{
    public class CreateProviderViewModel
    {
        [Required]
        public string Username { get; set; }
        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }
        public string Role {  get; set; }
        public string? Status { get; set; }
        public int? Physicianid {  get; set; }

        [Required]
        public string Firstname { get; set; }
        public string? Lastname { get; set; }
        [Required]
        [DataType(DataType.EmailAddress)]
        public string Email {  get; set; }
        public string? Phone { get; set; }
        public string? MedLicense { get; set; }
        public string? NPINum {  get; set; }
        [Required(ErrorMessage = "Select Atleast one Region")]
        public List<int> PhysicianRegions { get; set; }

        public string? Address1 { get; set; }
        public string? Address2 { get; set; }
        public string? City { get; set; }
        public string? State { get; set; }
        public string? Zip {  get; set; }
        public string? BillingPhone {  get; set; }

        [Required]
        public string BusinessName {  get; set; }
        [Required]
        [Url(ErrorMessage ="Invalid Website Url")]
        public string BusinessWebsite {  get; set; }
        public string? AdminNotes {  get; set; }

        [AllowedExtensionsAttribute(".jpg",".jpeg",".png",ErrorMessage ="Only jpg, jpeg and png files are allowed.")]
        public IFormFile? Photo {  get; set; }
        public string? PhotoPath { get; set; }
        [AllowedExtensionsAttribute(".pdf", ErrorMessage = "Only pdf files are allowed.")]
        public IFormFile? ICA {  get; set; }
        [AllowedExtensionsAttribute(".pdf", ErrorMessage = "Only pdf files are allowed.")]
        public IFormFile? BackgroundCheck {  get; set; }
        [AllowedExtensionsAttribute(".pdf", ErrorMessage = "Only pdf files are allowed.")]
        public IFormFile? HIPAA {  get; set; }
        [AllowedExtensionsAttribute(".pdf", ErrorMessage = "Only pdf files are allowed.")]
        public IFormFile? NonDisclosure {  get; set; }

        [DataType(DataType.EmailAddress)]
        public string? SyncEmail { get; set; }
        public string? SignaturePath { get; set; }
        public string? Signature { get; set; }
        public BitArray? IsAgreementDoc { get; set; }
        public BitArray? IsBackgroundDoc { get; set; }
        public BitArray? IsHippaDoc { get; set; }
        public BitArray? IsNonDisclosureDoc{ get; set; }
        public BitArray? IsLicenseDoc { get; set; }

    }

    public class AllowedExtensionsAttribute : ValidationAttribute
    {
        private readonly string[] _extensions;

        public AllowedExtensionsAttribute(params string[] extensions)
        {
            _extensions = extensions;
        }
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            if (value is IFormFile file)
            {
                var extension = Path.GetExtension(file.FileName);
                if (!IsValidExtension(extension))
                {
                    return new ValidationResult("Only JPG and PNG files are allowed.");
                }
            }
            return ValidationResult.Success;
        }
        private bool IsValidExtension(string extension)
        {
            return Array.Exists(_extensions, e => e.Equals(extension, StringComparison.OrdinalIgnoreCase));
        }
    }
}
