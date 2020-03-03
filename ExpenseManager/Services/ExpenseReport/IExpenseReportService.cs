using ExpenseManager.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ExpenseManager.Services.ExpenseReport
{
    public interface IExpenseReportService
    {
        //IList<ExpenseReportModel> GetAllExpenses(string userId);
        IList<ExpenseReportModel> GetSearchExpenseResult(int categoryId, string expenseName, string userId);
        ExpenseReportModel GetExpenseById(int expenseId);
        void AddExpense(ExpenseReportModel expense);
        void UpdateExpense(ExpenseReportModel expense);
        void DeleteExpense(int id);
        int[] GetYears();
        Dictionary<string, decimal> CalculateMonthlyExpense(string userId);
        Dictionary<string, decimal> CalculateWeeklyExpense(string userId);
        Dictionary<string, decimal> CalculateYearlyMonthlyExpense(int month, int year, string userId);
    }
}
