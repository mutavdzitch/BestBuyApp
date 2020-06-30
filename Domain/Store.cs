using System;
using System.Collections.Generic;
using System.Net.Sockets;
using System.Text;

namespace Domain
{
    public class Store : BaseEntity
    {
        public string Name { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string WebSite { get; set; }
        public string Address { get; set; }
        public int CityId { get; set; }
        public City City { get; set; }
        public ICollection<Stock> StoreStocks { get; set; }
    }
}
