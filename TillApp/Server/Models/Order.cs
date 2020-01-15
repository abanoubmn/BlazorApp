using System;
using System.Collections.Generic;

namespace TillApp.Server.Models
{
    public partial class Order
    {
        public Order()
        {
            OrderItem = new HashSet<OrderItem>();
        }

        public int Id { get; set; }
        public string OrderName { get; set; }
        public decimal Amount { get; set; }
        public bool IsPaid { get; set; }

        public virtual ICollection<OrderItem> OrderItem { get; set; }
    }
}
