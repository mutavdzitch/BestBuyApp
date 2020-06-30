using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Searches
{
    public class DelivererSearch : PagedSearch
    {
        public string Name { get; set; }
        public decimal? MinPrice { get; set; }
        public decimal? MaxPrice { get; set; }

    }
}
