using Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Commands
{
    public interface ICreateStockCommand : ICommand<StockDto>
    {
    }
}
