using Application;
using EfDataAccess;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;
using System.Text.Json;

namespace Implementation.Logging
{
    public class DatabaseUseCaseLogger : IUseCaseLogger
    {
        private readonly BestBuyContext _context;

        public DatabaseUseCaseLogger(BestBuyContext context)
        {
            _context = context;
        }
        public void Log(IUseCase useCase, IApplicationActor actor, object data)
        {
            _context.UseCaseLogs.Add(new Domain.UseCaseLog
            { 
                Date = DateTime.UtcNow,
                UseCaseName = useCase.Name,
                Data = JsonConvert.SerializeObject(data),
                Actor = actor.Identity
            });

            _context.SaveChanges();
        }
    }
}
