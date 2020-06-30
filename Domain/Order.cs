using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Order : BaseEntity
    {
        public DateTime OrderDate { get; set; }
        public DateTime? ShippedDate { get; set; }
        public int UserId { get; set; }
        public string Address { get; set; }
        public int DelivererId { get; set; }
        public User User { get; set; }
        public Deliverer Deliverer { get; set; }
        public ICollection<Item> OrderItems { get; set; } = new HashSet<Item>();
        public OrderStatus Status { get; set; }
    }
    public enum OrderStatus
    {
        Recieved,
        Delivered,
        Shipped,
        Canceled
    }
}
