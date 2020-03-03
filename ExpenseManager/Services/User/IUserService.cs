using ExpenseManager.Models;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ExpenseManager.Services.User
{
    public interface IUserService
    {
        IdentityUser ValidateUser(string email, string password);
    }
}
