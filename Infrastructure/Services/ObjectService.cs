using Application.Common.Models;
using Application.Objects;
using Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.Services
{
    public class ObjectService : IObjectsService
    {
        private readonly ApplicationDbContext _dbContext;
        public ObjectService(ApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }
        public async Task<Result> CreateObject(Domain.Entities.Object objects)
        {
            await _dbContext.Objects.AddAsync(objects);
            var result = await _dbContext.SaveChangesAsync() > 0;
            if (result)
                return Result.Success();
            return Result.Failure(new List<string> { "Data insert failed" });
        }

        public async Task<List<Domain.Entities.Object>> GetObjectList()
        {
            var list = await _dbContext.Objects.ToListAsync();
            return list;
        }

        public void Dispose()
        {
            _dbContext.DisposeAsync();
        }
    }
}
