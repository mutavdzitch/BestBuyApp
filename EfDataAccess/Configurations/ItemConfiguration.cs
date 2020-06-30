using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace EfDataAccess.Configurations
{
    public class ItemConfiguration : IEntityTypeConfiguration<Item>
    {
        public void Configure(EntityTypeBuilder<Item> builder)
        {
            builder.Property(x => x.Quantity)
                .HasMaxLength(2);

            builder.Property(x => x.Price)
                .HasMaxLength(6)
                .IsRequired();

            builder.HasOne(x => x.Order)
                .WithMany(y => y.OrderItems)
                .HasForeignKey(x => x.OrderId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasOne(x => x.Stock)
               .WithMany(y => y.StockItems)
               .HasForeignKey(x => x.StockId)
               .OnDelete(DeleteBehavior.Restrict);
            
        }
    }
}
