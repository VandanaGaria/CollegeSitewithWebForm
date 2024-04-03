

using System;
using System.Data.SqlClient;

namespace College
{
    public partial class EditPage : System.Web.UI.Page
    {
        // Connection string
        string cs = "Data Source=LAPTOP-NC93TFFK\\SQLEXPRESS; Initial Catalog=EmpDB;Integrated Security=True;Encrypt=False";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve college name from session
                string collegeName = Session["CollegeName"] as string;
                if (collegeName != null)
                {
                    // Populate college data for editing
                    PopulateCollegeData(collegeName);
                }
            }
        }

        // Method to populate college data for editing
        private void PopulateCollegeData(string collegeName)
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                string query = "SELECT * FROM CollegeDB WHERE CollegeName = @collegeName";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@collegeName", collegeName);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    // Populate textboxes with college data
                    txtCollegeName.Text = collegeName;
                    txtCollegeID.Text = reader["CollegeID"].ToString();
                    txtCollegeState.Text = reader["CollegeState"].ToString();
                }
            }
        }

        // Method to handle update button click
        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            string collegeName = txtCollegeName.Text;
            string collegeID = txtCollegeID.Text;
            string collegeState = txtCollegeState.Text;

            using (SqlConnection conn = new SqlConnection(cs))
            {
                string query = "UPDATE CollegeDB SET CollegeID = @CollegeID, CollegeState = @CollegeState WHERE CollegeName = @CollegeName";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.Parameters.AddWithValue("@CollegeID", collegeID);
                cmd.Parameters.AddWithValue("@CollegeState", collegeState);
                cmd.Parameters.AddWithValue("@CollegeName", collegeName);
                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    // Set success message
                    Response.Redirect("Show.aspx");
                }
            }
        }
    }
}
