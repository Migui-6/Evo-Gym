using BlazingPizzaMAUI.Data;
using BlazingPizzaMAUI.Domain.Models;
using System.Collections.ObjectModel;
using System.Threading.Tasks;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
using MvvmHelpers;
using Abp.Notifications;

namespace BlazingPizzaMAUI.ViewModel
{
    public class PizzaApiViewModel : BaseViewModel
    {
        private readonly PizzaStoreContext _db;

        // Colecciones observables para Specials y Toppings
        public ObservableCollection<PizzaSpecial> Specials { get; set; } = new ObservableCollection<PizzaSpecial>();
        public ObservableCollection<Topping> Toppings { get; set; } = new ObservableCollection<Topping>();

        // Constructor que recibe el contexto de la base de datos
        public PizzaApiViewModel(PizzaStoreContext db)
        {
            _db = db;
        }

        // Cargar las especialidades (Specials)
        public async Task LoadSpecialsAsync()
        {
            var specials = await _db.Specials.ToListAsync();
            Specials.Clear();
            foreach (var special in specials)
            {
                Specials.Add(special);
            }
        }

        // Cargar los ingredientes (Toppings)
        public async Task LoadToppingsAsync()
        {
            var toppings = await _db.Toppings.OrderBy(t => t.Name).ToListAsync();
            Toppings.Clear();
            foreach (var topping in toppings)
            {
                Toppings.Add(topping);
            }
        }

        // Método para suscribirse a notificaciones
        public async Task<bool> SubscribeToNotificationsAsync(NotificationSubscription subscription, ClaimsPrincipal user)
        {
            // Obtener el userId del ClaimsPrincipal
            var userIdString = GetUserId(user);

            if (string.IsNullOrEmpty(userIdString))
            {
                return false;  // No autorizado, no se encontró el ID de usuario
            }

            // Convertir userId a long si es necesario
            if (!long.TryParse(userIdString, out long userId))
            {
                return false;  // Error al convertir el userId a long
            }

            // Eliminar suscripciones antiguas del usuario
            var oldSubscriptions = _db.NotificationSubscriptions.Where(e => e.UserId == userId);
            _db.NotificationSubscriptions.RemoveRange(oldSubscriptions);

            // Añadir la nueva suscripción
            subscription.UserId = userId;  // Se asume que subscription.UserId es de tipo long
            _db.NotificationSubscriptions.Attach(subscription);

            // Guardar los cambios en la base de datos
            await _db.SaveChangesAsync();
            return true;
        }

        // Método auxiliar para obtener el ID del usuario desde ClaimsPrincipal (sin FindFirstValue)
        private string? GetUserId(ClaimsPrincipal user)
        {
            return user?.Claims.FirstOrDefault(c => c.Type == ClaimTypes.NameIdentifier)?.Value;
        }
    }
}
