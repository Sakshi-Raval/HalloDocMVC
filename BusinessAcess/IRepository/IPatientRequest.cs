﻿using DataAccess.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic.IRepository
{
    public interface IPatientRequest
    {
        public void CreatePatientRequest(PatientRequestViewModel model);
        public int PatientRequestAdmin(PatientRequestViewModel patientRequestViewModel,string email);
    }
}
