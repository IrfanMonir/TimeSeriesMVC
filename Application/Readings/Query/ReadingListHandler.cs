using AutoMapper;

using MediatR;

using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Readings.Query
{
    public class ReadingListHandler : IRequestHandler<ReadingList, List<ReadingsDto>>
    {
        private readonly IMapper _mapper;
        private readonly IReadingService _readingService;
        public ReadingListHandler(IReadingService readingService, IMapper mapper)
        {
            _readingService = readingService;
            _mapper = mapper;
        }
        public async Task<List<ReadingsDto>> Handle(ReadingList request, CancellationToken cancellationToken)
        {
            var str = new DateTime(01, 1, 1);
            var readings = await _readingService.GetReadingList();
            if (request.ObjectId > 0 || request.BuildingId > 0 || request.DataFieldId > 0 || request.StartTime != str || request.EndTime != str)
            {
                readings = await _readingService.GetReadingList(request.BuildingId, request.ObjectId,
               request.DataFieldId, request.StartTime, request.EndTime);
            }



            var res = _mapper.Map<List<ReadingsDto>>(readings);
            return res;
        }
    }
}
