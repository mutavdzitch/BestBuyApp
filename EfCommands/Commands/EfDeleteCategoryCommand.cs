using Application.Commands;
using Application.Exceptions;
using Domain;
using EfDataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands
{
    public class EfDeleteCategoryCommand : IDeleteCategoryCommand
    {
        private readonly BestBuyContext _context;

        public EfDeleteCategoryCommand(BestBuyContext context)
        {
            _context = context;
        }

        public int Id => 20;

        public string Name => "Delete Category using EF";

        public void Execute(int request)
        {
            var category = _context.Categories.Find(request);

            if(category == null)
            {
                throw new EntityNotFoundException(request, typeof(Category));
            }

            category.IsDeleted = true;
            category.DeletedAt = DateTime.Now;
            category.IsActive = false;

            _context.SaveChanges();
        }
    }
}
