using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace applove
{
    public partial class Note : System.Web.UI.Page
    {
        LopDungChung ldc = new LopDungChung();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                loadTable();
            }

        

            if (!IsPostBack)
            {
               
                lblNote.Text = GetTotalNote().ToString();
            }

        }
            
        void loadTable()
        {
            SqlConnection conn = ldc.GetConnection();
            string sqlQuery = "SELECT * FROM BK2023_NOIDUNG";
            SqlDataAdapter da = new SqlDataAdapter(sqlQuery, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dlData.DataSource = dt;
            dlData.DataBind();
        }
        protected int GetTotalNote()
        {
            int totalQuestions = 0;

            using (SqlConnection conn = ldc.GetConnection())
            {
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM BK2023_NOIDUNG", conn);
                conn.Open();
                totalQuestions = (int)cmd.ExecuteScalar();
            }
            return totalQuestions;
            
        }

        protected void btnseach_Click(object sender, EventArgs e)
        {
            string keyword = search.Text.ToLower(); // Chuyển keyword thành chữ thường để tìm kiếm không phân biệt chữ hoa/thường

            SqlConnection conn = ldc.GetConnection();

                conn.Open();
                SqlCommand command = new SqlCommand("SELECT * FROM BK2023_NOIDUNG WHERE TieuDe LIKE '%' + @keyword + '%' OR NoiDung LIKE '%' + @keyword + '%'", conn);
                command.Parameters.AddWithValue("@keyword", keyword);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable searchResult = new DataTable();
                adapter.Fill(searchResult); 
                dlData.DataSource = searchResult;
                dlData.DataBind(); 
            
        }
        protected void dlData_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                // Get the ID of the data item that was clicked
                int id = Convert.ToInt32(e.CommandArgument);

                // Perform the delete operation using the ID
                SqlConnection conn = ldc.GetConnection();
                SqlCommand cmd = new SqlCommand("DELETE FROM BK2023_NOIDUNG WHERE Idnd = @ID", conn);
                cmd.Parameters.AddWithValue("@ID", id);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                lblNote.Text = GetTotalNote().ToString();
                loadTable();
               
                dlData.DataBind();
                
            }
        }
    }
}