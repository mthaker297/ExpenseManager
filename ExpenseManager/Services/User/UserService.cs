using ExpenseManager.Models;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ExpenseManager.Services.User
{
    public class UserService : IUserService
    {
        #region Fields
        private readonly ExpenseDBContext dbContext;
        #endregion

        #region Ctor
        public UserService(ExpenseDBContext dbContext)
        {
            this.dbContext = dbContext;
        }
        #endregion

        #region Methods

        //public void AddUser(UserModel user)
        //{
        //    user.CreatedDate = DateTime.UtcNow;
        //    dbContext.Users.Add(user);
        //    dbContext.SaveChanges();
        //}

        //public void UpdateUser(UserModel user)
        //{
        //    user.UpdatedDate = DateTime.UtcNow;
        //    dbContext.Users.Update(user);
        //    dbContext.SaveChanges();
        //}

        //public void DeleteUser(int userId)
        //{
        //    dbContext.Users.Remove(dbContext.Users.Find(userId));
        //    dbContext.SaveChanges();
        //}

        //public UserModel GetUserById(int userId)
        //{
        //    return dbContext.Users.Find(userId);
        //}

        public IdentityUser ValidateUser(string email, string password)
        {
            return dbContext.Users.Find(email, password);
        }
        #endregion
    }
}
