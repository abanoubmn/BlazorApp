using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using TillApp.Server.Service;

namespace TillApp.Server.Controllers
{
    public class GenericController<Dto> : GenericGetController<Dto>
    {
        public GenericController(IService<Dto> service) : base(service)
        {
        }

        public virtual async Task<IActionResult> Put(Dto entity)
        {
            return Ok(await _service.Update(entity));
        }

        [HttpPost]
        public virtual async Task<ActionResult<Dto>> Post(Dto entity)
        {
            return Ok(await _service.Insert(entity));
        }

        [HttpDelete("{id}")]
        public virtual async Task<ActionResult<Dto>> Delete(int id)
        {
            if (await _service.Delete(id))
            {
                return Ok();
            }
            return NotFound();
        }
    }
}