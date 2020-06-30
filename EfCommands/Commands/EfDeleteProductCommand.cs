using Application.Commands;
using Application.Exceptions;
using Domain;
using EfDataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands
{
    public class EfDeleteProductCommand : IDeleteProductCommand
    {
        private readonly BestBuyContext _context;
        public EfDeleteProductCommand(BestBuyContext context)
        {
            _context = context;
        }

        public int Id => 25;

        public string Name => "Delete Product using EF";

        public void Execute(int request)
        {
            var product = _context.Products.Find(request);

            if (product == null)
            {
                throw new EntityNotFoundException(request, typeof(Product));
            }

            product.IsDeleted = true;
            product.DeletedAt = DateTime.Now;
            product.IsActive = false;

            _context.SaveChanges();
        }
    }
}
