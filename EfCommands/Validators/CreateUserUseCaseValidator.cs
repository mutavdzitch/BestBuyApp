using Application.DataTransfer;
using Domain;
using EfDataAccess;
using FluentValidation;
using Microsoft.EntityFrameworkCore.Internal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validators
{
    public class CreateUserUseCaseValidator : AbstractValidator<UserUseCaseDto>
    {
        private readonly BestBuyContext context;

        public CreateUserUseCaseValidator(BestBuyContext context)
        {
            this.context = context;

            RuleFor(x => x.UserId)
                .NotEmpty().WithMessage("User is required.")
                .DependentRules(() =>
                {
                    RuleFor(x => x.UserId)
                    .Must(UserExists).WithMessage(x => $"User with an id of {x.UserId} doesn't exist.")

                    .Must((dto, userid) => !context.UserUseCases.Any(
                            x => x.UserId == userid && x.UseCaseId == dto.UseCaseId && x.Id != dto.Id))
                        .WithMessage(x => $"User with an id of {x.UserId} already has use case {x.UseCaseId}.");
                });
        }
        private bool UserExists(int userId)
        {
            return context.UserUseCases.Any(x => x.UserId == userId);
        }
    }
}
