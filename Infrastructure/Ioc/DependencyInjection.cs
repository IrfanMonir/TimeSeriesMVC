using Application.Buildings;
using Application.DataFields;
using Application.Objects;
using Application.Readings;

using Infrastructure.Services;

using Microsoft.Extensions.DependencyInjection;

namespace Infrastructure.Ioc
{
    public static class DependencyInjection
    {
        public static IServiceCollection AddInfrastructure(this IServiceCollection services)
        {
            services.AddTransient<IBuildingService, BuildingService>();
            services.AddTransient<IObjectsService, ObjectService>();
            services.AddTransient<IDataFieldService, DataFieldService>();
            services.AddTransient<IReadingService, ReadingService>();
            services.AddTransient<IDropDownService, DropDownService>();
            return services;
        }
    }
}
