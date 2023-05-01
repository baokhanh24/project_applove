using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace applove
{
    public partial class Add_Note : System.Web.UI.Page
    {
        LopDungChung ldc = new LopDungChung();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Done_Click(object sender, EventArgs e)
        {
            SqlConnection conn = ldc.GetConnection();
            conn.Open();
            string title = Request["Input_title"];
            string content = Request["Input_content"];
            SqlCommand command = new SqlCommand("INSERT INTO BK2023_NOIDUNG (TieuDe, NoiDung) VALUES (@title, @content)", conn);
            command.Parameters.AddWithValue("@title", title);
            command.Parameters.AddWithValue("@content", content);
            command.ExecuteNonQuery(); // Thêm dữ liệu mới vào cơ sở dữ liệu
            Response.Redirect("Note.aspx"); // Chuyển đến trang Note.aspx
        }
    }

}