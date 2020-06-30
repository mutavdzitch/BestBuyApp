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
    public class EfReadUsersQuery : IReadUsersQuery
    {
        private readonly BestBuyContext _context;
        private readonly IMapper _mapper;

        public EfReadUsersQuery(BestBuyContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 37;

        public string Name => "Read Users using EF";

        public PagedResponse<ReadUserDto> Execute(UserSearch search)
        {
            var query = _context.Users
                .Include(x => x.City)
                .Include(x => x.UserOrders)
                    .ThenInclude(x => x.Deliverer)
                .Include(x => x.UserOrders)
                    .ThenInclude(x => x.OrderItems)
                        .ThenInclude(x => x.Stock)
                            .ThenInclude(x => x.Store)
                .Include(x => x.UserOrders)
                    .ThenInclude(x => x.OrderItems)
                        .ThenInclude(x => x.Stock)
                            .ThenInclude(x => x.Product)
                
                .AsQueryable();

            if(!string.IsNullOrEmpty(search.FirstName) && !string.IsNullOrWhiteSpace(search.FirstName))
            {
                query = query.Where(x => x.FirstName.ToLower().Contains(search.FirstName.ToLower()));
            }
            if (!string.IsNullOrEmpty(search.LastName) && !string.IsNullOrWhiteSpace(search.LastName))
            {
                query = query.Where(x => x.LastName.ToLower().Contains(search.LastName.ToLower()));
            }
            if (!string.IsNullOrEmpty(search.CityName) && !string.IsNullOrWhiteSpace(search.CityName))
            {
                query = query.Where(x => x.City.Name.ToLower().Contains(search.CityName.ToLower()));
            }

            var queryPaged = query.AsPagedResponse(search.PerPage, search.Page);
            return new PagedResponse<ReadUserDto>()
            {
                CurrentPage = queryPaged.CurrentPage,
                ItemsPerPage = queryPaged.ItemsPerPage,
                TotalCount = queryPaged.TotalCount,
                Items = _mapper.Map<IEnumerable<ReadUserDto>>(queryPaged.Items)
            };

            /*var skipCount = search.PerPage * (search.Page - 1);  //pomeraj za sledecu stranicu

            var response = new PagedResponse<ReadUserDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Items = query.Skip(skipCount).Take(search.PerPage).Select(x => new ReadUserDto
                {
                    Id = x.Id,
                    FirstName = x.FirstName,
                    LastName = x.LastName,
                    Email = x.Email,
                    Phone = x.Phone,
                    Address = x.Address,
                    CityId = x.CityId,
                    CityName = x.City.Name
                })
            };

            return response;*/
        }
    }
}
