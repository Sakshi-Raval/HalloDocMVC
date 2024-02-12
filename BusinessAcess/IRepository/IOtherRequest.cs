using DataAccess.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic.IRepository
{
    public interface IOtherRequest
    {
        public void CreateOtherRequest(OtherRequestViewModel model);
    }
}
