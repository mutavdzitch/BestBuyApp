using Application.Commands;
using Application.DataTransfer;
using AutoMapper;
using EfDataAccess;
using FluentValidation;
using Implementation.Validators;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Implementation.Commands
{
    public class EfCreateProductCommand : ICreateProductCommand
    {
        private readonly BestBuyContext _context;
        private readonly CreateProductValidator _validator;
        private readonly IMapper _mapper;

        public EfCreateProductCommand(BestBuyContext context, CreateProductValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => 21;

        public string Name => "Create new Product using EF";

        public void Execute(ProductDto request)
        {
            //upload image
            var guid = Guid.NewGuid();
            var extension = Path.GetExtension(request.Image.FileName);

            var newFileName = guid + extension;

            var path = Path.Combine("wwwroot", "images", newFileName);

            using (var fileStream = new FileStream(path, FileMode.Create))
            {
                request.Image.CopyTo(fileStream);
            }

            request.ImagePath = newFileName.ToString();

            //Insert
            _validator.ValidateAndThrow(request);

            var project = _mapper.Map<Domain.Product>(request);

            _context.Products.Add(project);
            _context.SaveChanges();
        }
    }
}
