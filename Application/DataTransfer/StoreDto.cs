using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer
{
    public class StoreDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string WebSite { get; set; }
        public string Address { get; set; }
        public int CityId { get; set; }
    }

    public class ReadStoreDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string WebSite { get; set; }
        public string Address { get; set; }
        public CityDto City { get; set; }
        public IEnumerable<StockDto> Stocks { get; set; } = new List<StockDto>();
    }
}
