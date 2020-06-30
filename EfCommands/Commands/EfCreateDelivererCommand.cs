using Application.Commands;
using Application.DataTransfer;
using Application.Exceptions;
using AutoMapper;
using Domain;
using EfDataAccess;
using FluentValidation;
using Implementation.Validators;
using Microsoft.EntityFrameworkCore.Internal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;

namespace Implementation.Commands
{
    public class EfCreateDelivererCommand : ICreateDelivererCommand
    {
        private readonly BestBuyContext _context;
        private readonly CreateDelivererValidator _validator;
        private readonly IMapper _mapper;

        public EfCreateDelivererCommand(BestBuyContext context, CreateDelivererValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => 6;
        public string Name => "Create new Deliverer using EF";

        public void Execute(DelivererDto request)
        {
            _validator.ValidateAndThrow(request);

            var deliverer = _mapper.Map<Domain.Deliverer>(request);

            _context.Deliverers.Add(deliverer);
            _context.SaveChanges();
        }
    }
}
