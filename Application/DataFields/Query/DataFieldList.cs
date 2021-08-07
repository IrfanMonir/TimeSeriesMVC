using MediatR;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataFields.Query
{
    public class DataFieldList: IRequest<List<DataFieldsDto>>
    {
    }
}
