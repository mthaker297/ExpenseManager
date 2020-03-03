using ExpenseManager.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ExpenseManager.Services.ExpenseReport
{
    public class ExpenseReportService : IExpenseReportService
    {
        #region Fields
        private readonly ExpenseDBContext dbContext;
        #endregion

        #region Ctor
        public ExpenseReportService(ExpenseDBContext dbContext)
        {
            this.dbContext = dbContext;
        }
        #endregion

        #region Methods
        //public IList<ExpenseReportModel> GetAllExpenses(string userId)
        //{
        //    try
        //    {
        //        return dbContext.ExpenseReports.Where(x => x.ExpenseBy == userId).OrderBy(x => x.ExpenseDate).ToList();
        //    }
        //    catch (Exception)
        //    {
        //        throw;
        //    }
        //}

        public IList<ExpenseReportModel> GetSearchExpenseResult(int categoryId, string expenseName, string userId)
        {
            try
            {
                return dbContext.ExpenseReports.Where(x => x.ExpenseName.IndexOf(expenseName, StringComparison.OrdinalIgnoreCase) != -1 && (x.CategoryId == categoryId || categoryId == 0) && x.ExpenseBy == userId).ToList();                
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public ExpenseReportModel GetExpenseById(int expenseId)
        {
            try
            {
                return dbContext.ExpenseReports.Find(expenseId);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void AddExpense(ExpenseReportModel expense)
        {
            try
            {
                dbContext.ExpenseReports.Add(expense);
                dbContext.SaveChanges();
            }
            catch
            {
                throw;
            }
        }

        public void UpdateExpense(ExpenseReportModel expense)
        {
            try
            {
                dbContext.Entry(expense).State = EntityState.Modified;
                dbContext.SaveChanges();
            }
            catch
            {
                throw;
            }
        }

        public void DeleteExpense(int expenseId)
        {
            try
            {
                ExpenseReportModel emp = dbContext.ExpenseReports.Find(expenseId);
                dbContext.ExpenseReports.Remove(emp);
                dbContext.SaveChanges();
            }
            catch
            {
                throw;
            }
        }

        public int[] GetYears()
        {
            var query = (from exp in dbContext.ExpenseReports
                        select exp.ExpenseDate.Year).Distinct();

            return query.ToArray();
        }

        // To calculate last six months expense
        public Dictionary<string, decimal> CalculateMonthlyExpense(string userId)
        {
            Dictionary<string, decimal> dictMonthlySum = new Dictionary<string, decimal>();
            IList<CategoryModel> category = dbContext.Categories.ToList();

            foreach (var item in category)
            {
                decimal sum = dbContext.ExpenseReports.Where
                (exp => exp.CategoryId == item.CategoryId && (exp.ExpenseDate > DateTime.Now.AddMonths(-7)) && exp.ExpenseBy == userId)
                .Select(cat => cat.Amount).Sum();
                dictMonthlySum.Add(item.CategoryName, sum);
            }

            return dictMonthlySum;
        }
        // To calculate last four weeks expense
        public Dictionary<string, decimal> CalculateWeeklyExpense(string userId)
        {
            Dictionary<string, decimal> dictWeeklySum = new Dictionary<string, decimal>();
            IList<CategoryModel> category = dbContext.Categories.ToList();

            foreach (var item in category)
            {
                decimal sum = dbContext.ExpenseReports.Where
                (exp => exp.CategoryId == item.CategoryId && (exp.ExpenseDate > DateTime.Now.AddDays(-28)) && exp.ExpenseBy == userId)
                .Select(cat => cat.Amount).Sum();
                dictWeeklySum.Add(item.CategoryName, sum);
            }
            return dictWeeklySum;
        }

        public Dictionary<string, decimal> CalculateYearlyMonthlyExpense(int month, int year, string userId)
        {
            Dictionary<string, decimal> dictWeeklySum = new Dictionary<string, decimal>();
            IList<CategoryModel> category = dbContext.Categories.ToList();

            foreach (var item in category)
            {
                decimal sum = dbContext.ExpenseReports.Where
                (exp => exp.CategoryId == item.CategoryId && (exp.ExpenseDate.Year == year) && (exp.ExpenseDate.Month == month) && exp.ExpenseBy == userId)
                .Select(cat => cat.Amount).Sum();
                dictWeeklySum.Add(item.CategoryName, sum);
            }
            return dictWeeklySum;
        }

        #endregion
    }
}
