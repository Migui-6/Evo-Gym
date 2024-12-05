using EvoGym.Models;

namespace EvoGym.Services
{
    public interface IExerciseService
    {
        Task<List<Exercise>> GetExercises(string targetMuscle = null, int? difficultyLevel = null);
        Task<Exercise> GetExerciseById(string id);
        Task<List<string>> GetTargetMuscles();
    }
}
