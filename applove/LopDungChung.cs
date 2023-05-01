using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace applove
{
    public class LopDungChung
    {
       
        string path = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\APPLOVE.MDF;Integrated Security=True;";


        public SqlConnection GetConnection()
        {
            SqlConnection conn = new SqlConnection(path);
            return conn;
        }
    }
}