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
using System.Reflection.Metadata.Ecma335;
using System.Text;

namespace Implementation.Queries
{
    public class EfReadDelivererQuery : IReadDelivererQuery
    {
        private readonly BestBuyContext _context;
        private readonly IMapper _mapper;
        public EfReadDelivererQuery(BestBuyContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public int Id => 8;
        public string Name => "Read Deliverer using EF";

        public ReadDelivererDto Execute(int search)
        {
            var deliverer = _context.Deliverers
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
               .Where(x => x.Id == search).FirstOrDefault();
            
            if(deliverer == null)
            {
                throw new EntityNotFoundException(search, typeof(Deliverer));
            }

            return _mapper.Map<ReadDelivererDto>(deliverer);
        }
    }
}
