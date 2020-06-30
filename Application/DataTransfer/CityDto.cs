using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer
{
    public class CityDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int PostalCode { get; set; }
    }
    public class ReadCityDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int PostalCode { get; set; }
        public IEnumerable<ReadUserDto> Users { get; set; } = new List<ReadUserDto>();
        public IEnumerable<ReadStoreDto> Stores { get; set; } = new List<ReadStoreDto>();
    }
}
