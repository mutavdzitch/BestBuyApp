using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Item : BaseEntity
    {
        public int Quantity { get; set; }
        public int OrderId { get; set; }
        public int? StockId { get; set; }
        public Order Order { get; set; }
        public Stock Stock { get; set; }
        public decimal Price { get; set; }
    }
}
