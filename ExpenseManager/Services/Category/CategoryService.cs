using ExpenseManager.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ExpenseManager.Services.Category
{
    public class CategoryService : ICategoryService
    {
        #region Fields
        private readonly ExpenseDBContext dbContext;
        #endregion

        #region Ctor
        public CategoryService(ExpenseDBContext dbContext)
        {
            this.dbContext = dbContext;
        }
        #endregion

        #region Methods
        public IList<CategoryModel> GetAllCategories()
        {
            try
            {
                return dbContext.Categories.ToList();
            }
            catch (Exception)
            {
                throw;
            }            
        }

        public CategoryModel GetCategoryById(int categoryId)
        {
            try
            {
                return dbContext.Categories.Find(categoryId);
            }
            catch (Exception)
            {
                throw;
            }            
        }

        #endregion
    }
}
