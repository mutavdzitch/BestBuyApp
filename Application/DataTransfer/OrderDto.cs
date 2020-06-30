using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Application.DataTransfer
{
    public class OrderDto
    {
        public int Id { get; set; }
        public DateTime OrderDate { get; set; }
        public string Address { get; set; }
        public int UserId { get; set; }
        public int DelivererId { get; set; }
        public IEnumerable<ItemDto> Items { get; set; } = new List<ItemDto>();
    }
    public class ReadOrderDto
    {
        public int Id { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime OrderDate { get; set; }
        public DateTime? ShippedDate { get; set; }
        public string Address { get; set; } 
        public int UserId { get; set; }
        public string UserInfo { get; set; }
        public DelivererDto Deliverer { get; set; }
        public string StatusName { get; set; }
        public IEnumerable<ItemDto> Items { get; set; } = new List<ItemDto>();
        public decimal TotalPrice { get; set; }
    }

    public class ChangeOrderStatusDto
    {
        public int OrderId { get; set; }
        public OrderStatus Status { get; set; }
    }
}
