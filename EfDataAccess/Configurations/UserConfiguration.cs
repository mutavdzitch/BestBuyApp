using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace EfDataAccess.Configurations
{
    public class UserConfiguration : IEntityTypeConfiguration<User>
    {
        public void Configure(EntityTypeBuilder<User> builder)
        {
            builder.Property(x => x.FirstName)
                .HasMaxLength(30)
                .IsRequired();
            builder.Property(x => x.LastName)
                .HasMaxLength(30)
                .IsRequired();
            builder.Property(x => x.Email)
                .HasMaxLength(50)
                .IsRequired();
            builder.Property(x => x.Password)
                .HasMaxLength(64)
                .IsRequired();
            builder.Property(x => x.Phone)
                .HasMaxLength(11)
                .IsRequired();
            builder.Property(x => x.Address)
                .HasMaxLength(50)
                .IsRequired();

            builder.HasIndex(x => x.Email).IsUnique();

            builder.HasOne(x => x.City)
                .WithMany(y => y.CityUsers)
                .HasForeignKey(x => x.CityId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasMany(x => x.UserOrders)
                .WithOne(y => y.User)
                .HasForeignKey(y => y.UserId)
                .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
