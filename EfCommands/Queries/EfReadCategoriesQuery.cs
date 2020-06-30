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
using System.Security.Cryptography.X509Certificates;
using System.Text;

namespace Implementation.Queries
{
    public class EfReadCategoriesQuery : IReadCategoriesQuery
    {
        private readonly BestBuyContext _context;
        private readonly IMapper _mapper;

        public EfReadCategoriesQuery(BestBuyContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public int Id => 17;

        public string Name => "Read Categories using EF";

        public PagedResponse<ReadCategoryDto> Execute(CategorySearch search)
        {
            var query = _context.Categories
                .Include(x => x.CategoryProducts)
                .ThenInclude(x => x.Brand)
                .AsQueryable();

            if(!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.Name.ToLower().Contains(search.Name.ToLower()));
            }

            var queryPaged = query.AsPagedResponse(search.PerPage, search.Page);
            return new PagedResponse<ReadCategoryDto>()
            {
                CurrentPage = queryPaged.CurrentPage,
                ItemsPerPage = queryPaged.ItemsPerPage,
                TotalCount = queryPaged.TotalCount,
                Items = _mapper.Map<IEnumerable<ReadCategoryDto>>(queryPaged.Items)
            };
            //return _mapper.Map<IEnumerable<CategoryDto>>(query.ToList());
        }
    }
}
