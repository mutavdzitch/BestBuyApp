using Application;
using Application.Commands;
using Application.DataTransfer;
using AutoMapper;
using Domain;
using EfDataAccess;
using FluentValidation;
using Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands
{
    public class EfCreateOrderCommand : ICreateOrderCommand
    {
        private readonly BestBuyContext _context;
        private readonly CreateOrderValidator _validator;
        private readonly IMapper _mapper;
        private readonly IApplicationActor _actor;

        public EfCreateOrderCommand(BestBuyContext context, CreateOrderValidator validator, IMapper mapper, IApplicationActor actor)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
            _actor = actor;
        }

        public int Id => 41;

        public string Name => "Create new Order using EF";

        public void Execute(OrderDto request)
        {
            _validator.ValidateAndThrow(request);

            //Pravi porudzbinu
            var order = new Order
            {
                UserId = _actor.Id,
                Address = request.Address,
                OrderDate = request.OrderDate,
                DelivererId = request.DelivererId
            };

            //Pravimo stavke porudzbine i pravimo izmene na stanju
            foreach (var item in request.Items)
            {
                
                var stock = _context.Stocks.Find(item.StockId);

                //Menjamo stanje za taj stock
                stock.Quantity -= item.Quantity;

                //U kolekciju stavki dodajemo jednu po jednu stavku
                order.OrderItems.Add(new Item
                {
                    StockId = item.StockId,
                    Quantity = item.Quantity,
                    Price = stock.Price - (decimal)Math.Round((decimal)stock.Price * stock.Discount / 100, 2)
                    //Posto je clan kolekcije sam ce zakljuciti koji je order id
                });
            }

            _context.Orders.Add(order);
            _context.SaveChanges();
        }
    }
}
