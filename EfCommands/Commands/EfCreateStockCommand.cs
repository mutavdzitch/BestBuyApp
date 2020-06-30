using Application.Commands;
using Application.DataTransfer;
using Application.Exceptions;
using AutoMapper;
using Domain;
using EfDataAccess;
using FluentValidation;
using Implementation.Validators;
using Microsoft.EntityFrameworkCore.Internal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Commands
{
    public class EfCreateStockCommand : ICreateStockCommand
    {
        private readonly BestBuyContext _context;
        private readonly StockValidator _validator;
        private readonly IMapper _mapper;

        public EfCreateStockCommand(BestBuyContext context, StockValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => 31;

        public string Name => "Create new Stock using EF";

        public void Execute(StockDto request)
        {
            _validator.ValidateAndThrow(request);

            var stock = _mapper.Map<Domain.Stock>(request);

            /*if(_context.Stocks.Any(x => x.StoreId == request.StoreId && x.ProductId == request.ProductId))
            {
                throw new EntityAlreadyExistsException(request.Id, typeof(Stock));
            }*/

            _context.Stocks.Add(stock);
            _context.SaveChanges();
        }
    }
}
