using Application.Commands;
using Application.DataTransfer;
using Application.Email;
using Application.Hash;
using AutoMapper;
using Domain;
using EfDataAccess;
using FluentValidation;
using Implementation.Validators;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Text;

namespace Implementation.Commands
{
    public class EfRegisterUserCommand : IRegisterUserCommand
    {
        private readonly BestBuyContext _context;
        private readonly RegisterUserValidator _validator;
        private readonly IEmailSender _sender;
        private readonly IHashPassword _hashPassword;
        private readonly IMapper _mapper;

        public EfRegisterUserCommand(BestBuyContext context, RegisterUserValidator validator,
            IEmailSender sender, IHashPassword hashPassword, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _sender = sender;
            _hashPassword = hashPassword;
            _mapper = mapper;
        }

        public int Id => 36;

        public string Name => "User registration using EF";

        public void Execute(UserDto request)
        {
            _validator.ValidateAndThrow(request);

            request.Password = _hashPassword.ComputeSha256Hash(request.Password);

            var user = _mapper.Map<Domain.User>(request);

            _context.Users.Add(user);
            _context.SaveChanges();

            var lastInsertedId = user.Id;

            //UseCases
            var useCases = new List<int> { 2, 7, 12, 13, 17, 18, 22, 23, 27, 28, 32, 33, 39, 40, 41, 43, 44, 45};

            foreach(var item in useCases)
            {
                _context.UserUseCases.Add(new UserUseCase
                {
                    UseCaseId = item,
                    UserId = lastInsertedId
                });
            }
            _context.SaveChanges();

            //Send email
            _sender.Send(new SendEmailDto
            {
                SendTo = request.Email,
                Subject = "Best Buy Registration",
                Body = "<h1>Successful registration</h1>"
            });
        }
    }
}
