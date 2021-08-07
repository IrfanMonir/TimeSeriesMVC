using Application.Common.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Domain.Entities;

namespace Application.Objects
{
    public interface IObjectsService:IDisposable
    {
        Task<Result> CreateObject(Domain.Entities.Object objects);
        Task<List<Domain.Entities.Object>> GetObjectList();
    }
}
