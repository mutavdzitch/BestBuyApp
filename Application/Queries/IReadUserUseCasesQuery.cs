using Application.DataTransfer;
using Application.Pagination;
using Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries
{
    public interface IReadUserUseCasesQuery : IQuery<UserUseCaseSearch, PagedResponse<UserUseCaseDto>>
    {
    }
}
