using Application.Buildings;
using Application.Common.Models;
using Domain.Entities;
using Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.Services
{
    public class BuildingService : IBuildingService
    {
        private readonly ApplicationDbContext _dbContext;
        public BuildingService(ApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<Result> CreateBuilding(Building building)
        {
            await _dbContext.Buildings.AddAsync(building);
            var result = await _dbContext.SaveChangesAsync() > 0;
            if (result)
                return Result.Success();
            return Result.Failure(new List<string> { "Data insert failed" });

        }

        public async Task<List<Building>> GetBuildingList()
        {
            var list = await _dbContext.Buildings.ToListAsync();

            return list;
        }

        public void Dispose()
        {
            _dbContext.DisposeAsync();
        }
    }
}
