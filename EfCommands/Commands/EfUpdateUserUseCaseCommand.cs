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
    public class EfUpdateUserUseCaseCommand : IUpdateUserUseCaseCommand
    {
        private readonly BestBuyContext _context;
        private readonly IMapper _mapper;
        private readonly CreateUserUseCaseValidator _validator;

        public EfUpdateUserUseCaseCommand(BestBuyContext context, IMapper mapper, CreateUserUseCaseValidator validator)
        {
            _context = context;
            _mapper = mapper;
            _validator = validator;
        }

        public int Id => 49;

        public string Name => "Update Use case using EF";

        public void Execute(UserUseCaseDto request)
        {
            var useCase = _context.UserUseCases.Find(request.Id);

            if(useCase == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(UserUseCase));
            }

            _validator.ValidateAndThrow(request);

            _mapper.Map(request, useCase);
            _context.SaveChanges();
        }
    }
}
