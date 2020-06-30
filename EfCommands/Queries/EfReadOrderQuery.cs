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
    public class EfReadOrderQuery : IReadOrderQuery
    {
        private readonly BestBuyContext _context;
        private readonly IMapper _mapper;

        public EfReadOrderQuery(BestBuyContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 43;

        public string Name => "Read Order using EF";

        public ReadOrderDto Execute(int search)
        {
            var order = _context.Orders
                .Include(x => x.Deliverer)
                .Include(x => x.OrderItems)
                    .ThenInclude(x => x.Stock)
                .Include(x => x.OrderItems)
                    .ThenInclude(x => x.Stock)
                        .ThenInclude(x => x.Store)
                .Include(x => x.OrderItems)
                    .ThenInclude(x => x.Stock)
                        .ThenInclude(x => x.Product)
                            .ThenInclude(x => x.Brand)
                .Include(x => x.User)
                .Include(x => x.Deliverer)
                .Where(x => x.Id == search).FirstOrDefault();

            if(order == null)
            {
                throw new EntityNotFoundException(search, typeof(Order));
            }

            return _mapper.Map<ReadOrderDto>(order);
        }
    }
}
