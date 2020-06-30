using Application.Commands;
using Application.DataTransfer;
using AutoMapper;
using EfDataAccess;
using FluentValidation;
using Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands
{
    public class EfCreateCategoryCommand : ICreateCategoryCommand
    {
        private readonly BestBuyContext _context;
        private readonly CreateCategoryValidator _validator;
        private readonly IMapper _mapper;

        public EfCreateCategoryCommand(BestBuyContext context, CreateCategoryValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }
        public int Id => 16;

        public string Name => "Create new Category using EF";

        public void Execute(CategoryDto request)
        {
            _validator.ValidateAndThrow(request);

            var category = _mapper.Map<Domain.Category>(request);

            _context.Categories.Add(category);
            _context.SaveChanges();
        }
    }
}
