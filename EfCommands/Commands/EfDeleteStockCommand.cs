using Application.Commands;
using Application.Exceptions;
using Domain;
using EfDataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands
{
    public class EfDeleteStockCommand : IDeleteStockCommand
    {
        private readonly BestBuyContext _context;

        public EfDeleteStockCommand(BestBuyContext context)
        {
            _context = context;
        }

        public int Id => 35;

        public string Name => "Delete Stock using EF";
        public void Execute(int request)
        {
            var stock = _context.Stocks.Find(request);

            if(stock == null)
            {
                throw new EntityNotFoundException(request, typeof(Stock));
            }

            stock.IsDeleted = true;
            stock.DeletedAt = DateTime.Now;
            stock.IsActive = false;

            _context.SaveChanges();
        }
    }
}
