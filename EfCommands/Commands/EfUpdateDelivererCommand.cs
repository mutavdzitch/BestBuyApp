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
    public class EfUpdateDelivererCommand : IUpdateDelivererCommand
    {
        private readonly BestBuyContext _context;
        private readonly UpdateDelivererValidator _validator;
        private readonly IMapper _mapper;

        public EfUpdateDelivererCommand(BestBuyContext context, UpdateDelivererValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => 9;
        public string Name => "Update Deliverer using EF";

        public void Execute(DelivererDto request)
        {
            var deliverer = _context.Deliverers.Find(request.Id);

            if(deliverer == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Deliverer));
            }

            _validator.ValidateAndThrow(request);

            _mapper.Map(request, deliverer);
            _context.SaveChanges();
        }
    }
}
