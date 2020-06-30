using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class City : BaseEntity
    {
        public string Name { get; set; }
        public int PostalCode { get; set; }
        public ICollection<User> CityUsers { get; set; }
        public ICollection<Store> CityStores { get; set; }
    }
}
