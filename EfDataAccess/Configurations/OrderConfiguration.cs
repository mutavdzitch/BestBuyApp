using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace EfDataAccess.Configurations
{
    public class OrderConfiguration : IEntityTypeConfiguration<Order>
    {
        public void Configure(EntityTypeBuilder<Order> builder)
        {
            builder.Property(x => x.OrderDate)
                .IsRequired();

            builder.Property(x => x.Status)
                .HasDefaultValue(OrderStatus.Recieved);

            builder.Property(x => x.Address)
                .HasMaxLength(50)
                .IsRequired();

            builder.HasOne(x => x.User)
               .WithMany(y => y.UserOrders)
               .HasForeignKey(x => x.UserId)
               .OnDelete(DeleteBehavior.Restrict);

            builder.HasOne(x => x.Deliverer)
               .WithMany(y => y.DelivererOrders)
               .HasForeignKey(x => x.DelivererId)
               .OnDelete(DeleteBehavior.Restrict);

            builder.HasMany(x => x.OrderItems)
                .WithOne(y => y.Order)
                .HasForeignKey(y => y.OrderId)
                .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
