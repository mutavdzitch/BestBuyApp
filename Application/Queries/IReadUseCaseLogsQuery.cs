using Application.DataTransfer;
using Application.Pagination;
using Application.Searches;
using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries
{
    public interface IReadUseCaseLogsQuery : IQuery<UseCaseLogSearch, PagedResponse<UseCaseLogDto>>
    {
    }
}
