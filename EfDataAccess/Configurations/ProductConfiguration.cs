using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace EfDataAccess.Configurations
{
    public class ProductConfiguration : IEntityTypeConfiguration<Product>
    {
        public void Configure(EntityTypeBuilder<Product> builder)
        {
            builder.Property(x => x.Name)
                .HasMaxLength(50)
                .IsRequired();
            builder.Property(x => x.Description)
                .HasMaxLength(1000)
                .IsRequired();

            builder.HasIndex(x => x.Name).IsUnique();

            builder.HasOne(x => x.Brand)
                .WithMany(y => y.BrandProducts)
                .HasForeignKey(x => x.BrandId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasOne(x => x.Category)
                .WithMany(y => y.CategoryProducts)
                .HasForeignKey(x => x.CategoryId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasMany(x => x.ProductStocks)
                .WithOne(y => y.Product)
                .HasForeignKey(y => y.ProductId)
                .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
