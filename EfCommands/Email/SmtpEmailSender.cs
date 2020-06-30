using Application.Email;
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Mail;
using System.Text;

namespace Implementation.Email
{
    public class SmtpEmailSender : IEmailSender
    {
        public void Send(SendEmailDto dto)
        {
            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential("testappmailmarko@gmail.com", "sifra123")
            };

            var message = new MailMessage("testappmailmarko@gmail.com", dto.SendTo);
            message.Subject = dto.Subject;
            message.Body = dto.Body;
            message.IsBodyHtml = true;
            smtp.Send(message);
        }
    }
}
