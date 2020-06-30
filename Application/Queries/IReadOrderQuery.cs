using Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries
{
    public interface IReadOrderQuery : IQuery<int, ReadOrderDto>
    {
    }
}
