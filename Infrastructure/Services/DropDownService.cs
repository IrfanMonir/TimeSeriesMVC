using Application.Readings;

using Infrastructure.Persistence;

using Microsoft.EntityFrameworkCore;

using System.Threading.Tasks;

namespace Infrastructure.Services
{
    public class DropDownService : IDropDownService
    {
        private readonly ApplicationDbContext _dbContext;
        public DropDownService(ApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }
        public async Task<DropdownListDto> GetDropDown()
        {
            var model = new DropdownListDto()
            {
                Buildings = await _dbContext.Buildings.ToListAsync(),
                DataFields = await _dbContext.DataFields.ToListAsync(),
                Objects = await _dbContext.Objects.ToListAsync(),
            };
            return model;
        }
    }
}
