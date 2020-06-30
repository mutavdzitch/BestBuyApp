using Application.DataTransfer;
using AutoMapper;
using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Mapper
{
    public class OrderProfile : Profile
    {
        public OrderProfile()
        {
            CreateMap<Order, OrderDto>();

            CreateMap<Order, ReadOrderDto>()
                .ForMember(dto => dto.UserInfo, opt => opt.MapFrom(x => x.User.FirstName + " " + x.User.LastName))
                .ForMember(dto=>dto.StatusName, opt => opt.MapFrom(x => x.Status.ToString()))
                .ForMember(dto => dto.Items, opt => opt.MapFrom(order => order.OrderItems.Select(x => new ItemDto
                {
                    Id = x.Id,
                    OrderId = x.OrderId,
                    Quantity = x.Quantity,
                    StockId = x.StockId,
                    Price = x.Price
                })))
                .ForMember(dto => dto.TotalPrice, opt => opt.MapFrom(order => order.OrderItems.Sum(x => x.Price * x.Quantity) + order.Deliverer.Price));

            CreateMap<OrderDto, Order>();
        }
    }
}
