using AutoMapper;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TillApp.Server.Models;
using TillApp.Server.Repository;
using TillApp.Shared.Dtos;

namespace TillApp.Server.Service
{
    public class OrderService : Service<OrderDto, Order>
    {
        public OrderService(IRepository<Order> repository, IMapper mapper, ILogger<Service<OrderDto, Order>> logger) : base(repository, mapper, logger)
        {
        }

        public async Task SetIsPaid(int id)
        {
            await ((OrderRepository)_repository).SetIsPaid(id);
        }
    }
}
