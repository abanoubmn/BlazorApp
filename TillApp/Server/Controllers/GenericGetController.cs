using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using TillApp.Server.Service;

namespace TillApp.Server.Controllers
{
    public class GenericGetController<Dto> : ControllerBase
    {
        protected readonly IService<Dto> _service;

        public GenericGetController(IService<Dto> service)
        {
            _service = service;
        }

        [HttpGet]
        public virtual async Task<ActionResult<IEnumerable<Dto>>> Get()
        {
            return Ok(await _service.GetAll());
        }

        [HttpGet("{id}")]
        public virtual async Task<ActionResult<dynamic>> Get(int id)
        {
            var entity = await _service.GetById(id);

            if (entity == null)
            {
                return NotFound();
            }

            return entity;
        }
    }
}