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
using System.Reflection.PortableExecutable;
using System.Text;

namespace Implementation.Commands
{
    public class EfUpdateProductCommand : IUpdateProductCommand
    {
        private readonly BestBuyContext _context;
        private readonly UpdateProductValidator _validator;
        private readonly IMapper _mapper;

        public EfUpdateProductCommand(BestBuyContext context, UpdateProductValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }
        public int Id => 24;

        public string Name => "Update Product using EF";

        public void Execute(ProductDto request)
        {
            var product = _context.Products.Find(request.Id);

            if(product == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Product));
            }

            _validator.ValidateAndThrow(request);

            _mapper.Map(request, product);
            _context.SaveChanges();
        }
    }
}
