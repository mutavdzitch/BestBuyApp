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
    public class EfReadStocksQuery : IReadStocksQuery
    {
        private readonly BestBuyContext _context;
        private readonly IMapper _mapper;

        public EfReadStocksQuery(BestBuyContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 32;

        public string Name => "Read Stocks using EF";

        public PagedResponse<ReadStockDto> Execute(StockSearch search)
        {
            var query = _context.Stocks
                .Include(x => x.Store)
                .Include(x => x.Product)
                .AsQueryable();

            if (search.MinPrice != null)
            {
                query = query.Where(x => x.Price >= search.MinPrice);
            }
            if (search.MaxPrice != null)
            {
                query = query.Where(x => x.Price <= search.MaxPrice);
            }
            if (search.MinDiscount != null)
            {
                query = query.Where(x => x.Discount >= search.MinDiscount);
            }
            if (search.MaxDiscount != null)
            {
                query = query.Where(x => x.Discount <= search.MaxDiscount);
            }
            if (!string.IsNullOrEmpty(search.ProductName) || !string.IsNullOrWhiteSpace(search.ProductName))
            {
                query = query.Where(x => x.Product.Name.ToLower().Contains(search.ProductName.ToLower()));
            }
            if (!string.IsNullOrEmpty(search.StoreName) || !string.IsNullOrWhiteSpace(search.StoreName))
            {
                query = query.Where(x => x.Store.Name.ToLower().Contains(search.StoreName.ToLower()));
            }

            if (!string.IsNullOrEmpty(search.BrandName) || !string.IsNullOrWhiteSpace(search.BrandName))
            {
                query = query.Where(x => x.Product.Brand.Name.ToLower().Contains(search.BrandName.ToLower()));
            }
            if (search.BrandId != null)
            {
                query = query.Where(x => x.Product.BrandId == search.BrandId);
            }
            if (!string.IsNullOrEmpty(search.CategoryName) || !string.IsNullOrWhiteSpace(search.CategoryName))
            {
                query = query.Where(x => x.Product.Category.Name.ToLower().Contains(search.CategoryName.ToLower()));
            }
            if (search.CategoryId != null)
            {
                query = query.Where(x => x.Product.CategoryId == search.CategoryId);
            }

            var queryPaged = query.AsPagedResponse(search.PerPage, search.Page);
            return new PagedResponse<ReadStockDto>()
            {
                CurrentPage = queryPaged.CurrentPage,
                ItemsPerPage = queryPaged.ItemsPerPage,
                TotalCount = queryPaged.TotalCount,
                Items = _mapper.Map<IEnumerable<ReadStockDto>>(queryPaged.Items)
            };

            /*var skipCount = search.PerPage * (search.Page - 1);  //pomeraj za sledecu stranicu

            var response = new PagedResponse<ReadStockDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Items = query.Skip(skipCount).Take(search.PerPage).Select(x => new ReadStockDto
                {
                    Id = x.Id,
                    Quantity = x.Quantity,
                    Price = x.Price,
                    Discount = x.Discount,
                    StoreId = x.StoreId,
                    StoreName = x.Store.Name,
                    ProductId = x.ProductId,
                    ProductInfo = x.Product.Brand.Name + " " + x.Product.Name
                })
            };

            return response;*/
        }
    }
}
