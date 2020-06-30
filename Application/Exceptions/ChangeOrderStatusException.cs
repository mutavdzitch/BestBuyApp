using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Exceptions
{
    public class ChangeOrderStatusException : Exception
    {
        public ChangeOrderStatusException(string message)
            : base($"Status change is not allowed. {message}")
        {

        }
    }
}
