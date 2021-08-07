using MediatR;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Objects.Query
{
    public class ObjectsList: IRequest<List<ObjectsDto>>
    {

    }
}
