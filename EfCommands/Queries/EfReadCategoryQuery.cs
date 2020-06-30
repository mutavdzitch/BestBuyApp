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
    public class EfReadCategoryQuery : IReadCategoryQuery
    {
        private readonly BestBuyContext _context;
        private readonly IMapper _mapper;

        public EfReadCategoryQuery(BestBuyContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public int Id => 18;

        public string Name => "Read Category using EF";

        public ReadCategoryDto Execute(int search)
        {
            var category = _context.Categories
                .Include(x => x.CategoryProducts)
                .ThenInclude(x => x.Brand)
                .Where(x => x.Id == search).FirstOrDefault();

            if(category == null)
            {
                throw new EntityNotFoundException(search, typeof(Category));
            }

            return _mapper.Map<ReadCategoryDto>(category);
        }
    }
}
