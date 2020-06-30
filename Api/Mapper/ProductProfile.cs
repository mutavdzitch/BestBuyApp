using Application.DataTransfer;
using AutoMapper;
using Domain;
using Microsoft.CodeAnalysis;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Mapper
{
    public class ProductProfile : Profile
    {
        public ProductProfile()
        {
            CreateMap<Product, ProductDto>();

            CreateMap<Product, ReadProductDto>()
                .ForMember(dto => dto.Stocks, opt => opt.MapFrom(product => product.ProductStocks.Select(x => new StockDto
                {
                    Id = x.Id,
                    Quantity = x.Quantity,
                    Price = x.Price,
                    Discount = x.Discount,
                    ProductId = x.ProductId,
                    StoreId = x.StoreId
                })));

            CreateMap<ProductDto, Product>();
                
        }
    }
}
