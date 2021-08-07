using Application.Common.Models;
using MediatR;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataFields.Command
{
    public class CreateDataField : IRequest<Result>
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }
}
