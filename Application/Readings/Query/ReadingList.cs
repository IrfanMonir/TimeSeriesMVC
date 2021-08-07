using MediatR;

using System;
using System.Collections.Generic;

namespace Application.Readings.Query
{
    public class ReadingList : IRequest<List<ReadingsDto>>
    {

        public int BuildingId { get; set; }

        public int ObjectId { get; set; }

        public int DataFieldId { get; set; }


        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }
        public ReadingList(int buildingId, int objectId,
            int dataFieldId, DateTime startTime, DateTime endTime)
        {
            BuildingId = buildingId;
            ObjectId = objectId;
            DataFieldId = dataFieldId;
            StartTime = startTime;
            EndTime = endTime;
        }


        public ReadingList()
        {

        }
    }
}
