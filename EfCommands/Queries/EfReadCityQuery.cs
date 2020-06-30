using Application.Queries;
using Application.DataTransfer;
using Application.Exceptions;
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
    public class EfReadCityQuery : IReadCityQuery
    {
        private readonly BestBuyContext _context;
        private readonly IMapper _mapper;

        public EfReadCityQuery(BestBuyContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 3;
        public string Name => "Read City using EF";
        public ReadCityDto Execute(int search)
        {
            var city = _context.Cities
                .Include(x => x.CityUsers)
                .Include(x => x.CityStores)
                .Where(x => x.Id == search).FirstOrDefault();

            if(city == null)
            {
                throw new EntityNotFoundException(search, typeof(City));
            }

            return _mapper.Map<ReadCityDto>(city);
        }
    }
}
