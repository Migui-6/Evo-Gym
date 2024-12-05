using EvoGym.Models;
using System.Net.Http.Json;

namespace EvoGym.Services
{
    public class ExerciseService : IExerciseService
    {
        private readonly HttpClient _http;

        public ExerciseService(HttpClient http)
        {
            _http = http;
        }

        public async Task<List<Exercise>> GetExercises(string targetMuscle = null, int? difficultyLevel = null)
        {
            var url = "api/exercises";
            if (!string.IsNullOrEmpty(targetMuscle))
            {
                url += $"?muscle={targetMuscle}";
                if (difficultyLevel.HasValue)
                    url += $"&level={difficultyLevel.Value}";
            }
            else if (difficultyLevel.HasValue)
            {
                url += $"?level={difficultyLevel.Value}";
            }

            return await _http.GetFromJsonAsync<List<Exercise>>(url);
        }

        public async Task<Exercise> GetExerciseById(string id)
        {
            return await _http.GetFromJsonAsync<Exercise>($"api/exercises/{id}");
        }

        public async Task<List<string>> GetTargetMuscles()
        {
            return await _http.GetFromJsonAsync<List<string>>("api/exercises/muscles");
        }

        Task<List<Exercise>> IExerciseService.GetExercises(string targetMuscle, int? difficultyLevel)
        {
            throw new NotImplementedException();
        }

        Task<Exercise> IExerciseService.GetExerciseById(string id)
        {
            throw new NotImplementedException();
        }
    }
}
