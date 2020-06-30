using Application.Commands;
using Application.DataTransfer;
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
    public class EfChangeOrderStatusCommand : IChangeOrderStatusCommand
    {
        private readonly BestBuyContext _context;

        public EfChangeOrderStatusCommand(BestBuyContext context)
        {
            _context = context;
        }

        public int Id => 46;

        public string Name => "Change Order status using EF";

        public void Execute(ChangeOrderStatusDto request)
        {
            var order = _context.Orders
                .Include(x => x.OrderItems)
                    .ThenInclude(x => x.Stock)
                .Where(x => x.Id == request.OrderId).FirstOrDefault();

            if (order == null)
            {
                throw new EntityAlreadyExistsException(request.OrderId, typeof(Order));
            }

            //DOSTAVLJENA Ako je porudzbina dostavljena ili otkazana ne smemo dozvoliti menjanje njenog statusa.
            if (order.Status == OrderStatus.Delivered || order.Status == OrderStatus.Canceled)
            {
                throw new ChangeOrderStatusException("Can't change status of delivered or canceled order.");
            }

            //ISPORUCENA Ako je isporucena moze biti dostavljena ili otkazana
            if (order.Status == OrderStatus.Shipped)
            {
                if (request.Status == OrderStatus.Delivered || request.Status == OrderStatus.Canceled)
                {
                    order.Status = request.Status;

                    if (request.Status == OrderStatus.Canceled)
                    {
                        //Pristupamo svakoj stavci
                        foreach (var item in order.OrderItems)
                        {
                            item.Stock.Quantity += item.Quantity;
                        }
                    }
                    _context.SaveChanges();
                }
                else
                {
                    throw new ChangeOrderStatusException("Order can't be transitioned from recieved back to recieved.");
                }
            }

            //PRIMLJENA Ako je primljena ili isporucena, moze biti poslata ili otkazana
            if (order.Status == OrderStatus.Recieved)
            {
                if (request.Status == OrderStatus.Shipped || request.Status == OrderStatus.Canceled)
                {
                    order.Status = request.Status;

                    //Ako kazemo da je otkazana moramo vratiti stanje proizvoda
                    if (request.Status == OrderStatus.Canceled)
                    {
                        //Pristupamo svakoj stavci
                        foreach (var item in order.OrderItems)
                        {
                            item.Stock.Quantity += item.Quantity;
                        }
                    }
                    //Ako kazemo da je poslata dodajemo i datum kada se to desilo
                    if (request.Status == OrderStatus.Shipped)
                    {
                        order.ShippedDate = DateTime.Now;
                    }
                    _context.SaveChanges();
                }
                else
                {
                    throw new ChangeOrderStatusException("Order can't be transitioned from recieved to delivered directly.");
                }
            }
        }
    }
}
