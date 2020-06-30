using Application.Commands;
using Application.Exceptions;
using Domain;
using EfDataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Commands
{
    public class EfDeleteOrderCommand : IDeleteOrderCommand
    {
        private readonly BestBuyContext _context;

        public EfDeleteOrderCommand(BestBuyContext context)
        {
            _context = context;
        }

        public int Id => 44;

        public string Name => "Cancel Order using EF";

        public void Execute(int request)
        {
            var order = _context.Orders
                 .Include(x => x.OrderItems)
                     .ThenInclude(x => x.Stock)
                 .Where(x => x.Id == request).FirstOrDefault();

            if (order == null)
            {
                throw new EntityNotFoundException(request, typeof(Order));
            }

            if(order.Status == OrderStatus.Canceled)
            {
                //Ako je status vec Canceled saljemo mu prividno da ta porudzbina ne postoji.
                throw new EntityNotFoundException(request, typeof(Order));
            }

            //Ne brisemo, vec otkazujemo.
            order.Status = OrderStatus.Canceled;
            //Vracamo quantity u Stock
            foreach (var item in order.OrderItems)
            {
                item.Stock.Quantity += item.Quantity;
            }
            _context.SaveChanges();
        }
    }
}
