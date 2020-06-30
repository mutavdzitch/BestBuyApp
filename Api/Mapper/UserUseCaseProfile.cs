using Application.DataTransfer;
using AutoMapper;
using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Mapper
{
    public class UserUseCaseProfile : Profile
    {
        public UserUseCaseProfile()
        {
            CreateMap<UserUseCase, UserUseCaseDto>();
            CreateMap<UserUseCaseDto, UserUseCase>();
        }
    }
}
