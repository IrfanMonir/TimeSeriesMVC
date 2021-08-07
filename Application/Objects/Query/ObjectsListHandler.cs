using AutoMapper;
using MediatR;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Objects.Query
{
    public class ObjectsListHandler : IRequestHandler<ObjectsList, List<ObjectsDto>>
    {
        private readonly IMapper _mapper;
        private readonly IObjectsService _objectService;
        public ObjectsListHandler(IObjectsService objectsService,IMapper mapper)
        {
            _objectService = objectsService;
            _mapper = mapper;
        }
        public async Task<List<ObjectsDto>> Handle(ObjectsList request, CancellationToken cancellationToken)
        {
            var objects = await _objectService.GetObjectList();
            return _mapper.Map<List<ObjectsDto>>(objects);
        }
    }
}
