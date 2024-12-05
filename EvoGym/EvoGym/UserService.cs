using EvoGym.Models;

namespace EvoGym
{
    public class UserService
    {
        private readonly Repository<User> _userRepository;

        public UserService(DataContext dataContext)
        {
            _userRepository = new Repository<User>(dataContext);
        }

        public User GetUserByEmail(string email)
        {
            return _userRepository.GetAll(u => u.Email == email).FirstOrDefault();
        }

        public void RegisterUser(User user)
        {
            // Lógica de validación
            _userRepository.Add(user);
        }
    }
}
