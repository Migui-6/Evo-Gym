using EvoGym.Models;
using System.Text.Json;
using System.IO;

namespace EvoGym
{
    public class DataContext
    {
        private const string DATA_FILE_PATH = "evogym_data.json";

        public DataContext()
        {
            if (!File.Exists(DATA_FILE_PATH))
            {
                InitializeDataFile();
            }
        }

        public DatabaseData GetData()
        {
            if (!File.Exists(DATA_FILE_PATH))
            {
                InitializeDataFile();
            }

            var jsonString = File.ReadAllText(DATA_FILE_PATH);
            return JsonSerializer.Deserialize<DatabaseData>(jsonString)
                ?? new DatabaseData(); // Proporcionar valor por defecto
        }

        public void SaveData(DatabaseData data)
        {
            var jsonString = JsonSerializer.Serialize(data, new JsonSerializerOptions { WriteIndented = true });
            File.WriteAllText(DATA_FILE_PATH, jsonString);

        }

        private void InitializeDataFile()
        {
            var initialData = new DatabaseData
            {
                Users = new List<User>(),
                Exercises = GenerateDefaultExercises(),
                Achievements = GenerateDefaultAchievements()
            };

            SaveData(initialData);
        }

        private List<Exercise> GenerateDefaultExercises()
        {
            return new List<Exercise>
        {
            new Exercise
            {
                Id = Guid.NewGuid().ToString(),
                Name = "Sentadilla",
                TargetMuscle = "Piernas",
                DifficultyLevel = 1,
                Description = "Ejercicio básico para fortalecer piernas"
            },
            // Añade más ejercicios por defecto
        };
        }

        private List<Achievement> GenerateDefaultAchievements()
        {
            return new List<Achievement>
        {
            new Achievement
            {
                Id = Guid.NewGuid().ToString(),
                Name = "Primer Entrenamiento",
                Description = "Completa tu primer entrenamiento",
                PointsValue = 50
            },
            // Añade más logros por defecto
        };
        }

        
    }
}
