using Application.Common.Models;
using MediatR;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Objects.Command
{
    public class CreateObject: IRequest<Result>
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }
}
