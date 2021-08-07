using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using Object = Domain.Entities.Object;

namespace Infrastructure.Persistence
{
    public class ApplicationDbContext:DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
           : base(options)
        {
        }
        public DbSet<Building> Buildings { get; set; }
        public DbSet<Object> Objects { get; set; }
        public DbSet<DataField> DataFields { get; set; }
        public DbSet<Reading> Readings { get; set; }
        
    }
}
