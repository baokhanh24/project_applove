using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace applove
{
    public partial class Edit_note : System.Web.UI.Page
    {
        LopDungChung ldc = new LopDungChung();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string title = Request.Form["Input_title"];
                string content = Request.Form["Input_content"];
                if (Request.Params["id"] != null)
                {
                    int id = Convert.ToInt32(Request.Params["id"]);
                    SqlConnection conn = ldc.GetConnection();
                    SqlCommand cmd = new SqlCommand("SELECT TieuDe, NoiDung FROM BK2023_NOIDUNG WHERE Idnd = @ID", conn);
                    cmd.Parameters.AddWithValue("@ID", id);
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        Input_title.Text = reader["TieuDe"].ToString();
                        Input_content.Text = reader["NoiDung"].ToString();
                    }
                    reader.Close();
                    conn.Close();
                }
            }
        }
        protected void Done_Click(object sender, EventArgs e)
        {
            string title = Request.Form["Input_title"];

            string content = Request.Form["Input_content"];
            int id = Convert.ToInt32(Request.QueryString["id"]);

            // Update the note data in the database using the ID
            SqlConnection conn = ldc.GetConnection();
            SqlCommand cmd = new SqlCommand("UPDATE BK2023_NOIDUNG SET TieuDe = @Title, NoiDung = @Content WHERE Idnd = @ID", conn);
            cmd.Parameters.AddWithValue("@Title", title);
            cmd.Parameters.AddWithValue("@Content", content);
            cmd.Parameters.AddWithValue("@ID", id);
            conn.Open();
            cmd.ExecuteNonQuery();
            

            // Redirect back to the list of notes
            Response.Redirect("Note.aspx");
        }
    }
}