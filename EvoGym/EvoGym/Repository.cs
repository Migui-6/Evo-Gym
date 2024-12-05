using System.Text.Json;
using EvoGym.Models; 
using System.IO;

namespace EvoGym
{
    public class Repository<T> where T : class
    {
        private readonly DataContext _dataContext;

        public Repository(DataContext dataContext)
        {
            _dataContext = dataContext;
        }

        public List<T> GetAll(Func<T, bool> predicate = null)
        {
            var data = _dataContext.GetData();
            var collection = GetCollection(data);

            return predicate != null
                ? collection.Where(predicate).ToList()
                : collection;
        }

        public void Add(T entity)
        {
            var data = _dataContext.GetData();
            var collection = GetCollection(data);
            collection.Add(entity);
            _dataContext.SaveData(data);
        }

        private List<T> GetCollection(DatabaseData data)
        {
            return typeof(T) switch
            {
                var t when t == typeof(User) => data.Users as List<T>,
                var t when t == typeof(Exercise) => data.Exercises as List<T>,
                var t when t == typeof(Achievement) => data.Achievements as List<T>,
                _ => throw new NotSupportedException($"Tipo {typeof(T)} no soportado")
            };
        }
    }
}
