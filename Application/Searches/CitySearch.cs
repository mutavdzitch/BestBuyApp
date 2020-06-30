using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Searches
{
    public class CitySearch : PagedSearch
    {
        public string Name { get; set; }
        public int? PostalCode { get; set; }
    }
}
