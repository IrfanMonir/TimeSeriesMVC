using Application.Common.Models;
using AutoMapper;
using Domain.Entities;
using MediatR;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Application.DataFields.Command
{
    public class CreateDataFieldHandler : IRequestHandler<CreateDataField, Result>
    {
        private readonly IDataFieldService _dataFieldService;
        private readonly IMapper _mapper;
        public CreateDataFieldHandler(IDataFieldService dataFieldService,IMapper mapper)
        {
            _dataFieldService = dataFieldService;
            _mapper = mapper;
        }
        public async Task<Result> Handle(CreateDataField request, CancellationToken cancellationToken)
        {
            var dataField = _mapper.Map<DataField>(request);
            var result = await _dataFieldService.CreateDataField(dataField);
            return result;
        }
    }
}
