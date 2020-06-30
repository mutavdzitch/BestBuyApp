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
    public class EfReadStoreQuery : IReadStoreQuery
    {
        private readonly BestBuyContext _context;
        private readonly IMapper _mapper;

        public EfReadStoreQuery(BestBuyContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 28;

        public string Name => "Read Store using EF";

        public ReadStoreDto Execute(int search)
        {
            var store = _context.Stores
                .Include(x => x.City)
                .Include(x => x.StoreStocks)
                    .ThenInclude(x => x.Product)
                .Include(x => x.StoreStocks)
                    .ThenInclude(x => x.Store)
                .Where(x => x.Id == search).FirstOrDefault();

            if(store == null)
            {
                throw new EntityNotFoundException(search, typeof(Store));
            }

            return _mapper.Map<ReadStoreDto>(store);
        }
    }
}
