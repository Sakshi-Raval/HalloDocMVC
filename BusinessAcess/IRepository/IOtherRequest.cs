using DataAccess.ViewModel;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic.IRepository
{
    public interface IOtherRequest
    {
        public int CreateOtherRequest(OtherRequestViewModel model, int requestTypeId);
        public void EmailSending(IUrlHelper urlHelper, string email, int requestid, string scheme);

    }
}
