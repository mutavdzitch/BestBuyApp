using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Searches
{
    public class StockSearch : PagedSearch
    {
        public decimal? MinPrice { get; set; }
        public decimal? MaxPrice { get; set; }
        public decimal? MinDiscount { get; set; }
        public decimal? MaxDiscount { get; set; }
        public string ProductName { get; set; }
        public string StoreName { get; set; }

        public string BrandName { get; set; }
        public int? BrandId { get; set; }
        public string CategoryName { get; set; }
        public int? CategoryId { get; set; }
    }
}
