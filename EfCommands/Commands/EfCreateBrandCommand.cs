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
    public class EfCreateBrandCommand : ICreateBrandCommand
    {
        private readonly BestBuyContext _context;
        private readonly CreateBrandValidator _validator;
        private readonly IMapper _mapper;

        public EfCreateBrandCommand(BestBuyContext context, CreateBrandValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => 11;

        public string Name => "Create Brand using EF";

        public void Execute(BrandDto request)
        {
            _validator.ValidateAndThrow(request);

            var brand = _mapper.Map<Domain.Brand>(request);

            _context.Brands.Add(brand);
            _context.SaveChanges();
        }
    }
}
