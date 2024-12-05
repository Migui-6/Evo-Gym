using EvoGym.Models;

namespace EvoGym.Services
{
    public interface IAuthService
    {
        Task<bool> RegisterUser(RegisterModel model);
        Task<bool> Login(LoginModel model);
        Task Logout();
        Task<User> GetCurrentUser();
    }
}
