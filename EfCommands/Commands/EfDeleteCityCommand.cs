using Application;
using Application.Commands;
using Application.Exceptions;
using Domain;
using EfDataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands
{
    public class EfDeleteCityCommand : IDeleteCityCommand
    {
        private readonly BestBuyContext _context;

        public EfDeleteCityCommand(BestBuyContext context)
        {
            _context = context;
        }

        public int Id => 5;
        public string Name => "Delete City using EF";

        public void Execute(int request)
        {
            var city = _context.Cities.Find(request);

            if(city == null)
            {
                throw new EntityNotFoundException(request, typeof(City));
            }

            city.IsDeleted = true;
            city.DeletedAt = DateTime.Now;
            city.IsActive = false;

            _context.SaveChanges();
        }
    }
}
