using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer
{
    public class StockDto
    {
        public int Id { get; set; }
        public int? Quantity { get; set; }
        public decimal Price { get; set; }
        public decimal Discount { get; set; }
        public int ProductId { get; set; }
        public int StoreId { get; set; }
    }
    public class ReadStockDto
    {
        public int Id { get; set; }
        public int? Quantity { get; set; }
        public decimal Price { get; set; }
        public decimal Discount { get; set; }
        public ProductDto Product { get; set; }
        public StoreDto Store { get; set; }
        public decimal DiscountedPrice => Price - (decimal)Math.Round((decimal)Price * Discount / 100, 2);
    }
}
