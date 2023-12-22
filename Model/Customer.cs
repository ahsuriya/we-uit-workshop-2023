using System.Data;
using System.Data.SqlClient;

namespace we_uit_workshop_2023.Model
{
    public class Customer
    {
        public int CustomerId { get; set; }
        public string? CustomerName { get; set; }
        public string? PhoneNo { get; set; }
        public string? Email { get; set; }
        public string? Address { get; set; }
        public bool isActive { get; set; }

        public DataTable GetCustomers()
        {
            SqlCommand sc = new SqlCommand("SELECT * FROM tbl_Customer WHERE isActive = 1", ConnectionString.GetSqlConnection());
            SqlDataAdapter sda = new SqlDataAdapter(sc);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            return dt;
        }
    }
}
