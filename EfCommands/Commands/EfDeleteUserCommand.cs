using Application.Commands;
using Application.Exceptions;
using Domain;
using EfDataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands
{
    public class EfDeleteUserCommand : IDeleteUserCommand
    {
        private readonly BestBuyContext _context;

        public EfDeleteUserCommand(BestBuyContext context)
        {
            _context = context;
        }

        public int Id => 40;

        public string Name => "Delete User using EF";

        public void Execute(int request)
        {
            var user = _context.Users.Find(request);

            if(user == null)
            {
                throw new EntityNotFoundException(request, typeof(User));
            }

            user.IsDeleted = true;
            user.DeletedAt = DateTime.Now;
            user.IsActive = false;

            _context.SaveChanges();
        }
    }
}
