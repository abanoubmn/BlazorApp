using Microsoft.AspNetCore.Mvc;
using TillApp.Server.Service;
using TillApp.Shared.Dtos;

namespace TillApp.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : GenericGetController<ProductDto>
    {
        public ProductController(IService<ProductDto> service) : base(service)
        {
        }
    }
}