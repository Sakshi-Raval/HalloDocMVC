using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.ViewModel
{
    public class EncounterFormViewModel
    {
        public int Requestid { get; set; }
        public string? Firstname { get; set; }
        public string? Lastname { get; set; }
        public string? Location { get; set; }
        public DateOnly Birthdate { get; set; }
        public DateOnly DateOfService {  get; set; }
        [DataType(DataType.PhoneNumber)]
        public string? Phone {  get; set; }
        public string Email {  get; set; }    
        public string? HistoryOfIllness { get; set; }   
        public string? MedicalHistory {  get; set; }
        public string? Medications {  get; set; }
        public string? Allergies {  get; set; }
        public string? Temp {  get; set; }
        public string? HR {  get; set; }
        public string? RR {  get; set; }
        public string? BloodPressureSys {  get; set; }
        public string? BloodPressureDia {  get; set; }
        public string? O2 {  get; set; }
        public string? Pain {  get; set; }
        public string? Heent {  get; set; }
        public string? CV {  get; set; }
        public string? Chest {  get; set; }
        public string? ABD {  get; set; }
        public string? Extremeties {  get; set; }
        public string? Skin {  get; set; }
        public string? Neuro {  get; set; }
        public string? Other {  get; set; }
        public string? Diagnosis {  get; set; }
        public string? TreatmentPlan {  get; set; }
        public string? MedicationsDispensed {  get; set; }
        public string? Procedures {  get; set; }
        public string? Followup {  get; set; }
        public int? Adminid {  get; set; }
        public int? Physicianid {  get; set; }
        public bool IsFinalize {  get; set; }
    }
}
