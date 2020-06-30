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
    public class EfUpdateStoreCommand : IUpdateStoreCommand
    {
        private readonly BestBuyContext _context;
        private readonly UpdateStoreValidator _validator;
        private readonly IMapper _mapper;

        public EfUpdateStoreCommand(BestBuyContext context, UpdateStoreValidator validator, IMapper mapper)
        {
            _context = context; 
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => 29;

        public string Name => "Update Store using EF";

        public void Execute(StoreDto request)
        {
            var store = _context.Stores.Find(request.Id);

            if (store == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Store));
            }

            _validator.ValidateAndThrow(request);

            _mapper.Map(request, store);
            _context.SaveChanges();
        }
    }
}
