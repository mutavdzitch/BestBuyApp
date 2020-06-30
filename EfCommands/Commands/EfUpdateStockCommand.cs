using Application.Commands;
using Application.DataTransfer;
using Application.Exceptions;
using AutoMapper;
using Domain;
using EfDataAccess;
using FluentValidation;
using Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Commands
{
    public class EfUpdateStockCommand : IUpdateStockCommand
    {
        private readonly BestBuyContext _context;
        private readonly StockValidator _validator;
        private readonly IMapper _mapper;

        public EfUpdateStockCommand(BestBuyContext context, StockValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => 34;

        public string Name => "Update Stock using EF";

        public void Execute(StockDto request)
        {
            var stock = _context.Stocks.Find(request.Id);

            if(stock == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Stock));
            }

            _validator.ValidateAndThrow(request);

            _mapper.Map(request, stock);
            _context.SaveChanges();
        }
    }
}
