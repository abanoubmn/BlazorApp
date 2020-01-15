using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TillApp.Server.Models;

namespace TillApp.Server.Repository
{
    public class OrderRepository : Repository<Order>
    {
        public OrderRepository(OrderPOSContext companyContext) : base(companyContext)
        {
        }

        public override async Task<IEnumerable<Order>> GetAll()
        {
            return await _orderPOSContext.Order.Where(x => !x.IsPaid).ToListAsync();
        }

        public override async Task<Order> GetById(int id)
        {
            return await _orderPOSContext.Order.Where(x => x.Id == id).Include(x => x.OrderItem).ThenInclude(x => x.Product).FirstOrDefaultAsync();
        }

        public override async Task<Order> Update(Order entity)
        {
            var savedItemIds = entity.OrderItem.Select(x => x.Id).ToArray();
            _orderPOSContext.OrderItem.RemoveRange(_orderPOSContext.OrderItem.Where(x => x.OrderId == entity.Id && !savedItemIds.Contains(x.Id)));
            foreach (var item in entity.OrderItem)
            {
                item.OrderId = entity.Id;
                item.Product = null;
            }
            _orderPOSContext.OrderItem.AddRange(entity.OrderItem.Where(x => x.Id == 0));
            _orderPOSContext.UpdateRange(entity.OrderItem.Where(x => x.Id > 0));
            entity.OrderItem = null;
            _orderPOSContext.Update(entity);
            await _orderPOSContext.SaveChangesAsync();
            return await GetById(entity.Id);
        }

        public async Task SetIsPaid(int id)
        {
            Order order = new Order() { Id = id, OrderName = "" };
            _orderPOSContext.Attach(order);
            order.IsPaid = true;
            _orderPOSContext.Entry(order).Property(x => x.IsPaid).IsModified = true;
            await _orderPOSContext.SaveChangesAsync();
        }
    }
}
