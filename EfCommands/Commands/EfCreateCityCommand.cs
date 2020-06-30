using Application.Commands;
using Application.DataTransfer;
using Application.Exceptions;
using Implementation.Validators;
using AutoMapper;
using Domain;
using EfDataAccess;
using Microsoft.EntityFrameworkCore.Internal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using FluentValidation;

namespace Implementation.Commands
{
    public class EfCreateCityCommand : ICreateCityCommand
    {
        private readonly BestBuyContext _context;
        private readonly CreateCityValidator _validator;
        private readonly IMapper _mapper;

        public EfCreateCityCommand(BestBuyContext context, CreateCityValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => 1;
        public string Name => "Create new City using EF";

        public void Execute(CityDto request)
        {
            _validator.ValidateAndThrow(request);

            var city = _mapper.Map<Domain.City>(request);

            _context.Cities.Add(city);
            _context.SaveChanges();
        }
    }
}
