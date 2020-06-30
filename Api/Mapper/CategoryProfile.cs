using Application.DataTransfer;
using AutoMapper;
using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Mapper
{
    public class CategoryProfile : Profile
    {
        public CategoryProfile()
        {
            CreateMap<Category, CategoryDto>();

            CreateMap<Category, ReadCategoryDto>()
                .ForMember(dto => dto.Products, opt => opt.MapFrom(category => category.CategoryProducts.Select(x => new ProductDto
                {
                    Id = x.Id,
                    Name = x.Name,
                    Description = x.Description,
                    BrandId = x.BrandId,
                    CategoryId = x.CategoryId,
                    ImagePath = x.ImagePath
                })));

            CreateMap<CategoryDto, Category>();
        }
    }
}
