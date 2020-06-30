using Application;
using Application.Commands;
using Application.DataTransfer;
using Application.Exceptions;
using AutoMapper;
using Domain;
using EfDataAccess;
using FluentValidation;
using Implementation.Validators;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;

namespace Implementation.Commands
{
    public class EfUpdateOrderCommand : IUpdateOrderCommand
    {
        private readonly BestBuyContext _context;
        private readonly CreateOrderValidator _validator;
        private readonly IMapper _mapper;
        private readonly IApplicationActor _actor;

        public EfUpdateOrderCommand(BestBuyContext context, IMapper mapper, CreateOrderValidator validator, IApplicationActor actor)
        {
            _context = context;
            _mapper = mapper;
            _validator = validator;
            _actor = actor;
        }

        public int Id => 44;

        public string Name => "Update Order using EF";

        public void Execute(OrderDto request)
        {
            var order = _context.Orders
                .Include(x => x.OrderItems)
                    .ThenInclude(x => x.Stock)
                .Where(x => x.Id == request.Id).FirstOrDefault();

            if (order == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Order));
            }

            _validator.ValidateAndThrow(request);

            order.UserId = _actor.Id;
            order.Address = request.Address;
            order.OrderDate = request.OrderDate;

            if(order.Status == OrderStatus.Shipped || order.Status == OrderStatus.Delivered)
            {
                throw new ArgumentException("Deliverer change is not allowed.");
            }
            else
            {
                order.DelivererId = request.DelivererId;
            }

            foreach (var item in request.Items)
            {
                var stock = _context.Stocks.Find(item.StockId);

                //Menjamo stanje za taj stock
                int remainder;
                foreach(var orderitem in order.OrderItems)
                {
                    if(orderitem.Id == item.Id)
                    {
                        if (item.Quantity < orderitem.Quantity)
                        {
                            remainder = orderitem.Quantity - item.Quantity;
                            stock.Quantity += remainder;
                        }
                        if (item.Quantity > orderitem.Quantity)
                        {
                            remainder = item.Quantity - orderitem.Quantity;
                            stock.Quantity -= remainder;
                        }

                        orderitem.StockId = item.StockId;
                        orderitem.Quantity = item.Quantity;
                        orderitem.Price = stock.Price - (decimal)Math.Round((decimal)stock.Price * stock.Discount / 100, 2);

                    }
                }
            }

            _context.SaveChanges();
        }
    }
}
