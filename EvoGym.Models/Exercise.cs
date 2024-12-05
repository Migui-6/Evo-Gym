using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EvoGym.Models
{
    public class Exercise
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string TargetMuscle { get; set; }
        public int DifficultyLevel { get; set; }
        public string VideoUrl { get; set; }
        public string TechnicalGuide { get; set; }
        public List<string> RequiredEquipment { get; set; }
    }
}

