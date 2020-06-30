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
    public class EfReadProductQuery : IReadProductQuery
    {
        private readonly BestBuyContext _context;
        private readonly IMapper _mapper;

        public EfReadProductQuery(BestBuyContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 23;

        public string Name => "Read Product using EF";

        public ReadProductDto Execute(int search)
        {
            var product = _context.Products
                .Include(x => x.ProductStocks)
                .Include(x => x.Category)
                .Include(x => x.Brand)
                 .Where(x => x.Id == search).FirstOrDefault();

            if(product == null)
            {
                throw new EntityNotFoundException(search, typeof(Product));
            }

            return _mapper.Map<ReadProductDto>(product);
        }
    }
}
