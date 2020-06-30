using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Stock : BaseEntity
    {
        public int? Quantity { get; set; }
        public decimal Price { get; set; }
        public decimal Discount { get; set; }
        public int ProductId { get; set; }
        public int StoreId { get; set; }
        public Product Product { get; set; }
        public Store Store { get; set; }
        public ICollection<Item> StockItems { get; set; }
    }
}
