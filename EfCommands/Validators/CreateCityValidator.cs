using Application.DataTransfer;
using FluentValidation;
using System;
using EfDataAccess;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Linq;

namespace Implementation.Validators
{
    public class CreateCityValidator : AbstractValidator<CityDto>
    {
        private readonly BestBuyContext context;

        public CreateCityValidator(BestBuyContext context)
        {
            this.context = context;

            RuleFor(x => x.Name)
                .NotEmpty().WithMessage("Name is required.")
                .DependentRules(() =>
                {
                    RuleFor(x => x.Name)
                    .MinimumLength(2).WithMessage("Name must have minimum 2 characters.")
                    .MaximumLength(20).WithMessage("Name must have maximum 20 characters.")

                    .Must(name => !context.Cities.Any(x => x.Name == name))
                    .WithMessage(x => $"City with the name of {x.Name} already exists.");
                });

            RuleFor(x => x.PostalCode)
                .InclusiveBetween(10000, 99999).WithMessage("Postal code must be five digits number.")
                .Must(postalCode => !context.Cities.Any(x => x.PostalCode == postalCode))
                .WithMessage(x => $"City with the postal code of {x.PostalCode} already exists.");
        }

    }
}
