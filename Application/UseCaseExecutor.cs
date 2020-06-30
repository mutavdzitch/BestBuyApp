using Application.Exceptions;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Cache;
using System.Text;

namespace Application
{
    public class UseCaseExecutor
    {
        private readonly IApplicationActor actor;
        private readonly IUseCaseLogger logger;
        public UseCaseExecutor(IApplicationActor actor, IUseCaseLogger logger)
        {
            this.actor = actor;
            this.logger = logger;
        }

        //Command
        public void ExecuteCommand<TRequest>(
            ICommand<TRequest> command,
            TRequest request)
        {
            logger.Log(command, actor, request);

            if (!actor.AllowedUseCases.Contains(command.Id)) //Ako radi nesto sto mu nije dozvoljeno
            {
                throw new UnauthorizedUseCaseException(command, actor);
                //401 / 403
            }

            command.Execute(request);
        }

        //Query
        public TResult ExecuteQuery<TSearch, TResult>(
            IQuery<TSearch, TResult> query,
            TSearch search )
        {
            logger.Log(query, actor, search);

            if (!actor.AllowedUseCases.Contains(query.Id))
            {
                throw new UnauthorizedUseCaseException(query, actor);
                //401 / 403
            }

            return query.Execute(search);
        }
    }
}
