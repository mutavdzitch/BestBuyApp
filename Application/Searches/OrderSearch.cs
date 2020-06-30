using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Searches
{
    public class OrderSearch : PagedSearch
    {
        public DateTime? MinCreatedAt { get; set; }
        public DateTime? MaxCreatedAt { get; set; }
        public DateTime? MinOrderDate { get; set; }
        public DateTime? MaxOrderDate { get; set; }
        public DateTime? MinShippedDate { get; set; }
        public DateTime? MaxShippedDate { get; set; }
        public decimal? MinTotalPrice { get; set; }
        public decimal? MaxTotalPrice { get; set; }
        public string Address { get; set; }
        public int? UserId { get; set; }
        public int? DelivererId { get; set; }
        public OrderStatus? Status { get; set; }
    }
}
