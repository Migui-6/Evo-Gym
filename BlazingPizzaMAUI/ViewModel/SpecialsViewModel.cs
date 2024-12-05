using BlazingPizzaMAUI.Data;
using BlazingPizzaMAUI.Domain.Models;
using System.Collections.ObjectModel;
using System.Threading.Tasks;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using MvvmHelpers;

namespace BlazingPizzaMAUI.ViewModel
{
    public class SpecialsViewModel : BaseViewModel
    {
        private readonly PizzaStoreContext _db;

        // Colección observable para las especialidades de pizza
        public ObservableCollection<PizzaSpecial> Specials { get; set; } = new ObservableCollection<PizzaSpecial>();

        // Constructor que recibe el contexto de la base de datos
        public SpecialsViewModel(PizzaStoreContext db)
        {
            _db = db;
        }

        // Método para cargar las especialidades desde la base de datos
        public async Task LoadSpecialsAsync()
        {
            var specials = await _db.Specials
                .OrderByDescending(s => s.BasePrice)
                .ToListAsync();

            Specials.Clear();  // Limpiar la colección actual antes de agregar nuevos datos
            foreach (var special in specials)
            {
                Specials.Add(special);  // Agregar cada especialidad a la colección observable
            }
        }
    }
}
