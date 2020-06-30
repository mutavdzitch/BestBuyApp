using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace EfDataAccess.Configurations
{
    public class DelivererConfiguration : IEntityTypeConfiguration<Deliverer>
    {
        public void Configure(EntityTypeBuilder<Deliverer> builder)
        {
            builder.Property(x => x.Name)
                .HasMaxLength(20)
                .IsRequired();
            builder.Property(x => x.Price)
                .HasMaxLength(6)
                .IsRequired();

            builder.HasIndex(x => x.Name).IsUnique();

            builder.HasMany(x => x.DelivererOrders)
                .WithOne(y => y.Deliverer)
                .HasForeignKey(y => y.DelivererId)
                .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
