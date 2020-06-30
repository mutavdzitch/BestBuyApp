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
    public class EfUpdateCityCommand : IUpdateCityCommand
    {
        private readonly BestBuyContext _context;
        private readonly UpdateCityValidator _validator;
        private readonly IMapper _mapper;

        public EfUpdateCityCommand(BestBuyContext context, UpdateCityValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => 4;
        public string Name => "Update City using EF";

        public void Execute(CityDto request)
        {
            var city = _context.Cities.Find(request.Id);

            if(city == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(City));
            }

            _validator.ValidateAndThrow(request);

            _mapper.Map(request, city);
            _context.SaveChanges();
        }
    }
}
