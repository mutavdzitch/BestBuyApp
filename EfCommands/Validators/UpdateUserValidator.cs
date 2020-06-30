using Application.DataTransfer;
using EfDataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validators
{
    public class UpdateUserValidator : AbstractValidator<UserDto>
    {
        private readonly BestBuyContext context;
        public UpdateUserValidator(BestBuyContext context)
        {
            this.context = context;

            RuleFor(x => x.FirstName)
                .NotEmpty().WithMessage("First name is required.")
                .DependentRules(() =>
                {
                    RuleFor(x => x.FirstName)
                    .MinimumLength(2).WithMessage("First name must have minimum 2 characters.")
                    .MaximumLength(30).WithMessage("First name must have maximum 30 characters.");
                });

            RuleFor(x => x.LastName)
                .NotEmpty().WithMessage("Last name is required.")
                .DependentRules(() =>
                {
                    RuleFor(x => x.LastName)
                    .MinimumLength(2).WithMessage("Last name must have minimum 2 characters.")
                    .MaximumLength(30).WithMessage("Last name must have maximum 30 characters.");
                });

            RuleFor(x => x.Email)
                .NotEmpty().WithMessage("Email is required.")
                .DependentRules(() =>
                {
                    RuleFor(x => x.Email)
                    .EmailAddress().WithMessage("Email is not in a good format.")
                    .MaximumLength(50).WithMessage("Email must have maximum 50 characters.")

                    .Must((dto, email) => !context.Users.Any(x => x.Email == email && x.Id != dto.Id))
                    .WithMessage("User with this email already exists.");
                });

            RuleFor(x => x.Password)
                .NotEmpty().WithMessage("Password is required.")
                .DependentRules(() =>
                {
                    RuleFor(x => x.Password)
                    .MinimumLength(6).WithMessage("Password must have minimum 6 characters.")
                    .MaximumLength(50).WithMessage("Password must have maximum 50 characters.");
                });

            RuleFor(x => x.Address)
                .NotEmpty().WithMessage("Address is required.")
                .DependentRules(() =>
                {
                    RuleFor(x => x.Address)
                    .MinimumLength(2).WithMessage("Address must have minimum 2 characters.")
                    .MaximumLength(50).WithMessage("Address must have maximum 50 characters.");
                });

            RuleFor(x => x.Phone)
                .NotEmpty().WithMessage("Phone number is required.")
                .DependentRules(() =>
                {
                    RuleFor(x => x.Phone)
                    .MinimumLength(9).WithMessage("Phone must have minimum 9 characters.")
                    .MaximumLength(11).WithMessage("Name must have maximum 11 characters.");
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
