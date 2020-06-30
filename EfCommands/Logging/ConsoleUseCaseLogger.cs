using Application;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Logging
{
    public class ConsoleUseCaseLogger : IUseCaseLogger
    {
        public void Log(IUseCase useCase, IApplicationActor actor, object data)
        {
            Console.WriteLine($"{DateTime.Now}: {actor.Identity} is trying to execute {useCase.Name} using data: " +
                $"{JsonConvert.SerializeObject(data)}");
        }
    }
}
