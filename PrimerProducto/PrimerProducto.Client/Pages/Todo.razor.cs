namespace PrimerProducto.Client.Pages
{
    public partial class Todo
    {
        private List<TodoItem> todos = new();
        string newTodo = "";

        void AddTodo()
        {
            if (!string.IsNullOrWhiteSpace(newTodo))
            {
                todos.Add(new TodoItem { Title = newTodo });
                newTodo = string.Empty;
            }
        }
    }
}
