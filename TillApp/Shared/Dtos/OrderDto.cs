using System.Collections.Generic;

namespace TillApp.Shared.Dtos
{
    public class OrderDto
    {
        public int Id { get; set; }
        public string OrderName { get; set; }
        public decimal Amount { get; set; }
        public bool IsPaid { get; set; }

        public virtual ICollection<OrderItemDto> OrderItem { get; set; }

    }
}
