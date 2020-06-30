using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer
{
    public class ProductDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int BrandId { get; set; }
        public int CategoryId { get; set; }

        public IFormFile Image { get; set; }
        public string ImagePath { get; set; }
    }

    public class ReadProductDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public BrandDto Brand { get; set; }
        public CategoryDto Category { get; set; }
        public string ImagePath { get; set; }
        public IEnumerable<StockDto> Stocks { get; set; } = new List<StockDto>();
    }
}
