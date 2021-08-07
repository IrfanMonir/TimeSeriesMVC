using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Domain.Entities
{
    public class Reading
    {
        [Key]
        public int Id { get; set; }

        public int BuildingId { get; set; }
        public virtual Building Building { get; set; }

        public int ObjectId { get; set; }
        public virtual Object Object { get; set; }

        public int DataFieldId { get; set; }
        public virtual DataField DataField { get; set; }

        public double Value { get; set; }

        public DateTime TimeStamp { get; set; }
    }
}
