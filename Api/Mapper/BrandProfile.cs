using Application.DataTransfer;
using AutoMapper;
using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Mapper
{
    public class BrandProfile : Profile
    {
        public BrandProfile()
        {
            CreateMap<Brand, BrandDto>();

            CreateMap<Brand, ReadBrandDto>()
                .ForMember(dto => dto.Products, opt => opt.MapFrom(brand => brand.BrandProducts.Select(x => new ProductDto
                {
                    Id = x.Id,
                    Name = x.Name,
                    Description = x.Description,
                    BrandId = x.BrandId,
                    CategoryId = x.CategoryId,
                    ImagePath = x.ImagePath
                })));

            CreateMap<BrandDto, Brand>();
        }
    }
}
