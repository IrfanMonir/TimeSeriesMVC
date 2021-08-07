using Application.Common.Models;
using Application.Readings;

using Domain.Entities;

using Infrastructure.Persistence;

using Microsoft.EntityFrameworkCore;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Infrastructure.Services
{
    public class ReadingService : IReadingService
    {
        private readonly ApplicationDbContext _dbContext;
        public ReadingService(ApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }
        public Task<Result> CreateReading(Reading reading)
        {
            throw new NotImplementedException();
        }


        public async Task<List<Reading>> GetReadingList(int buildingId, int objectId, int dataFieldId, DateTime startTime, DateTime endTime)
        {




            var list = await _dbContext.Readings
                  .Where(b =>
                     b.BuildingId == buildingId ||
                      b.ObjectId == objectId ||
                      b.DataFieldId == dataFieldId ||
                     (b.TimeStamp >= startTime && b.TimeStamp <= endTime)
                      //    (b.TimeStamp.Day >=startTime.Day && b.TimeStamp.Month>=startTime.Month&& b.TimeStamp.Year>=startTime.Year && b.TimeStamp.Hour>=startTime.Hour&&b.TimeStamp.Minute>=startTime.Minute) 
                      //  (b.TimeStamp.Day <= startTime.Day && b.TimeStamp.Month <= startTime.Month && b.TimeStamp.Year <= startTime.Year && b.TimeStamp.Hour <= startTime.Hour && b.TimeStamp.Minute <= startTime.Minute)
                      ).ToListAsync();


            return list;
        }
        public void Dispose()
        {
            _dbContext.DisposeAsync();
        }

        public async Task<List<Reading>> GetReadingList()
        {
            var readinglist = await _dbContext.Readings.ToListAsync();
            //List<ReadingsDto> readingsDtos = new List<ReadingsDto>();
            //foreach (var item in readinglist)
            //{
            //    var readingData = new ReadingsDto
            //    {
            //        Id = item.Id,
            //        BuildingId = item.BuildingId,
            //        //Buildings = await _dbContext.Buildings.Where(c => c.Id == item.BuildingId).ToListAsync(),

            //        DataFieldId = item.DataFieldId,

            //        ObjectId = item.ObjectId,

            //        Value = item.Value,
            //        TimeStamp = item.TimeStamp,
            //    };
            //    readingsDtos.Add(readingData);
            //}

            return readinglist;
        }
    }
}
