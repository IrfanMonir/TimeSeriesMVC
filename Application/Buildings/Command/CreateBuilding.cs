using Application.Common.Models;
using MediatR;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Buildings.Command
{
    public class CreateBuilding:IRequest<Result>
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Location { get; set; }
    }
}
