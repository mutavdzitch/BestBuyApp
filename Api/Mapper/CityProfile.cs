using Application.DataTransfer;
using AutoMapper;
using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Api.Mapper
{
    public class CityProfile : Profile
    {
        public CityProfile()
        {
            CreateMap<City, CityDto>();

            CreateMap<City, ReadCityDto>()
                .ForMember(dto => dto.Users, opt => opt.MapFrom(city => city.CityUsers.Select(x => new ReadUserDto
                {
                    Id = x.Id,
                    FirstName = x.FirstName,
                    LastName = x.LastName,
                    Email = x.Email,
                    Phone = x.Phone,
                    Address = x.Address
                })))
                .ForMember(dto => dto.Stores, opt => opt.MapFrom(city => city.CityStores.Select(x => new ReadStoreDto
                {
                    Id = x.Id,
                    Name = x.Name,
                    Email = x.Email,
                    Phone = x.Phone,
                    WebSite = x.WebSite,
                    Address = x.Address
                })));

            CreateMap<CityDto, City>();
        }
    }
}
