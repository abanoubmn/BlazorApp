using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using TillApp.Server.Service;
using TillApp.Shared.Dtos;

namespace TillApp.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrderController : GenericController<OrderDto>
    {
        public OrderController(IService<OrderDto> service) : base(service)
        {
        }

        [HttpGet("SetIsPaid/{id}")]
        public async Task SetIsPaid(int id)
        {
            await ((OrderService)_service).SetIsPaid(id);
        }
    }
}