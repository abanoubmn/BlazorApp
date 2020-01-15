using System.Collections.Generic;
using System.Threading.Tasks;

namespace TillApp.Server.Repository
{
    public interface IRepository<T>
    {
        Task<T> GetById(int id);
        Task<IEnumerable<T>> GetAll();
        Task<T> Insert(T entity);
        Task<T> Update(T entity);
        Task<bool> Delete(int id);
    }
}
