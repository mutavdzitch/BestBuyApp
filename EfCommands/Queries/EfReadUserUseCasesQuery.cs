using Application;
using Application.DataTransfer;
using Application.Pagination;
using Application.Queries;
using Application.Searches;
using AutoMapper;
using EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Queries
{
    public class EfReadUserUseCasesQuery : IReadUserUseCasesQuery
    {
        private readonly BestBuyContext _context;
        private readonly IMapper _mapper;

        public EfReadUserUseCasesQuery(BestBuyContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 48;

        public string Name => "Read Use cases using EF";

        public PagedResponse<UserUseCaseDto> Execute(UserUseCaseSearch search)
        {
            var query = _context.UserUseCases.AsQueryable();

            if(search.UseCaseId != null)
            {
                query = query.Where(x => x.UseCaseId == search.UseCaseId);
            }
            if(search.UserId != null)
            {
                query = query.Where(x => x.UserId == search.UserId);
            }

            var queryPaged = query.AsPagedResponse(search.PerPage, search.Page);
            return new PagedResponse<UserUseCaseDto>
            {
                CurrentPage = queryPaged.CurrentPage,
                ItemsPerPage = queryPaged.ItemsPerPage,
                TotalCount = queryPaged.TotalCount,
                Items = _mapper.Map<IEnumerable<UserUseCaseDto>>(queryPaged.Items)
            };
        }
    }
}
