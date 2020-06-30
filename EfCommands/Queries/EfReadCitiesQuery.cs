using Application.Queries;
using Application.DataTransfer;
using Application.Searches;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using Domain;
using EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Application.Pagination;
using Application;
using Microsoft.EntityFrameworkCore;

namespace Implementation.Queries
{
    public class EfReadCitiesQuery : IReadCitiesQuery
    {
        private readonly BestBuyContext _context;
        private readonly IMapper _mapper;

        public EfReadCitiesQuery(BestBuyContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public int Id => 2;
        public string Name => "Read Cities using EF";

        public PagedResponse<CityDto> Execute(CitySearch search)
        {
            var query = _context.Cities
                .Include(x => x.CityUsers)
                .Include(x => x.CityStores)
                .AsQueryable();

            if(!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.Name.ToLower().Contains(search.Name.ToLower()));
            }
            if(search.PostalCode != null)
            {
                query = query.Where(x => x.PostalCode == search.PostalCode);
            }

            var queryPaged = query.AsPagedResponse(search.PerPage, search.Page);
            return new PagedResponse<CityDto>()
            {
                CurrentPage = queryPaged.CurrentPage,
                ItemsPerPage = queryPaged.ItemsPerPage,
                TotalCount = queryPaged.TotalCount,
                Items = _mapper.Map<IEnumerable<CityDto>>(queryPaged.Items)
            };
            //return _mapper.Map<IEnumerable<CityDto>>(query.ToList());
        }
    }
}
