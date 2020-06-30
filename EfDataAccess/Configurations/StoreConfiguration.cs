using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace EfDataAccess.Configurations
{
    public class StoreConfiguration : IEntityTypeConfiguration<Store>
    {
        public void Configure(EntityTypeBuilder<Store> builder)
        {
            builder.Property(x => x.Name)
                .HasMaxLength(50)
                .IsRequired();
            builder.Property(x => x.Email)
                .HasMaxLength(50)
                .IsRequired();
            builder.Property(x => x.Phone)
                .HasMaxLength(11)
                .IsRequired();
            builder.Property(x => x.WebSite)
                .HasMaxLength(50)
                .IsRequired();
            builder.Property(x => x.Address)
                .HasMaxLength(50)
                .IsRequired();

            builder.HasIndex(x => x.Name).IsUnique();
            builder.HasIndex(x => x.Email).IsUnique();

            builder.HasOne(x => x.City)
                .WithMany(y => y.CityStores)
                .HasForeignKey(x => x.CityId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasMany(x => x.StoreStocks)
                .WithOne(y => y.Store)
                .HasForeignKey(y => y.StoreId)
                .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
