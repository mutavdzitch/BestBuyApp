using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Deliverer : BaseEntity
    {
        public static int DefaultStatusId => 1;
        public string Name { get; set; }
        public decimal Price { get; set; }
        public ICollection<Order> DelivererOrders { get; set; }
    }
}
