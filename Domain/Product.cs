using System;
using System.Collections.Generic;
using System.Reflection.Metadata.Ecma335;
using System.Text;

namespace Domain
{
    public class Product : BaseEntity
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public int BrandId { get; set; }
        public int CategoryId { get; set; }
        public Brand Brand { get; set; }
        public Category Category { get; set; }
        public string ImagePath { get; set; }
        public ICollection<Stock> ProductStocks { get; set; }
    }
}
