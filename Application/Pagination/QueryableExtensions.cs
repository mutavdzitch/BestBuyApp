using Application.Pagination;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Application
{
    public static class QueryableExtensions
    {
        public static PagedResponse<T> AsPagedResponse<T>(this IQueryable<T> source, int perPage, int currentPage)
            where T : class
        {
            var itemsToSkip = perPage * (currentPage - 1);

            return new PagedResponse<T>
            {
                TotalCount = source.Count(),
                CurrentPage = currentPage,
                ItemsPerPage = perPage,
                Items = source.Skip(itemsToSkip).Take(perPage).ToList()
            };
        }
    }
}
