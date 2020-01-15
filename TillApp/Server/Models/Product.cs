using System;
using System.Collections.Generic;

namespace TillApp.Server.Models
{
    public partial class Product
    {
        public Product()
        {
            OrderItem = new HashSet<OrderItem>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }

        public virtual ICollection<OrderItem> OrderItem { get; set; }
    }
}
