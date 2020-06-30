using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace EfDataAccess.Configurations
{
    public class StockConfiguration : IEntityTypeConfiguration<Stock>
    {
        public void Configure(EntityTypeBuilder<Stock> builder)
        {
            
            builder.Property(x => x.Price)
                .HasMaxLength(6)
                .IsRequired();
            builder.Property(x => x.Quantity)
                .HasMaxLength(5);
            builder.Property(x => x.Discount)
                .HasMaxLength(2);

            builder.HasOne(x => x.Product)
                .WithMany(y => y.ProductStocks)
                .HasForeignKey(x => x.ProductId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasOne(x => x.Store)
                .WithMany(y => y.StoreStocks)
                .HasForeignKey(x => x.StoreId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasMany(x => x.StockItems)
                .WithOne(y => y.Stock)
                .HasForeignKey(y => y.StockId)
                .OnDelete(DeleteBehavior.SetNull);
        }
    }
}
