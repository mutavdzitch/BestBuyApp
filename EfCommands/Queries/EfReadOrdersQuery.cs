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
    public class EfReadOrdersQuery : IReadOrdersQuery
    {
        private readonly BestBuyContext _context;
        private readonly IMapper _mapper;

        public EfReadOrdersQuery(BestBuyContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 42;

        public string Name => "Read Orders using EF";

        public PagedResponse<ReadOrderDto> Execute(OrderSearch search)
        {
            var query = _context.Orders
                .Include(x => x.Deliverer)
                .Include(x => x.OrderItems)
                    .ThenInclude(x => x.Stock)
                .Include(x => x.OrderItems)
                    .ThenInclude(x => x.Stock)
                        .ThenInclude(x =>x.Store)
                .Include(x => x.OrderItems)
                    .ThenInclude(x => x.Stock)
                        .ThenInclude(x => x.Product)
                            .ThenInclude(x => x.Brand)
                .Include(x => x.User)
                .Include(x => x.Deliverer)
                .AsQueryable();

            if (search.MinCreatedAt != null)
            {
                query = query.Where(x => x.CreatedAt >= search.MinCreatedAt);
            }
            if (search.MaxCreatedAt != null)
            {
                query = query.Where(x => x.CreatedAt <= search.MaxCreatedAt);
            }
            if (search.MinOrderDate != null)
            {
                query = query.Where(x => x.OrderDate >= search.MinOrderDate);
            }
            if (search.MaxOrderDate != null)
            {
                query = query.Where(x => x.OrderDate <= search.MinOrderDate);
            }
            if (search.MinShippedDate != null)
            {
                query = query.Where(x => x.ShippedDate >= search.MinShippedDate);
            }
            if (search.MaxShippedDate != null)
            {
                query = query.Where(x => x.ShippedDate <= search.MaxShippedDate);
            }
            if(search.MinTotalPrice != null)
            {
                query = query.Where(x => x.OrderItems.Sum(y => y.Price * y.Quantity) + x.Deliverer.Price >= search.MinTotalPrice);
            }
            if (search.MaxTotalPrice != null)
            {
                query = query.Where(x => x.OrderItems.Sum(y => y.Price * y.Quantity) + x.Deliverer.Price <= search.MaxTotalPrice);
            }
            if (!string.IsNullOrEmpty(search.Address) || !string.IsNullOrWhiteSpace(search.Address))
            {
                query = query.Where(x => x.Address.ToLower().Contains(search.Address.ToLower()));
            }
            if (search.UserId != null)
            {
                query = query.Where(x => x.UserId == search.UserId);
            }
            if (search.DelivererId != null)
            {
                query = query.Where(x => x.DelivererId == search.DelivererId);
            }
            if (search.Status != null)
            {
                query = query.Where(x => x.Status == search.Status);
            }

            var queryPaged = query.AsPagedResponse(search.PerPage, search.Page);
            return new PagedResponse<ReadOrderDto>()
            {
                CurrentPage = queryPaged.CurrentPage,
                ItemsPerPage = queryPaged.ItemsPerPage,
                TotalCount = queryPaged.TotalCount,
                Items = _mapper.Map<IEnumerable<ReadOrderDto>>(queryPaged.Items)
            };
        }
    }
}
