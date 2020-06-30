using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer
{
    public class DelivererDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }

    }
    public class ReadDelivererDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public IEnumerable<ReadOrderDto> Orders { get; set; } = new List<ReadOrderDto>();

    }
}
