using System;

namespace Application.Readings
{
    public class ReadingsDto
    {
        public int Id { get; set; }
        public int BuildingId { get; set; }

        public int ObjectId { get; set; }


        public int DataFieldId { get; set; }

        public double Value { get; set; }
        public DateTime TimeStamp { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }



    }
}
