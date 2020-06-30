using Application.Commands;
using Application.DataTransfer;
using Application.Exceptions;
using Application.Hash;
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
    public class EfUpdateUserCommand : IUpdateUserCommand
    {
        private readonly BestBuyContext _context;
        private readonly UpdateUserValidator _validator;
        private readonly IHashPassword _hashPassword;
        private readonly IMapper _mapper;

        public EfUpdateUserCommand(BestBuyContext context, IMapper mapper,
            UpdateUserValidator validator, IHashPassword hashPassword)
        {
            _context = context;
            _mapper = mapper;
            _validator = validator;
            _hashPassword = hashPassword;
        }
        public int Id => 39;

        public string Name => "Update User using EF";

        public void Execute(UserDto request)
        {
            var user = _context.Users.Find(request.Id);

            request.Password = _hashPassword.ComputeSha256Hash(request.Password);

            if(user == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(User));
            }

            _validator.ValidateAndThrow(request);

            _mapper.Map(request, user);
            _context.SaveChanges();
        }
    }
}
