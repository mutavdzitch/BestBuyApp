using Implementation.Validators;
using FluentValidation.Results;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;

namespace Implementation.Validators
{
    public static class ApiExtensions
    {
        public static UnprocessableEntityObjectResult AsUnprocessableEntity(this ValidationResult result)
        {
            var errorMessages = result.Errors.Select(x => new ClientError
            {
                PropertyName = x.PropertyName,
                ErrorMessage = x.ErrorMessage
            });

            return new UnprocessableEntityObjectResult(new
            {
                Errors = errorMessages
            });
        }
    }
}
