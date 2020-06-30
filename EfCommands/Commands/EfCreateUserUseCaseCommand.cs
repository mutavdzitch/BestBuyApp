using Application.Commands;
using Application.DataTransfer;
using AutoMapper;
using Domain;
using EfDataAccess;
using FluentValidation;
using Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Runtime.InteropServices.ComTypes;
using System.Text;

namespace Implementation.Commands
{
    public class EfCreateUserUseCaseCommand : ICreateUserUseCaseCommand
    {
        private readonly BestBuyContext _context;
        private readonly IMapper _mapper;
        private readonly CreateUserUseCaseValidator _validator;

        public EfCreateUserUseCaseCommand(BestBuyContext context, IMapper mapper, CreateUserUseCaseValidator validator)
        {
            _context = context;
            _mapper = mapper;
            _validator = validator;
        }

        public int Id => 47;

        public string Name => "Create new User Use case using EF";

        public void Execute(UserUseCaseDto request)
        {
            _validator.ValidateAndThrow(request);

            var useCase = _mapper.Map<UserUseCase>(request);

            _context.UserUseCases.Add(useCase);
            _context.SaveChanges();
        }
    }
}
