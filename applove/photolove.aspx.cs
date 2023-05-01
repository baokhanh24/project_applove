using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace applove
{
    public partial class photolove : System.Web.UI.Page
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
                
                lblNote.Text = GetTotalphoto().ToString();
                
            }
        }
        void loadTable()
        {
            SqlConnection conn = ldc.GetConnection();
            string sqlQuery = "SELECT * FROM BK2023_PHOTO";
            SqlDataAdapter da = new SqlDataAdapter(sqlQuery, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            PhotoList.DataSource = dt;
            PhotoList.DataBind();
        }
      
        
        protected int GetTotalphoto()
        {
            int totalQuestions = 0;

            using (SqlConnection conn = ldc.GetConnection())
            {
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM BK2023_PHOTO", conn);
                conn.Open();
                totalQuestions = (int)cmd.ExecuteScalar();
                
            }
            
            return totalQuestions;
            
        }
        protected void delete_Click(object sender, EventArgs e)
        {
            // Lấy giá trị của các ô đánh dấu được chọn
            string[] selectedItems = Request.Form.GetValues("selectedItems");
            if (selectedItems != null)
            {
                foreach (string itemID in selectedItems)
                {
                    // Xóa mục có ID là itemID từ cơ sở dữ liệu
                    SqlConnection conn = ldc.GetConnection();
                    string query = "DELETE FROM BK2023_PHOTO WHERE ID = @ID;";
               
                    using (SqlCommand command = new SqlCommand(query, conn))
                    {
                        command.Parameters.AddWithValue("@ID", itemID);
                        conn.Open();
                        int rowsAffected = command.ExecuteNonQuery();
                    }
                    lblNote.Text = GetTotalphoto().ToString();
                    loadTable();
                }
            }
            
        }
        protected void addPhoto(object sender, EventArgs e)
        {

            if (fileUpload.PostedFile != null && fileUpload.PostedFile.ContentLength > 0)
            {
                string fileName = Path.GetFileName(fileUpload.PostedFile.FileName);
                string fileExtension = Path.GetExtension(fileUpload.PostedFile.FileName).ToLower();

                if (fileExtension == ".jpg" || fileExtension == ".jpeg" || fileExtension == ".png")
                {
                    string uploadFolder = Server.MapPath("~/Upload/");
                    string filePath = Path.Combine(uploadFolder, fileName);

                    int maxSize = 1048576; // 1 MB

                    if (fileUpload.PostedFile.ContentLength > maxSize)
                    {
                        string message = "Kích thước tệp tin vượt quá giới hạn tối đa cho phép (1 MB). Vui lòng chọn một tệp tin nhỏ hơn.";
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "showErrorMessage('" + message + "');", true);
                    }

                    fileUpload.PostedFile.SaveAs(filePath);

                    SqlConnection conn = ldc.GetConnection();
                    conn.Open();
                    string query = "INSERT INTO BK2023_PHOTO (name, DuongDan, NgayTao) VALUES (@name, @DuongDan, @NgayTao)";
                    using (SqlCommand command = new SqlCommand(query, conn))
                    {
                        command.Parameters.AddWithValue("@name", fileName);
                        command.Parameters.AddWithValue("@DuongDan", "/Upload/" + fileName);
                        command.Parameters.AddWithValue("@NgayTao", DateTime.Now);
                        command.ExecuteNonQuery();
                    }
                    lblNote.Text = GetTotalphoto().ToString();
                    loadTable();
                }

               

                if (fileExtension == ".mp4" || fileExtension == ".avi")
                {
                    string uploadFolder = Server.MapPath("~/Upload/");
                    string filePath = Path.Combine(uploadFolder, fileName);

                    int maxSize = 10485760; // 10 MB

                    if (fileUpload.PostedFile.ContentLength > maxSize)
                    {
                        string message = "Kích thước tệp tin vượt quá giới hạn tối đa cho phép (10 MB). Vui lòng chọn một tệp tin nhỏ hơn.";
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "showErrorMessage('" + message + "');", true);
                    }

                    fileUpload.PostedFile.SaveAs(filePath);

                    SqlConnection conn = ldc.GetConnection();
                    conn.Open();
                    string query = "INSERT INTO BK2023_PHOTO (name, DuongDan, NgayTao) VALUES (@name, @DuongDan, @NgayTao)";
                    using (SqlCommand command = new SqlCommand(query, conn))
                    {
                        command.Parameters.AddWithValue("@name", fileName);
                        command.Parameters.AddWithValue("@DuongDan", "/Upload/" + fileName);
                        command.Parameters.AddWithValue("@NgayTao", DateTime.Now);
                       
                        command.ExecuteNonQuery();
                    }
                    lblNote.Text = GetTotalphoto().ToString();
                    loadTable();
                }
            }

        }
    }
}