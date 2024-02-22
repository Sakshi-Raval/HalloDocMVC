using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic.IRepository
{
    public interface IEmailService
        {
        public Task SendEmailAsync(string email, string subject, string message);
    }
}

    

