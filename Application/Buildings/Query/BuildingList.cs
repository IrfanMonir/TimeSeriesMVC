using MediatR;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Buildings.Query
{
    public class BuildingList: IRequest<List<BuildingDto>>
    {

    }
}
