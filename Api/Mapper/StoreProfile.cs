using Application.DataTransfer;
using AutoMapper;
using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Mapper
{
    public class StoreProfile : Profile
    {
        public StoreProfile()
        {
            CreateMap<Store, StoreDto>();

            CreateMap<Store, ReadStoreDto>()
                .ForMember(dto => dto.Stocks, opt => opt.MapFrom(store => store.StoreStocks.Select(x => new StockDto
                {
                    Id = x.Id,
                    Quantity = x.Quantity,
                    Price = x.Price,
                    Discount = x.Discount,
                    ProductId = x.ProductId,
                    StoreId = x.StoreId
                })));

            CreateMap<StoreDto, Store>();
        }
    }
}
