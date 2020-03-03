using ExpenseManager.Models;
using ExpenseManager.Services.Category;
using ExpenseManager.Services.ExpenseReport;
using ExpenseManager.Services.PaymentType;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;

namespace ExpenseManager.Controllers
{
    [Authorize]
    public class ExpenseController : Controller
    {
        #region Fields
        private readonly UserManager<IdentityUser> userManager;
        private readonly IExpenseReportService _expenseReportService;
        private readonly ICategoryService _categoryService;
        private readonly IPaymentTypeService _paymentTypeService;
        #endregion

        #region Ctor
        public ExpenseController(UserManager<IdentityUser> userManager, IExpenseReportService expenseReportService,
                    ICategoryService categoryService, IPaymentTypeService paymentTypeService)
        {
            this.userManager = userManager;
            _expenseReportService = expenseReportService;
            _categoryService = categoryService;
            _paymentTypeService = paymentTypeService;
        }
        #endregion

        #region Methods
        [HttpGet]
        public ActionResult Index(int categoryId, string expenseName = "")
        {
            List<ExpenseReportModel> expenses = new List<ExpenseReportModel>();
            var userId = userManager.GetUserId(User);
            if (string.IsNullOrEmpty(expenseName))
            {
                expenseName = "";
            }
            expenses = _expenseReportService.GetSearchExpenseResult(categoryId, expenseName, userId).ToList();
            ViewBag.ListOfCategories = _categoryService.GetAllCategories();
            foreach (var item in expenses)
            {
                item.PaymentType = _paymentTypeService.GetPaymentTypeById(item.PaymentTypeId);
            }
            foreach (var item in expenses)
            {
                item.Category = _categoryService.GetCategoryById(item.CategoryId);
            }
            return View(expenses);
        }

        [HttpGet]
        public ActionResult ManageExpense(int expenseId = 0)
        {
            ExpenseReportModel expense = new ExpenseReportModel();
            if (expenseId > 0)
            {
                expense = _expenseReportService.GetExpenseById(expenseId);
                expense.Category = _categoryService.GetCategoryById(expense.CategoryId);
                expense.PaymentType = _paymentTypeService.GetPaymentTypeById(expense.PaymentTypeId);
            }
            expense.ListOfCategories = _categoryService.GetAllCategories();
            expense.ListOfPaymentTypes = _paymentTypeService.GetAllPaymentTypes();
            return PartialView("_ExpenseManageForm", expense);
        }

        [HttpPost]
        public ActionResult ManageExpense(ExpenseReportModel expense)
        {
            expense.ExpenseBy = userManager.GetUserId(User);
            if (expense != null)
            {
                if (expense.ExpenseId > 0)
                {
                    _expenseReportService.UpdateExpense(expense);
                }
                else
                {
                    _expenseReportService.AddExpense(expense);
                }
                return RedirectToAction("Index", "Expense");
            }
            return PartialView("_ExpenseManageForm", expense);
        }

        [HttpPost]
        public bool DeleteExpense(int ExpenseId)
        {
            if (ExpenseId > 0)
            {
                _expenseReportService.DeleteExpense(ExpenseId);
                return true;
            }
            else
            {
                return false;
            }
        }

        public ActionResult ExpenseSummary()
        {
            ViewBag.Years = _expenseReportService.GetYears();
            return PartialView("_ExpenseReport");
        }

        public JsonResult GetMonthlyExpense()
        {
            var userId = userManager.GetUserId(User);
            Dictionary<string, decimal> monthlyExpense = _expenseReportService.CalculateMonthlyExpense(userId);
            return new JsonResult(monthlyExpense);
        }

        public JsonResult GetWeeklyExpense()
        {
            var userId = userManager.GetUserId(User);
            Dictionary<string, decimal> weeklyExpense = _expenseReportService.CalculateWeeklyExpense(userId);
            return new JsonResult(weeklyExpense);
        }

        public JsonResult GetExpenseByMonthYear(int month = 0, int year = 0)
        {
            var userId = userManager.GetUserId(User);
            Dictionary<string, decimal> expenseYearlyMonthly = _expenseReportService.CalculateYearlyMonthlyExpense(month, year, userId);
            return new JsonResult(expenseYearlyMonthly);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
        #endregion
    }
}