using System.Data.SqlClient;

namespace we_uit_workshop_2023
{
    public class ConnectionString
    {
        public static SqlConnection? mySqlConnection;
        
        public static SqlConnection GetSqlConnection()
        {
            if (mySqlConnection == null)
            {
                mySqlConnection = new SqlConnection();
                mySqlConnection.ConnectionString = "Server = DESKTOP-KPJ3CT0;Database = WE_UIT_WORKSHOP;Integrated Security=True";
                mySqlConnection.Open();
            }
            return mySqlConnection;
        }
    }
}
