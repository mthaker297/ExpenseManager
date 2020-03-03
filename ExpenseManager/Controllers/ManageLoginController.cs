using ExpenseManager.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace ExpenseManager.Controllers
{
    public class ManageLoginController : Controller
    {        
        private readonly UserManager<IdentityUser> userManager;
        private readonly SignInManager<IdentityUser> signInManager;

        public ManageLoginController(UserManager<IdentityUser> userManager, SignInManager<IdentityUser> signInManager)
        {
            this.userManager = userManager;
            this.signInManager = signInManager;
        }

        [HttpGet]
        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public async Task<ActionResult> Login(UserModel user)
        {
            if (user.Email != null && user.Password != null)
            {
                var result = await signInManager.PasswordSignInAsync(user.Email, user.Password, true, false);                
                
                if (result.Succeeded)
                {
                    return RedirectToAction("Index", "Expense");                    
                }
                TempData["Invalid"] = "Invalid Login Attempt!!!";
            }       
            return View(user);
        }

        [HttpPost]
        public async Task<IActionResult> Logout()
        {
            await signInManager.SignOutAsync();
            HttpContext.Session.Clear();
            HttpContext.Session.Remove("UserLogin");
            return RedirectToAction("Login", "ManageLogin");
        }

        [HttpGet]
        public ActionResult SignUp()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> SignUp(UserModel user)
        {
            if (ModelState.IsValid)
            {
                // Copy data from RegisterViewModel to IdentityUser
                var userData = new IdentityUser
                {
                    UserName = user.Email,
                    Email = user.Email,
                    PasswordHash = user.Password,
                    SecurityStamp = user.ConfirmPassword
                };

                // Store user data in AspNetUsers database table
                var result = await userManager.CreateAsync(userData, user.Password);

                // If user is successfully created, sign-in the user using
                // SignInManager and redirect to index action of HomeController
                if (result.Succeeded)
                {
                    //await signInManager.SignInAsync(userData, isPersistent: false);
                    return RedirectToAction("Login", "ManageLogin");
                }
            }
            return View(user);
        }
    }
}