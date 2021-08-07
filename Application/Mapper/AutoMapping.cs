using Application.Buildings;
using Application.Buildings.Command;
using Application.DataFields;
using Application.DataFields.Command;
using Application.Objects;
using Application.Objects.Command;
using Application.Readings;

using AutoMapper;
using Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Mapper
{
    public class AutoMapping:Profile
    {
        public AutoMapping()
        {
            CreateMap<Reading, ReadingsDto>();
            CreateMap<Building, BuildingDto>();
            CreateMap<BuildingDto, Building>();
            CreateMap<Building, CreateBuilding>();
            CreateMap<CreateBuilding, Building>();
            CreateMap<Domain.Entities.Object, CreateObject>();
            CreateMap<CreateObject, Domain.Entities.Object>();
            CreateMap<Domain.Entities.Object, ObjectsDto>();
            CreateMap<ObjectsDto, Domain.Entities.Object>();
            CreateMap<DataField, DataFieldsDto>();
            CreateMap<DataFieldsDto, DataField>();
            CreateMap<DataField, CreateDataField>();
            CreateMap<CreateDataField, DataField>();
        }
    }
}
