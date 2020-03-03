using ExpenseManager.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ExpenseManager.Services.Category
{
    public interface ICategoryService
    {
        IList<CategoryModel> GetAllCategories();
        CategoryModel GetCategoryById(int categoryId);
    }
}
