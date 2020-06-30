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
    public class EfCreateStoreCommand : ICreateStoreCommand
    {
        private readonly BestBuyContext _context;
        private readonly CreateStoreValidator _validator;
        private readonly IMapper _mapper;

        public EfCreateStoreCommand(BestBuyContext context, CreateStoreValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => 26;

        public string Name => "Create new Store using EF";

        public void Execute(StoreDto request)
        {
            _validator.ValidateAndThrow(request);

            var store = _mapper.Map<Domain.Store>(request);

            _context.Stores.Add(store);
            _context.SaveChanges();
        }
    }
}
