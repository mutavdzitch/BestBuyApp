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
    public class EfUpdateBrandCommand : IUpdateBrandCommand
    {
        private readonly BestBuyContext _context;
        private readonly UpdateBrandValidator _validator;
        private readonly IMapper _mapper;

        public EfUpdateBrandCommand(BestBuyContext context, UpdateBrandValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => 14;

        public string Name => "Update Brand using EF";

        public void Execute(BrandDto request)
        {
            var brand = _context.Brands.Find(request.Id);

            if(brand == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Brand));
            }

            _validator.ValidateAndThrow(request);

            _mapper.Map(request, brand);
            _context.SaveChanges();
        }
    }
}
