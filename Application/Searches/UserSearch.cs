using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Searches
{
    public class UserSearch : PagedSearch
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string CityName { get; set; }

    }
}
