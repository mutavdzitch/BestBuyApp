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
    public class EfReadDeliverersQuery : IReadDeliverersQuery
    {
        private readonly BestBuyContext _context;
        private readonly IMapper _mapper;
        public EfReadDeliverersQuery(BestBuyContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public int Id => 7;

        public string Name => "Read Cities using EF";

        public PagedResponse<DelivererDto> Execute(DelivererSearch search)
        {
            var query = _context.Deliverers
                .Include(x => x.DelivererOrders)
                    .ThenInclude(x => x.User)
                .Include(x => x.DelivererOrders)
                    .ThenInclude(x => x.OrderItems)
                        .ThenInclude(x => x.Stock)
                            .ThenInclude(x => x.Store)
                .Include(x => x.DelivererOrders)
                    .ThenInclude(x => x.OrderItems)
                        .ThenInclude(x => x.Stock)
                            .ThenInclude(x => x.Product)
                .AsQueryable();

            if (!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.Name.ToLower().Contains(search.Name.ToLower()));
            }
            if(search.MinPrice != null)
            {
                query = query.Where(x => x.Price >= search.MinPrice);
            }
            if(search.MaxPrice != null)
            {
                query = query.Where(x => x.Price <= search.MaxPrice);
            }

            var queryPaged = query.AsPagedResponse(search.PerPage, search.Page);
            return new PagedResponse<DelivererDto>()
            {
                CurrentPage = queryPaged.CurrentPage,
                ItemsPerPage = queryPaged.ItemsPerPage,
                TotalCount = queryPaged.TotalCount,
                Items = _mapper.Map<IEnumerable<DelivererDto>>(queryPaged.Items)
            };
            //return _mapper.Map<IEnumerable<DelivererDto>>(query.ToList());
        }
    }
}
