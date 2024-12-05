using Microsoft.Extensions.Hosting;
using Microsoft.JSInterop;


namespace EvoGym.Client.Services
{

    public class SessionStorageService : ISessionStorageService
    {
        private readonly IJSRuntime _jsRuntime;

        public SessionStorageService(IJSRuntime jsRuntime)
        {
            _jsRuntime = jsRuntime;
        }

        public string GetItem(string key) =>
            _jsRuntime.InvokeAsync<string>("sessionStorage.getItem", key).Result;

        public void SetItem(string key, string value) =>
            _jsRuntime.InvokeVoidAsync("sessionStorage.setItem", key, value);

        public void RemoveItem(string key) =>
            _jsRuntime.InvokeVoidAsync("sessionStorage.removeItem", key);
    }
}
