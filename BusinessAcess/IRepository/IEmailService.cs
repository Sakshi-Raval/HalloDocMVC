using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;

namespace BusinessLogic.IRepository
{
    public interface IEmailService
        {
        public void SendEmailAsync(string email, string subject, string message, List<Attachment> attachmets=null);
    }
}

    

