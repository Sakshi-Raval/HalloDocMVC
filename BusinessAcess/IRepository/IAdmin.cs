﻿using DataAccess.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic.IRepository
{
    public interface IAdmin
    {
        public List<NewPatientsViewModel> GetNewPatients();
    }
}
