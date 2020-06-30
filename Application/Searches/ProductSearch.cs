using System;
using System.Collections.Generic;
using System.Globalization;
using System.Text;

namespace Application.Searches
{
    public class ProductSearch : PagedSearch
    {
        public string Name { get; set; }
        public string BrandName { get; set; }
        public int? BrandId { get; set; }
        public string CategoryName { get; set; }
        public int? CategoryId { get; set; }
    }
}
