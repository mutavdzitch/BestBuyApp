using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Searches
{
    public class UseCaseLogSearch : PagedSearch
    {
        public int? Id { get; set; }
        public DateTime? MinDate { get; set; }
        public DateTime? MaxDate { get; set; }
        public string UseCaseName { get; set; }
        public string Data { get; set; }
        public string Actor { get; set; }
    }
}
