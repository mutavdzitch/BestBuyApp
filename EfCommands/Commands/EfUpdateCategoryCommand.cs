using Application.Commands;
using Application.DataTransfer;
using Application.Exceptions;
using AutoMapper;
using Domain;
using EfDataAccess;
using FluentValidation;
using Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands
{
    public class EfUpdateCategoryCommand : IUpdateCategoryCommand
    {
        private readonly BestBuyContext _context;
        private readonly UpdateCategoryValidator _validator;
        private readonly IMapper _mapper;

        public EfUpdateCategoryCommand(BestBuyContext context, UpdateCategoryValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => 19;

        public string Name => "Update Category using EF";

        public void Execute(CategoryDto request)
        {
            var category = _context.Categories.Find(request.Id);

            if(category == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Category));
            }

            _validator.ValidateAndThrow(request);

            _mapper.Map(request, category);
            _context.SaveChanges();
        }
    }
}
