﻿using Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries
{
    public interface IReadProductQuery : IQuery<int, ReadProductDto>
    {
    }
}
