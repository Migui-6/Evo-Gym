using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EvoGym.Models
{
    public class DatabaseData
    {
        public List<User> Users { get; set; } = new List<User>();
        public List<Exercise> Exercises { get; set; } = new List<Exercise>();
        public List<Achievement> Achievements { get; set; } = new List<Achievement>();
    }
}
