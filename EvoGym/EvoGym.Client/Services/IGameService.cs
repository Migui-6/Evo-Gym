using EvoGym.Client.Pages;
using EvoGym.Models;

namespace EvoGym.Services
{
    public interface IGameService
    {
        Task<List<Achievement>> GetUserAchievements();
        Task<int> GetUserPoints();
        Task<bool> CompleteAchievement(string achievementId);
        Task<List<User>> GetLeaderboard();
    }
}
