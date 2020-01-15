using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TillApp.Server.Models;

namespace TillApp.Server.Repository
{
    public class Repository<T> : IRepository<T> where T : class
    {
        protected OrderPOSContext _orderPOSContext;
        private DbSet<T> ds;

        public Repository(OrderPOSContext companyContext)
        {
            _orderPOSContext = companyContext;
            ds = _orderPOSContext.Set<T>();
        }
        public virtual async Task<bool> Delete(int id)
        {
            var entity = await GetById(id);
            ds.Remove(entity);
            return await _orderPOSContext.SaveChangesAsync() > 1;
        }

        public virtual async Task<IEnumerable<T>> GetAll()
        {
           
            return await ds.ToListAsync();
        }

        public virtual async Task<T> GetById(int id)
        {
            return await ds.FindAsync(id);
        }

        public virtual async Task<T> Insert(T entity)
        {
            await _orderPOSContext.AddAsync(entity);
            await _orderPOSContext.SaveChangesAsync();
            return entity;
        }

        public virtual async Task<T> Update(T entity)
        {
            _orderPOSContext.Entry(entity).State = EntityState.Modified;
            await _orderPOSContext.SaveChangesAsync();
            return entity;
        }
    }
}
