using Application.Common.Models;

using Domain.Entities;

using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Application.Readings
{
    public interface IReadingService : IDisposable
    {
        Task<Result> CreateReading(Reading reading);
        Task<List<Reading>> GetReadingList();
        Task<List<Reading>> GetReadingList(int buildingId, int objectId,
            int dataFieldId, DateTime startTime, DateTime endTime);
    }
}
