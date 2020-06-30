using Application;
using Application.DataTransfer;
using Application.Pagination;
using Application.Queries;
using Application.Searches;
using AutoMapper;
using EfDataAccess;
using Microsoft.EntityFrameworkCore.Internal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Queries
{
    public class EfReadUseCaseLogsQuery : IReadUseCaseLogsQuery
    {
        private readonly BestBuyContext _context;
        private readonly IMapper _mapper;

        public EfReadUseCaseLogsQuery(BestBuyContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 51;

        public string Name => "Read Use case logs using EF";

        public PagedResponse<UseCaseLogDto> Execute(UseCaseLogSearch search)
        {
            var query = _context.UseCaseLogs.AsQueryable();

            if(search.Id != null)
            {
                query = query.Where(x => x.Id == search.Id);
            }
            if (search.MinDate != null)
            {
                query = query.Where(x => x.Date >= search.MinDate);
            }
            if (search.MaxDate != null)
            {
                query = query.Where(x => x.Date <= search.MaxDate);
            }
            if (!string.IsNullOrEmpty(search.UseCaseName) || !string.IsNullOrWhiteSpace(search.UseCaseName))
            {
                query = query.Where(x => x.UseCaseName.ToLower().Contains(search.UseCaseName.ToLower()));
            }
            if (!string.IsNullOrEmpty(search.Data) || !string.IsNullOrWhiteSpace(search.Data))
            {
                query = query.Where(x => x.Data.ToLower().Contains(search.Data.ToLower()));
            }
            if (!string.IsNullOrEmpty(search.Actor) || !string.IsNullOrWhiteSpace(search.Actor))
            {
                query = query.Where(x => x.Actor.ToLower().Contains(search.Actor.ToLower()));
            }

            var queryPaged = query.AsPagedResponse(search.PerPage, search.Page);
            return new PagedResponse<UseCaseLogDto>()
            {
                CurrentPage = queryPaged.CurrentPage,
                ItemsPerPage = queryPaged.ItemsPerPage,
                TotalCount = queryPaged.TotalCount,
                Items = _mapper.Map<IEnumerable<UseCaseLogDto>>(queryPaged.Items)
            };
        }
    }
}
