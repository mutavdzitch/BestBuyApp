using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Searches
{
    public class UserUseCaseSearch : PagedSearch
    {
        public int? UseCaseId { get; set; }
        public int? UserId { get; set; } 
    }
}
