using System.Collections.Generic;

namespace Application.Readings
{
    public class DropdownListDto
    {

        public IEnumerable<Domain.Entities.Building> Buildings { get; set; }
        public List<Domain.Entities.Object> Objects { get; set; }
        public List<Domain.Entities.DataField> DataFields { get; set; }
    }
}
