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
        public void SendEmailAsync(string email, string subject, string message)
        {

            //var client = new SmtpClient("smtp.office365.com", 587)
            //{
            //    EnableSsl = true,
            //    UseDefaultCredentials = false,
            //    Credentials = new NetworkCredential("tatva.dotnet.sakshiraval@outlook.com", "sakshi25@raval")
            //};

            //return client.SendMailAsync(
            //    new MailMessage(from: "tatva.dotnet.sakshiraval@outlook.com",
            //                    to: email,
            //                    subject,
            //                    message
            //                    ));


            SmtpClient smtpClient = new SmtpClient("smtp.office365.com")
            {
                Port = 587,
                Credentials = new NetworkCredential("tatva.dotnet.sakshiraval@outlook.com", "sakshi25@raval"),
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false
            };

            // Create the MailMessage object
            MailMessage mail = new MailMessage("tatva.dotnet.sakshiraval@outlook.com", email, subject, message);

            try
            {
                // Send the email
                smtpClient.Send(mail);
                Console.WriteLine("Email sent successfully!");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error sending email: {ex.Message}");
            }
        }
    }
}

