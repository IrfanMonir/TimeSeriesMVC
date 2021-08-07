using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Domain.Entities
{
    public class DataField
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
    }
}
