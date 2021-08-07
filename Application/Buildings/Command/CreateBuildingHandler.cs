using Application.Common.Models;
using AutoMapper;
using Domain.Entities;
using MediatR;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Buildings.Command
{
    public class CreateBuildingHandler : IRequestHandler<CreateBuilding, Result>
    {
        private readonly IBuildingService _buildingService;
        private readonly IMapper _mapper;
        public CreateBuildingHandler(IBuildingService buildingService, IMapper mapper)
        {
            _buildingService = buildingService;
            _mapper = mapper;
        }

        public async Task<Result> Handle(CreateBuilding request, CancellationToken cancellationToken)
        {
            var building = _mapper.Map<Building>(request);
            var result = await _buildingService.CreateBuilding(building);
            return result;
            
        }
    }
}
