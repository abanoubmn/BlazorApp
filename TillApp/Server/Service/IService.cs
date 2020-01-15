using System.Collections.Generic;
using System.Threading.Tasks;

namespace TillApp.Server.Service
{
    public interface IService<Dto>
    {
        Task<Dto> GetById(int id);
        Task<IEnumerable<Dto>> GetAll();
        Task<Dto> Insert(Dto entity);
        Task<Dto> Update(Dto entity);
        Task<bool> Delete(int id);
    }
}
