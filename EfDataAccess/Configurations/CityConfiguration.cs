using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace EfDataAccess.Configurations
{
    public class CityConfiguration : IEntityTypeConfiguration<City>
    {
        public void Configure(EntityTypeBuilder<City> builder)
        {
            builder.Property(x => x.Name)
                .HasMaxLength(20)
                .IsRequired();
            builder.Property(x => x.PostalCode)
                .HasMaxLength(5)
                .IsRequired();

            builder.HasIndex(x => x.Name).IsUnique();
            builder.HasIndex(x => x.PostalCode).IsUnique();

            builder.HasMany(x => x.CityUsers)
                .WithOne(y => y.City)
                .HasForeignKey(y => y.CityId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasMany(x => x.CityStores)
                .WithOne(y => y.City)
                .HasForeignKey(y => y.CityId)
                .OnDelete(DeleteBehavior.Restrict);

        }
    }
}
