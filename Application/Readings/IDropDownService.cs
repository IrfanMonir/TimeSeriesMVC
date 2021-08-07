using System.Threading.Tasks;

namespace Application.Readings
{
    public interface IDropDownService
    {
        Task<DropdownListDto> GetDropDown();
    }
}
