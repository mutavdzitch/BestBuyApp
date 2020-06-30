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
    public class CreateOrderValidator : AbstractValidator<OrderDto>
    {
        private readonly BestBuyContext context;

        public CreateOrderValidator(BestBuyContext context)
        {
            this.context = context;

            RuleFor(x => x.OrderDate)
                .GreaterThan(DateTime.Now.AddDays(1)).WithMessage("Order date must be greater than 2 days from today.")
                .LessThan(DateTime.Now.AddDays(30)).WithMessage("Order date must be less than 30 days from today.");

            RuleFor(x => x.Address)
                .NotEmpty().WithMessage("Address is required.")
                .DependentRules(() =>
                {
                    RuleFor(x => x.Address)
                    .MinimumLength(2).WithMessage("Address must have minimum 2 characters.")
                    .MaximumLength(50).WithMessage("Address must have maximum 50 characters.");
                });

            RuleFor(x => x.DelivererId)
                .NotEmpty().WithMessage("Deliverer is required.")
                .DependentRules(() => {
                    RuleFor(x => x.DelivererId)
                    .Must(DelivererExists).WithMessage(x => $"Deliverer with an id of {x.DelivererId} doesn't exist.");
                });
                

            RuleFor(x => x.Items)
                .NotEmpty().WithMessage("Order must contain at least one item.")
                .Must(i => i.Select(x => x.StockId).Distinct().Count() == i.Count())
                .WithMessage("Duplicate products are not allowed.")
                .DependentRules(() =>
                {
                    //Da prodje i validira svaku od stavki u porudzbini
                    RuleForEach(x => x.Items).SetValidator(new CreateItemValidator(context));
                });
        }
        
        private bool DelivererExists(int delivererId)
        {
            return context.Deliverers.Any(x => x.Id == delivererId);
        }
    }
}
