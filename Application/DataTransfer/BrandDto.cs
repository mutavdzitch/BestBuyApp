using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer
{
    public class BrandDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }
    public class ReadBrandDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public IEnumerable<ProductDto> Products { get; set; } = new List<ProductDto>();
    }
}
