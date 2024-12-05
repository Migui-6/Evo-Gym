using EvoGym.Models;
using EvoGym.Services;
using System.Net.Http.Json;

namespace EvoGym.Client.Services
{
    public class AuthService : IAuthService
    {
        private readonly HttpClient _http;
        private readonly CustomAuthStateProvider _authStateProvider;
        private readonly ISessionStorageService _sessionStorage;

        public AuthService(HttpClient http,
            CustomAuthStateProvider authStateProvider,
            ISessionStorageService sessionStorage)
        {
            _http = http;
            _authStateProvider = authStateProvider;
            _sessionStorage = sessionStorage;
        }

        // Modificar métodos para usar _sessionStorage en lugar de sessionStorage
        private void SaveAuthToken(string token)
        {
            _sessionStorage.SetItem("authToken", token);
            _authStateProvider.NotifyAuthenticationStateChanged();
        }

        private void RemoveAuthToken()
        {
            _sessionStorage.RemoveItem("authToken");
            _authStateProvider.NotifyAuthenticationStateChanged();
        }

        public async Task<bool> RegisterUser(RegisterModel model)
        {
            var result = await _http.PostAsJsonAsync("api/auth/register", model);
            if (result.IsSuccessStatusCode)
            {
                var token = await result.Content.ReadAsStringAsync();
                SaveAuthToken(token);
                return true;
            }
            return false;
        }

        public async Task<bool> Login(LoginModel model)
        {
            var result = await _http.PostAsJsonAsync("api/auth/login", model);
            if (result.IsSuccessStatusCode)
            {
                var token = await result.Content.ReadAsStringAsync();
                SaveAuthToken(token);
                return true;
            }
            return false;
        }

        public async Task Logout()
        {
            RemoveAuthToken();
        }

        public async Task<User> GetCurrentUser()
        {
            var result = await _http.GetFromJsonAsync<User>("api/auth/currentuser");
            return result;
        }

        
    }
}