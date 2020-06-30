using Application.Commands;
using Application.Email;
using Application.Hash;
using Application.Queries;
using Implementation.Commands;
using Implementation.Email;
using Implementation.Hash;
using Implementation.Queries;
using Implementation.Validators;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Core
{
    public static class ContainerExtensions
    {
        public static void AddUseCases(this IServiceCollection services)
        {

            //City
            services.AddTransient<ICreateCityCommand, EfCreateCityCommand>(); //1
            services.AddTransient<IReadCitiesQuery, EfReadCitiesQuery>(); //2
            services.AddTransient<IReadCityQuery, EfReadCityQuery>(); //3
            services.AddTransient<IUpdateCityCommand, EfUpdateCityCommand>(); //4
            services.AddTransient<IDeleteCityCommand, EfDeleteCityCommand>(); //5

            services.AddTransient<CreateCityValidator>();
            services.AddTransient<UpdateCityValidator>();

            //Deliverer
            services.AddTransient<ICreateDelivererCommand, EfCreateDelivererCommand>(); //6
            services.AddTransient<IReadDeliverersQuery, EfReadDeliverersQuery>(); //7
            services.AddTransient<IReadDelivererQuery, EfReadDelivererQuery>(); //8
            services.AddTransient<IUpdateDelivererCommand, EfUpdateDelivererCommand>(); //9
            services.AddTransient<IDeleteDelivererCommand, EfDeleteDelivererCommand>(); //10

            services.AddTransient<CreateDelivererValidator>();
            services.AddTransient<UpdateDelivererValidator>();

            //Brand
            services.AddTransient<ICreateBrandCommand, EfCreateBrandCommand>(); //11
            services.AddTransient<IReadBrandsQuery, EfReadBrandsQuery>(); //12
            services.AddTransient<IReadBrandQuery, EfReadBrandQuery>(); //13
            services.AddTransient<IUpdateBrandCommand, EfUpdateBrandCommand>(); //14
            services.AddTransient<IDeleteBrandCommand, EfDeleteBrandCommand>(); //15

            services.AddTransient<CreateBrandValidator>();
            services.AddTransient<UpdateBrandValidator>();

            //Category
            services.AddTransient<ICreateCategoryCommand, EfCreateCategoryCommand>(); //16
            services.AddTransient<IReadCategoriesQuery, EfReadCategoriesQuery>(); //17
            services.AddTransient<IReadCategoryQuery, EfReadCategoryQuery>(); //18
            services.AddTransient<IUpdateCategoryCommand, EfUpdateCategoryCommand>(); //19
            services.AddTransient<IDeleteCategoryCommand, EfDeleteCategoryCommand>(); //20

            services.AddTransient<CreateCategoryValidator>();
            services.AddTransient<UpdateCategoryValidator>();

            //Product
            services.AddTransient<ICreateProductCommand, EfCreateProductCommand>(); //21
            services.AddTransient<IReadProductsQuery, EfReadProductsQuery>(); //22
            services.AddTransient<IReadProductQuery, EfReadProductQuery>(); //23
            services.AddTransient<IUpdateProductCommand, EfUpdateProductCommand>(); //24
            services.AddTransient<IDeleteProductCommand, EfDeleteProductCommand>(); //25

            services.AddTransient<CreateProductValidator>();
            services.AddTransient<UpdateProductValidator>();

            //Store
            services.AddTransient<ICreateStoreCommand, EfCreateStoreCommand>(); //26
            services.AddTransient<IReadStoresQuery, EfReadStoresQuery>(); //27
            services.AddTransient<IReadStoreQuery, EfReadStoreQuery>(); //28
            services.AddTransient<IUpdateStoreCommand, EfUpdateStoreCommand>(); //29
            services.AddTransient<IDeleteStoreCommand, EfDeleteStoreCommand>(); //30

            services.AddTransient<CreateStoreValidator>();
            services.AddTransient<UpdateStoreValidator>();

            //Stock
            services.AddTransient<ICreateStockCommand, EfCreateStockCommand>(); //31
            services.AddTransient<IReadStocksQuery, EfReadStocksQuery>(); //32
            services.AddTransient<IReadStockQuery, EfReadStockQuery>(); //33
            services.AddTransient<IUpdateStockCommand, EfUpdateStockCommand>(); //34
            services.AddTransient<IDeleteStockCommand, EfDeleteStockCommand>(); //35

            services.AddTransient<StockValidator>(); //Create & Update

            //User & Registration
            services.AddTransient<IRegisterUserCommand, EfRegisterUserCommand>(); //36

            services.AddTransient<IReadUsersQuery, EfReadUsersQuery>(); //37
            services.AddTransient<IReadUserQuery, EfReadUserQuery>(); //38
            services.AddTransient<IUpdateUserCommand, EfUpdateUserCommand>(); //39
            services.AddTransient<IDeleteUserCommand, EfDeleteUserCommand>(); //40

            services.AddTransient<RegisterUserValidator>();
            services.AddTransient<UpdateUserValidator>();

            //Email Sender
            services.AddTransient<IEmailSender, SmtpEmailSender>();
            //Hash password
            services.AddTransient<IHashPassword, HashPassword>();


            //Order
            services.AddTransient<ICreateOrderCommand, EfCreateOrderCommand>(); //41
            services.AddTransient<IReadOrdersQuery, EfReadOrdersQuery>(); //42
            services.AddTransient<IReadOrderQuery, EfReadOrderQuery>(); //43
            services.AddTransient<IUpdateOrderCommand, EfUpdateOrderCommand>(); //44
            services.AddTransient<IDeleteOrderCommand, EfDeleteOrderCommand>(); //45
            services.AddTransient<IChangeOrderStatusCommand, EfChangeOrderStatusCommand>(); //46

            services.AddTransient<CreateOrderValidator>(); //Create & Update
            services.AddTransient<CreateItemValidator>(); //Create & Update

            //User UseCase
            services.AddTransient<ICreateUserUseCaseCommand, EfCreateUserUseCaseCommand>(); //47
            services.AddTransient<IReadUserUseCasesQuery, EfReadUserUseCasesQuery>(); //48
            services.AddTransient<IUpdateUserUseCaseCommand, EfUpdateUserUseCaseCommand>(); //49
            services.AddTransient<IDeleteUserUseCaseCommand, EfDeleteUserUseCaseCommand>(); //50

            services.AddTransient<CreateUserUseCaseValidator>();

            //Read UseCaseLogger from Database
            services.AddTransient<IReadUseCaseLogsQuery, EfReadUseCaseLogsQuery>(); //51
        }
    }
}
