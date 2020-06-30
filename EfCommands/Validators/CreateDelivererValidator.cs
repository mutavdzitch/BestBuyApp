using Application.DataTransfer;
using EfDataAccess;
using FluentValidation;
using Microsoft.EntityFrameworkCore.Internal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml.Serialization;

namespace Implementation.Validators
{
    public class CreateDelivererValidator : AbstractValidator<DelivererDto>
    {
        private readonly BestBuyContext context;

        public CreateDelivererValidator(BestBuyContext context)
        {
            this.context = context;

            RuleFor(x => x.Name)
                .NotEmpty().WithMessage("Name is required.")
                .DependentRules(() =>
                {
                    RuleFor(x => x.Name)
                    .MinimumLength(2).WithMessage("Name must have minimum 2 characters.")
                    .MaximumLength(20).WithMessage("Name must have maximum 20 characters.")

                    .Must(name => !context.Deliverers.Any(x => x.Name == name))
                    .WithMessage(x => $"Deliverer with the name of {x.Name} already exists.");
                });

            RuleFor(x => x.Price)
                .GreaterThan(0).WithMessage("Price must be greater than 0,00 RSD.")
                .LessThan(2000).WithMessage("Price must be less than 2.000,00 RSD.");
        }
    }
}
