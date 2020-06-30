using Application;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Core
{
    public class AnonymousActor : IApplicationActor
    {
        public int Id => 0;

        public string Identity => "Anonymous";

        public IEnumerable<int> AllowedUseCases => new List<int> {2, 7, 12, 13, 17, 18, 22, 23, 27, 28, 32, 33, 36 };
    }
}
