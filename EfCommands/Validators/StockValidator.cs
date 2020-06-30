using Application.DataTransfer;
using Domain;
using EfDataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Implementation.Validators
{
    public class StockValidator : AbstractValidator<StockDto>
    {
        private readonly BestBuyContext context;
        public StockValidator(BestBuyContext context)
        {
            this.context = context;

            RuleFor(x => x.Quantity)
                .GreaterThan(0).WithMessage("Quantity must be greater than 0.")
                .LessThan(100000).WithMessage("The maximum quantity must not exceed 99999.");

            RuleFor(x => x.Price)
               .GreaterThan(0).WithMessage("Price must be greater than 0,00 RSD.")
               .LessThan(1000000).WithMessage("Price must be less than 1.000.000,00 RSD.");

            RuleFor(x => x.Discount)
               .LessThan(100).WithMessage("Discount must be less than 100%.");

            RuleFor(x => x.StoreId)
                .NotEmpty().WithMessage("Store is required.")
                .DependentRules(() =>
                {
                    RuleFor(x => x.StoreId)
                        .Must(StoreExists).WithMessage(x => $"Store with an id of {x.StoreId} doesn't exist.")

                        ///Ne sme postojati stock sa istim proizvodom za istu prodavnicu
                        .Must((dto, storeid) => !context.Stocks.Any(
                            x => x.StoreId == storeid && x.ProductId == dto.ProductId && x.Id != dto.Id))
                        .WithMessage(x => $"Stock with the store {x.StoreId} and product {x.ProductId} already exists.");
                });


            RuleFor(x => x.ProductId)
                .NotEmpty().WithMessage("Product is required.")
                .DependentRules(()=>
                {
                    RuleFor(x => x.ProductId)
                    .Must(ProductExists).WithMessage(x => $"Product with an id of {x.ProductId} doesn't exist.");
                });
        }
        private bool StoreExists(int storeId)
        {
            return context.Stores.Any(x => x.Id == storeId);
        }
        private bool ProductExists(int productId)
        {
            return context.Products.Any(x => x.Id == productId);
        }
    }
}
