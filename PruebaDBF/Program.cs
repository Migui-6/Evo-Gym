using System.Data.OleDb;

class Program
{
    static void Main()
    {
        string connectionString = @"Provider=VFPOLEDB.1;Data Source=C:\Users\Miguel\Downloads\pedido.dbf";

        string query = "SELECT * FROM pedido";

        using (OleDbConnection connection = new OleDbConnection(connectionString))
        {
            connection.Open();
            using (OleDbCommand command = new OleDbCommand(query, connection))
            using (OleDbDataReader reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    for (int i = 0; i < reader.FieldCount; i++)
                    {
                        Console.Write($"{reader[i]} ");
                    }
                    Console.WriteLine();
                }
            }
        }
    }
}
