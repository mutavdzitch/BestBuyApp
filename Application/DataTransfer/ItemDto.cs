using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer
{
    public class ItemDto
    {
        public int Id { get; set; }

        public int OrderId { get; set; } //create
        public int Quantity { get; set; } //create
        public int? StockId { get; set; } //create

        public decimal Price { get; set; }
    }
}
