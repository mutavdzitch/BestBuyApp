using Application;
using Application.DataTransfer;
using Application.Pagination;
using Application.Queries;
using Application.Searches;
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
    public class EfReadStoresQuery : IReadStoresQuery
    {
        private readonly BestBuyContext _context;
        private readonly IMapper _mapper;
        public EfReadStoresQuery(BestBuyContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 27;

        public string Name => "Read Stores using EF";

        public PagedResponse<ReadStoreDto> Execute(StoreSearch search)
        {
            var query = _context.Stores
                .Include(x => x.City)
                .Include(x => x.StoreStocks)
                    .ThenInclude(x => x.Product)
                .Include(x => x.StoreStocks)
                    .ThenInclude(x => x.Store)
                .AsQueryable();

            if (!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.Name.ToLower().Contains(search.Name.ToLower()));
            }
            if (!string.IsNullOrEmpty(search.CityName) || !string.IsNullOrWhiteSpace(search.CityName))
            {
                query = query.Where(x => x.City.Name.ToLower().Contains(search.CityName.ToLower()));
            }

            var queryPaged = query.AsPagedResponse(search.PerPage, search.Page);
            return new PagedResponse<ReadStoreDto>()
            {
                CurrentPage = queryPaged.CurrentPage,
                ItemsPerPage = queryPaged.ItemsPerPage,
                TotalCount = queryPaged.TotalCount,
                Items = _mapper.Map<IEnumerable<ReadStoreDto>>(queryPaged.Items)
            };
            //return _mapper.Map<IEnumerable<ReadStoreDto>>(query.ToList());
        }
    }
}
