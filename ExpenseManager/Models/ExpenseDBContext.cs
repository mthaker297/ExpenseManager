using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace ExpenseManager.Models
{
    public class ExpenseDBContext : IdentityDbContext<IdentityUser>
    {

        public ExpenseDBContext(DbContextOptions<ExpenseDBContext> dbContextOptions) : base(dbContextOptions)
        {

        }

        public virtual DbSet<ExpenseReportModel> ExpenseReports { get; set; }
        public virtual DbSet<CategoryModel> Categories { get; set; }
        public virtual DbSet<PaymentTypeModel> PaymentTypes { get; set; }
    }
}
