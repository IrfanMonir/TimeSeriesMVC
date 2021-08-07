using AutoMapper;
using MediatR;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Application.DataFields.Query
{
    public class DataFieldListHandler : IRequestHandler<DataFieldList, List<DataFieldsDto>>
    {
        private readonly IMapper _mapper;
        private readonly IDataFieldService _dataFieldService;
        public DataFieldListHandler(IDataFieldService dataFieldService, IMapper mapper)
        {
            _dataFieldService = dataFieldService;
            _mapper = mapper;
        }
        public async Task<List<DataFieldsDto>> Handle(DataFieldList request, CancellationToken cancellationToken)
        {
            var dataField = await _dataFieldService.GetDataFieldList();
            return _mapper.Map<List<DataFieldsDto>>(dataField);
        }
    }
}
