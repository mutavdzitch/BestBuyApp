using Application.DataTransfer;
using Application.Pagination;
using Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries
{
    public interface IReadProductsQuery : IQuery<ProductSearch, PagedResponse<ReadProductDto>>
    {
    }
}
