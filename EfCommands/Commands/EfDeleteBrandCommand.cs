using Application.Commands;
using Application.Exceptions;
using Domain;
using EfDataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands
{
    public class EfDeleteBrandCommand : IDeleteBrandCommand
    {
        private readonly BestBuyContext _context;
        public EfDeleteBrandCommand(BestBuyContext context)
        {
            _context = context;
        }

        public int Id => 15;

        public string Name => "Delete Brand using EF";

        public void Execute(int request)
        {
            var brand = _context.Brands.Find(request);

            if (brand == null)
            {
                throw new EntityNotFoundException(request, typeof(Brand));
            }

            brand.IsDeleted = true;
            brand.DeletedAt = DateTime.Now;
            brand.IsActive = false;

            _context.SaveChanges();
        }
    }
}
