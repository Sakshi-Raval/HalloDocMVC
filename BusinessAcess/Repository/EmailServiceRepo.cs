using BusinessLogic.IRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic.Repository
{
    public class EmailServiceRepo : IEmailService
    {
        public Task SendEmailAsync(string email, string subject, string message)
        {

            var client = new SmtpClient("smtp.office365.com", 587)
            {
                EnableSsl = true,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential("tatva.dotnet.sakshiraval@outlook.com", "sakshi25@raval")
            };

            return client.SendMailAsync(
                new MailMessage(from: "tatva.dotnet.sakshiraval@outlook.com",
                                to: email,
                                subject,
                                message
                                ));
        }
    }
}

