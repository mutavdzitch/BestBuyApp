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
    public class EfReadBrandQuery : IReadBrandQuery
    {
        private readonly BestBuyContext _context;
        private readonly IMapper _mapper;

        public EfReadBrandQuery(BestBuyContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 13;

        public string Name => "Read Brands using EF";

        public ReadBrandDto Execute(int search)
        {
            var brand = _context.Brands
                .Include(x => x.BrandProducts)
                .ThenInclude(x => x.Category)
                .Where(x => x.Id == search).FirstOrDefault();

            if(brand == null)
            {
                throw new EntityNotFoundException(search, typeof(Brand));
            }

            return _mapper.Map<ReadBrandDto>(brand);
        }
    }
}
