using Application.DataTransfer;
using Application.Exceptions;
using Application.Queries;
using AutoMapper;
using Domain;
using EfDataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Queries
{
    public class EfReadStockQuery : IReadStockQuery
    {
        private readonly BestBuyContext _context;
        private readonly IMapper _mapper;

        public EfReadStockQuery(BestBuyContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 33;

        public string Name => "Read Stock using EF";

        public ReadStockDto Execute(int search)
        {
            var stock = _context.Stocks
                .Include(x => x.Store)
                    .ThenInclude(x => x.City)
                .Include(x => x.Product)
                    .ThenInclude(x =>x.Category)
                .Include(x => x.Product)
                    .ThenInclude(x => x.Brand)
                .Where(x => x.Id == search).FirstOrDefault();

            if(stock == null)
            {
                throw new EntityNotFoundException(search, typeof(Stock));
            }

            return _mapper.Map<ReadStockDto>(stock);
        }
    }
}
