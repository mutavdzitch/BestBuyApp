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
    public class EfReadUserQuery : IReadUserQuery
    {
        private readonly BestBuyContext _context;
        private readonly IMapper _mapper;

        public EfReadUserQuery(BestBuyContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 38;

        public string Name => "Read User using EF"; 

        public ReadUserDto Execute(int search)
        {
            var user = _context.Users
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
                .Where(x => x.Id == search).FirstOrDefault();

            if (user == null)
            {
                throw new EntityNotFoundException(search, typeof(User));
            }

            return _mapper.Map<ReadUserDto>(user);
        }
    }
}
