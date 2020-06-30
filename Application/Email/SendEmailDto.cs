using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Email
{
    public class SendEmailDto
    {
        public string SendTo { get; set; }
        public string Subject { get; set; }
        public string Body { get; set; }
    }
}
