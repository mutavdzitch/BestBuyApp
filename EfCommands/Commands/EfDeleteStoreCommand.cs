using Application.Commands;
using Application.Exceptions;
using Domain;
using EfDataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands
{
    public class EfDeleteStoreCommand : IDeleteStoreCommand
    {
        private readonly BestBuyContext _context;
        public EfDeleteStoreCommand(BestBuyContext context)
        {
            _context = context;
        }

        public int Id => 30;

        public string Name => "Delete Store using EF";

        public void Execute(int request)
        {
            var store = _context.Stores.Find(request);

            if(store == null)
            {
                throw new EntityNotFoundException(request, typeof(Store));
            }

            store.IsDeleted = true;
            store.DeletedAt = DateTime.Now;
            store.IsActive = false;

            _context.SaveChanges();
        }
    }
}
