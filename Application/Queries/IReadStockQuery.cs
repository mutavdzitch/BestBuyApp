using Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries
{
    public interface IReadStockQuery : IQuery<int, ReadStockDto>
    {
    }
}
