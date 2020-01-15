using System.Collections.Generic;

namespace TillApp.Shared.Dtos
{
    public class ProductDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }

        public virtual ICollection<OrderItemDto> OrderItem { get; set; }
    }
}
