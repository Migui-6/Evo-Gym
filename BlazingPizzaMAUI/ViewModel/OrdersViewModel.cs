using BlazingPizzaMAUI.Data;
using BlazingPizzaMAUI.Domain.Models;
using System.Collections.ObjectModel;
using System.Threading.Tasks;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using MvvmHelpers;

namespace BlazingPizzaMAUI.ViewModel
{
    public class OrdersViewModel : BaseViewModel
    {
        private readonly PizzaStoreContext _db;

        public ObservableCollection<OrderWithStatus> Orders { get; set; } = new ObservableCollection<OrderWithStatus>();

        public OrdersViewModel(PizzaStoreContext db)
        {
            _db = db;
        }

        // Método para cargar todas las órdenes con su estado
        public async Task LoadOrdersAsync()
        {
            var orders = await _db.Orders
                .Include(o => o.Pizzas).ThenInclude(p => p.Special)
                .Include(o => o.Pizzas).ThenInclude(p => p.Toppings).ThenInclude(t => t.Topping)
                .OrderByDescending(o => o.CreatedTime)
                .ToListAsync();

            Orders.Clear();  // Limpia la colección para evitar duplicados
            foreach (var order in orders)
            {
                Orders.Add(OrderWithStatus.FromOrder(order));
            }
        }

        // Método para obtener una orden con estado por su ID
        public async Task<OrderWithStatus> GetOrderWithStatusAsync(int orderId)
        {
            var order = await _db.Orders
                .Where(o => o.OrderId == orderId)
                .Include(o => o.Pizzas).ThenInclude(p => p.Special)
                .Include(o => o.Pizzas).ThenInclude(p => p.Toppings).ThenInclude(t => t.Topping)
                .SingleOrDefaultAsync();

            if (order == null)
            {
                return null;  // Devuelve null si no se encuentra la orden
            }

            return OrderWithStatus.FromOrder(order);
        }
    }
}
