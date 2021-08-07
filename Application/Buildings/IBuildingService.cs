using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Application.Common.Models;
using Domain.Entities;

namespace Application.Buildings
{
    public interface IBuildingService:IDisposable
    {
        Task<Result> CreateBuilding(Building building);
        Task<List<Building>> GetBuildingList();
    }
}
