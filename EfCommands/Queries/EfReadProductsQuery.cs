using Application;
using Application.DataTransfer;
using Application.Pagination;
using Application.Queries;
using Application.Searches;
using AutoMapper;
using EfDataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Queries
{
    public class EfReadProductsQuery : IReadProductsQuery
    {
        private readonly BestBuyContext _context;
        private readonly IMapper _mapper;

        public EfReadProductsQuery(BestBuyContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public int Id => 22;

        public string Name => "Read Products using EF";

        public PagedResponse<ReadProductDto> Execute(ProductSearch search)
        {
            var query = _context.Products
                .Include(x => x.ProductStocks)
                .Include(x => x.Brand)
                .Include(x => x.Category)
                .AsQueryable();

            if(!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.Name.ToLower().Contains(search.Name.ToLower()));
            }
            if(!string.IsNullOrEmpty(search.BrandName) || !string.IsNullOrWhiteSpace(search.BrandName))
            {
                query = query.Where(x => x.Brand.Name.ToLower().Contains(search.BrandName.ToLower()));
            }
            if (search.BrandId != null)
            {
                query = query.Where(x => x.BrandId == search.BrandId);
            }
            if (!string.IsNullOrEmpty(search.CategoryName) || !string.IsNullOrWhiteSpace(search.CategoryName))
            {
                query = query.Where(x => x.Category.Name.ToLower().Contains(search.CategoryName.ToLower()));
            }
            if (search.CategoryId != null)
            {
                query = query.Where(x => x.CategoryId == search.CategoryId);
            }


            var queryPaged = query.AsPagedResponse(search.PerPage, search.Page);
             return new PagedResponse<ReadProductDto>(){
                CurrentPage = queryPaged.CurrentPage,
                ItemsPerPage = queryPaged.ItemsPerPage,
                TotalCount = queryPaged.TotalCount,
                Items = _mapper.Map<IEnumerable<ReadProductDto>>(queryPaged.Items)
             };

            /*var response = new PagedResponse<ReadProductDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Items = query.Skip(skipCount).Take(search.PerPage).Select(x => new ReadProductDto { 
                    Id = x.Id,
                    Name = x.Name,
                    Description = x.Description,
                    BrandId = x.BrandId,
                    BrandName = x.Brand.Name,
                    CategoryId = x.CategoryId,
                    CategoryName = x.Category.Name
                })
            };
            
            return response;*/
        }
    }
}
