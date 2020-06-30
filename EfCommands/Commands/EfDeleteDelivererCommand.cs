using Application.Commands;
using Application.Exceptions;
using Domain;
using EfDataAccess;
using Microsoft.EntityFrameworkCore.Internal;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands
{
    public class EfDeleteDelivererCommand : IDeleteDelivererCommand
    {
        private readonly BestBuyContext _context;
        public EfDeleteDelivererCommand(BestBuyContext context)
        {
            _context = context;
        }

        public int Id => 10;

        public string Name => "Delete Deliverer using EF";

        public void Execute(int request)
        {
            var deliverer = _context.Deliverers.Find(request);

            if(deliverer == null)
            {
                throw new EntityNotFoundException(request, typeof(Deliverer));
            }

            deliverer.IsDeleted = true;
            deliverer.DeletedAt = DateTime.Now;
            deliverer.IsActive = false;

            _context.SaveChanges();
        }
    }
}
