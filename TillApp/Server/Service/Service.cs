using AutoMapper;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using System.Threading.Tasks;
using TillApp.Server.Repository;

namespace TillApp.Server.Service
{
    public class Service<Dto, TModel> : IService<Dto>
    {
        protected readonly IRepository<TModel> _repository;
        protected readonly IMapper _mapper;
        protected readonly ILogger _logger;
        public Service(IRepository<TModel> repository, IMapper mapper, ILogger<Service<Dto,TModel>> logger)
        {
            _repository = repository;
            _mapper = mapper;
            _logger = logger;
        }
        public async Task<bool> Delete(int id)
        {
            _logger.LogInformation("Delete " + typeof(TModel).Name + " of Id: " + id);
            return await _repository.Delete(id);
        }

        public async Task<IEnumerable<Dto>> GetAll()
        {
            _logger.LogInformation("Select all " + typeof(TModel).Name);
            var entities = await _repository.GetAll();
            IEnumerable<Dto> dtos = _mapper.Map<IEnumerable<Dto>>(entities);
            return dtos;
        }

        public async Task<Dto> GetById(int id)
        {
            _logger.LogInformation("Select " + typeof(TModel).Name+" of Id: "+id);
            TModel entity = await _repository.GetById(id);
            Dto dto = _mapper.Map<Dto>(entity);
            return dto;
        }

        public virtual async Task<Dto> Insert(Dto entity)
        {
            _logger.LogInformation("Insert " + typeof(TModel).Name);
            TModel model = _mapper.Map<TModel>(entity);
            return _mapper.Map<Dto>(await _repository.Insert(model));
        }

        public async Task<Dto> Update(Dto entity)
        {
            _logger.LogInformation("Update " + typeof(TModel).Name);
            TModel model = _mapper.Map<TModel>(entity);
            return _mapper.Map<Dto>(await _repository.Update(model));
        }
    }
}
