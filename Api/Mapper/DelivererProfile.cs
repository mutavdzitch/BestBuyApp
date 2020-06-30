using Application.DataTransfer;
using AutoMapper;
using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Api.Mapper
{
    public class DelivererProfile : Profile
    {
        public DelivererProfile()
        {
            CreateMap<Deliverer, DelivererDto>();

            CreateMap<Deliverer, ReadDelivererDto>()
                .ForMember(dto => dto.Orders, opt => opt.MapFrom(user => user.DelivererOrders.Select(x => new ReadOrderDto
                {
                    Id = x.Id,
                    CreatedAt = x.CreatedAt,
                    OrderDate = x.OrderDate,
                    ShippedDate = x.ShippedDate,
                    Address = x.Address,
                    UserId = x.UserId,
                    UserInfo = x.User.FirstName + " " + x.User.LastName,
                    StatusName = x.Status.ToString(),
                    Items = x.OrderItems.Select(y => new ItemDto
                    {
                        Id = y.Id,
                        OrderId = y.OrderId,
                        Quantity = y.Quantity,
                        StockId = y.StockId,
                        Price = y.Price
                    }),
                    TotalPrice = x.OrderItems.Sum(x => x.Price * x.Quantity) + x.Deliverer.Price
                })));

            CreateMap<DelivererDto, Deliverer>();
        }
    }
}
