using AutoMapper;

using MediatR;

using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Buildings.Query
{
    public class BuildingListHandler : IRequestHandler<BuildingList, List<BuildingDto>>
    {
        private readonly IMapper _mapper;
        private readonly IBuildingService _buildingService;
        public BuildingListHandler(IBuildingService buildingService, IMapper mapper)
        {
            _buildingService = buildingService;
            _mapper = mapper;
        }
        public async Task<List<BuildingDto>> Handle(BuildingList request, CancellationToken cancellationToken)
        {
            var buildings = await _buildingService.GetBuildingList();
            return _mapper.Map<List<BuildingDto>>(buildings);
        }
    }
}
