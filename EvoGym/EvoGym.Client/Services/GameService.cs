using EvoGym.Client.Pages;
using EvoGym.Models;
using System.Net.Http.Json;

namespace EvoGym.Services
{
    public class GameService : IGameService
    {
        private readonly HttpClient _http;

        public GameService(HttpClient http)
        {
            _http = http;
        }

        public async Task<List<Achievement>> GetUserAchievements()
        {
            return await _http.GetFromJsonAsync<List<Achievement>>("api/game/achievements");
        }

        public async Task<int> GetUserPoints()
        {
            return await _http.GetFromJsonAsync<int>("api/game/points");
        }

        public async Task<bool> CompleteAchievement(string achievementId)
        {
            var response = await _http.PostAsync($"api/game/achievements/{achievementId}/complete", null);
            return response.IsSuccessStatusCode;
        }

        public async Task<List<User>> GetLeaderboard()
        {
            return await _http.GetFromJsonAsync<List<User>>("api/game/leaderboard");
        }

        Task<List<Achievement>> IGameService.GetUserAchievements()
        {
            throw new NotImplementedException();
        }

        Task<List<User>> IGameService.GetLeaderboard()
        {
            throw new NotImplementedException();
        }
    }
}
