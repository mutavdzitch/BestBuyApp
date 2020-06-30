using Application.DataTransfer;
using EfDataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Implementation.Validators
{
    public class CreateStoreValidator : AbstractValidator<StoreDto>
    {
        private readonly BestBuyContext context;
        public CreateStoreValidator(BestBuyContext context)
        {
            this.context = context;

            RuleFor(x => x.Name)
                .NotEmpty().WithMessage("Name is required.")
                .DependentRules(() =>
                {
                    RuleFor(x => x.Name)
                    .MinimumLength(2).WithMessage("Name must have minimum 2 characters.")
                    .MaximumLength(50).WithMessage("Name must have maximum 20 characters.")

                    .Must(name => !context.Stores.Any(x => x.Name == name))
                    .WithMessage(x => $"Store with the name of {x.Name} already exists.");
                });

            RuleFor(x => x.Email)
                .NotEmpty().WithMessage("Email is required.")
                .DependentRules(() =>
                {
                    RuleFor(x => x.Email)
                    .EmailAddress().WithMessage("Email is not in a good format.")

                    .Must(email => !context.Stores.Any(x => x.Email == email))
                    .WithMessage(x => $"Store with the email of {x.Email} already exists.");
                });

            RuleFor(x => x.Phone)
                .NotEmpty().WithMessage("Phone number is required.")
                .DependentRules(() =>
                {
                    RuleFor(x => x.Phone)
                    .MinimumLength(9).WithMessage("Phone number must have minimum 9 characters.")
                    .MaximumLength(11).WithMessage("Phone number must have maximum 11 characters.");
                });

            RuleFor(x => x.WebSite)
                .NotEmpty().WithMessage("Web site is required.")
                .DependentRules(() =>
                {
                    RuleFor(x => x.WebSite)
                    .MinimumLength(2).WithMessage("Url must have minimum 2 characters.")
                    .MaximumLength(50).WithMessage("Url must have maximum 50 characters.");
                });

            RuleFor(x => x.Address)
                .NotEmpty().WithMessage("Address is required.")
                .DependentRules(() =>
                {
                    RuleFor(x => x.Address)
                    .MinimumLength(2).WithMessage("Address must have minimum 2 characters.")
                    .MaximumLength(50).WithMessage("Address must have maximum 50 characters.");
                });

            RuleFor(x => x.CityId)
                .NotEmpty().WithMessage("City is required.")
                .DependentRules(() =>
                {
                    RuleFor(x => x.CityId)
                    .Must(CityExists).WithMessage(x => $"City with an id of {x.CityId} doesn't exist.");
                });
        }

        private bool CityExists(int cityId)
        {
            return context.Cities.Any(x => x.Id == cityId);
        }
    }
}
