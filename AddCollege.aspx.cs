using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace College
{
    public partial class AddCollege : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        SqlConnection conn = new SqlConnection("Data Source=LAPTOP-NC93TFFK\\SQLEXPRESS;Initial Catalog=EmpDB;Integrated Security=True;Encrypt=False");

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string CollegeName = txtCollegeName.Text;
                string CollegeID = txtCollegeID.Text;
                string CollegeState = txtCollegeState.Text;

                string query1 = "insert into CollegeDB (collegeid, collegename, collegestate) values(@collegeid,@collegename,@collegestate)";

                conn.Open();

                SqlCommand cmd = new SqlCommand(query1, conn);
                cmd.Parameters.AddWithValue("@collegeid", CollegeID);
                cmd.Parameters.AddWithValue("@collegename", CollegeName);
                cmd.Parameters.AddWithValue("@collegestate", CollegeState);

                cmd.ExecuteNonQuery();

                // Clear the form
                txtCollegeName.Text = "";
                txtCollegeID.Text = "";
                txtCollegeState.Text = "";

                // Display the added record in the drawer

            }
            catch (Exception ex)
            {
                // Handle the exception
            }
            finally
            {
                conn.Close();
            }
        }

        //protected void DisplayAddedRecordInDrawer(string collegeName, string collegeState , string collegeID)
        //{
        //    string recordItem = "<li class='list-group-item'><strong>College Name:</strong> " + collegeName + "<br/><strong>College ID:</strong> " + collegeID  + "<br /><strong>College State:</strong> " + collegeState + "</li>";
        //    addedRecordsList.InnerHtml += recordItem;

        //    // Show the modal drawer
        //    ScriptManager.RegisterStartupScript(this, GetType(), "showDrawerScript", "showDrawer();", true);
        //}
    }
}