using Application.Commands;
using Application.Exceptions;
using Domain;
using EfDataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands
{
    public class EfDeleteUserUseCaseCommand : IDeleteUserUseCaseCommand
    {
        private readonly BestBuyContext _context;

        public EfDeleteUserUseCaseCommand(BestBuyContext context)
        {
            _context = context;
        }

        public int Id => 50;

        public string Name => "Delete User Use case using EF";

        public void Execute(int request)
        {
            var useCase = _context.UserUseCases.Find(request);

            if(useCase == null)
            {
                throw new EntityAlreadyExistsException(request, typeof(UserUseCase));
            }

            _context.Remove(useCase);
            _context.SaveChanges();
        }
    }
}
