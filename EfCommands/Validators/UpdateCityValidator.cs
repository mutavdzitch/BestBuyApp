using Application.DataTransfer;
using EfDataAccess;
using FluentValidation;
using Microsoft.EntityFrameworkCore.Internal;
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;

namespace Implementation.Validators
{
    public class UpdateCityValidator : AbstractValidator<CityDto>
    {
        private readonly BestBuyContext context;

        public UpdateCityValidator(BestBuyContext context)
        {
            this.context = context;

            RuleFor(x => x.Name)
                .NotEmpty().WithMessage("Name is required.")
                .DependentRules(() => 
                {
                    RuleFor(x => x.Name)
                    .MinimumLength(2).WithMessage("Name must have minimum 2 characters.")
                    .MaximumLength(20).WithMessage("Name must have maximum 20 characters.")

                    .Must((dto, name) => !context.Cities.Any(x => x.Name == name && x.Id != dto.Id))
                    .WithMessage(x => $"City with the name of {x.Name} already exists.");
                });

            RuleFor(x => x.PostalCode)
                .InclusiveBetween(10000, 99999).WithMessage("Postal code must be five digits number.")

                .Must((dto, postalCode) => !context.Cities.Any(x => x.PostalCode == postalCode && x.Id != dto.Id))
                .WithMessage(x => $"City with the postal code of {x.PostalCode} already exists.");
        }
    }
}
