using Application.Common.Models;
using AutoMapper;
using MediatR;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Domain.Entities;

namespace Application.Objects.Command
{
    public class CreateObjectHandler : IRequestHandler<CreateObject, Result>
    {
        private readonly IObjectsService _objectsService;
        private readonly IMapper _mapper;
        public CreateObjectHandler(IObjectsService objectsService, IMapper mapper)
        {
            _objectsService = objectsService;
            _mapper = mapper;
        }
        public async Task<Result> Handle(CreateObject request, CancellationToken cancellationToken)
        {
            var objects = _mapper.Map<Domain.Entities.Object>(request);
            var result = await _objectsService.CreateObject(objects);
            return result;
        }
    }
}
