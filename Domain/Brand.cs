using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Brand : BaseEntity
    {
        public string Name { get; set; }
        public ICollection<Product> BrandProducts { get; set; }
    }
}
