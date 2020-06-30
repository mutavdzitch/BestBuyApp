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
    public class EfReadBrandsQuery : IReadBrandsQuery
    {
        private readonly BestBuyContext _context;
        private readonly IMapper _mapper;

        public EfReadBrandsQuery(BestBuyContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 12;

        public string Name => "Read Brands using EF";

        public PagedResponse<ReadBrandDto> Execute(BrandSearch search)
        {
            var query = _context.Brands
                .Include(x => x.BrandProducts)
                .ThenInclude(x => x.Category)
                .AsQueryable();

            if(!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.Name.ToLower().Contains(search.Name.ToLower()));
            }

            var queryPaged = query.AsPagedResponse(search.PerPage, search.Page);
            return new PagedResponse<ReadBrandDto>()
            {
                CurrentPage = queryPaged.CurrentPage,
                ItemsPerPage = queryPaged.ItemsPerPage,
                TotalCount = queryPaged.TotalCount,
                Items = _mapper.Map<IEnumerable<ReadBrandDto>>(queryPaged.Items)
            };
            //return _mapper.Map<IEnumerable<BrandDto>>(query.ToList());
        }
    }
}
