using Microsoft.AspNetCore.Components.Authorization;
using System.Security.Claims;
using System.Threading.Tasks;

namespace EvoGym.Client.Services
{
    public class CustomAuthStateProvider : AuthenticationStateProvider
    {
        private readonly ISessionStorageService _sessionStorage;

        public CustomAuthStateProvider(ISessionStorageService sessionStorage)
        {
            _sessionStorage = sessionStorage;
        }

        public override async Task<AuthenticationState> GetAuthenticationStateAsync()
        {
            var authToken = _sessionStorage.GetItem("authToken");
            var identity = string.IsNullOrEmpty(authToken)
                ? new ClaimsIdentity()
                : new ClaimsIdentity(new[]
                {
                new Claim(ClaimTypes.Authentication, "true")
                }, "ServerAuth");
            return new AuthenticationState(new ClaimsPrincipal(identity));
        }

        public void NotifyAuthenticationStateChanged()
        {
            NotifyAuthenticationStateChanged(GetAuthenticationStateAsync());
        }
    }
}