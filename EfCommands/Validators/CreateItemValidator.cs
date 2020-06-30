using Application.DataTransfer;
using EfDataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validators
{
    public class CreateItemValidator : AbstractValidator<ItemDto>
    {
        private readonly BestBuyContext context;
        public CreateItemValidator(BestBuyContext context)
        {
            this.context = context;

            RuleFor(x => x.StockId)
               .Must(StockExists).WithMessage(x => $"Stock with an id of {x.StockId} doesn't exist.")
               .DependentRules(() =>
               {
                   RuleFor(x => x.Quantity)

                    .GreaterThan(0).WithMessage("Quantity must be greater than 0.")
                    .LessThan(6).WithMessage("The maximum quantity must not exceed 5.")

                    .Must(StockQuantityAvailable).WithMessage("Quantity is unavailable.");
               });

        }
        private bool StockExists(int? stockId)
        {
            return context.Stocks.Any(x => x.Id == stockId);
        }
        private bool StockQuantityAvailable(ItemDto dto, int quantity)
        {
            return context.Stocks.Find(dto.StockId).Quantity >= quantity;
            //.Any(x => x.Id == dto.StockId && x.Quantity > quantity);
        }
    }
}
