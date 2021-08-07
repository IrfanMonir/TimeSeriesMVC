using Application.Common.Models;
using Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Application.DataFields
{
    public interface IDataFieldService:IDisposable
    {
        Task<Result> CreateDataField(DataField dataField);
        Task<List<DataField>> GetDataFieldList();
    }
}
