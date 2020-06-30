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
    public class UpdateBrandValidator : AbstractValidator<BrandDto>
    {
        private readonly BestBuyContext context;
        public UpdateBrandValidator(BestBuyContext context)
        {
            this.context = context;

            RuleFor(x => x.Name)
                .NotEmpty().WithMessage("Name is required.")
                .DependentRules(() =>
                {
                    RuleFor(x => x.Name)
                    .MinimumLength(2).WithMessage("Name must have minimum 2 characters.")
                    .MaximumLength(30).WithMessage("Name must have maximum 20 characters.")

                    .Must((dto, name) => !context.Brands.Any(x => x.Name == name && x.Id != dto.Id))
                    .WithMessage(x => $"Brand with the name of {x.Name} already exists.");
                });
        }

    }
}
