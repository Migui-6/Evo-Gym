namespace EvoGym.Client.Services
{
    public interface ISessionStorageService
    {
        string GetItem(string key);
        void SetItem(string key, string value);
        void RemoveItem(string key);
    }
}
