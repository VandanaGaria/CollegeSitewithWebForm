//using iTextSharp.text.pdf;
//using iTextSharp.text;
//using System;
//using System.Collections.Generic;
//using System.Data.SqlClient;
//using System.IO;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;

//namespace College
//{
//    public partial class WebForm2 : System.Web.UI.Page
//    {
 

//        {
//            protected void Page_Load(object sender, EventArgs e)
//            {

//                LoadData();

//            }

//            string cs = "Data Source=LAPTOP-NC93TFFK\\SQLEXPRESS; Initial Catalog=EmpDB;Integrated Security=True;Encrypt=False";

//            private void LoadData()
//            {

//                using (SqlConnection conn = new SqlConnection(cs))
//                {
//                    conn.Open();
//                    string query = "SELECT CollegeName, CollegeID, CollegeState FROM CollegeDB";

//                    SqlCommand cmd = new SqlCommand(query, conn);
//                    SqlDataReader sqlDataReader = cmd.ExecuteReader();


//                    while (sqlDataReader.Read())
//                    {
//                        TableRow row = new TableRow();

//                        TableCell cell1 = new TableCell();
//                        cell1.Text = sqlDataReader["CollegeName"].ToString();
//                        row.Cells.Add(cell1);

//                        TableCell cell2 = new TableCell();
//                        cell2.Text = sqlDataReader["CollegeID"].ToString();
//                        row.Cells.Add(cell2);

//                        TableCell cell3 = new TableCell();
//                        cell3.Text = sqlDataReader["CollegeState"].ToString();
//                        row.Cells.Add(cell3);

//                        TableCell cell4 = new TableCell();

//                        Button btnEdit = new Button();
//                        btnEdit.Text = "EDIT";
//                        btnEdit.CssClass = "btn btn-beige-brown";
//                        btnEdit.CommandArgument = sqlDataReader["CollegeName"].ToString();

//                        btnEdit.Attributes["onmouseover"] = "this.style.backgroundColor='burlywood';this.style.borderColor='burlywood';";
//                        btnEdit.Attributes["onmouseout"] = "this.style.backgroundColor='';this.style.borderColor='';";

//                        btnEdit.Click += Edit_Click;
//                        cell4.Controls.Add(btnEdit);

//                        Button btnDelete = new Button();
//                        btnDelete.Text = "DELETE";
//                        btnDelete.CssClass = "btn btn-beige-brown";
//                        btnDelete.CommandArgument = sqlDataReader["CollegeName"].ToString();
//                        btnDelete.Attributes["onclick"] = "return confirmDelete('" + sqlDataReader["CollegeName"].ToString() + "');";

//                        btnDelete.Attributes["onmouseover"] = "this.style.backgroundColor='burlywood';this.style.borderColor='burlywood';";
//                        btnDelete.Attributes["onmouseout"] = "this.style.backgroundColor='';this.style.borderColor='';";
//                        btnDelete.Click += Delete_Click;
//                        cell4.Controls.Add(btnDelete);

//                        row.Cells.Add(cell4);
//                        tblData.Rows.Add(row);
//                    }
//                }
//            }

//            private void BtnDelete_Click(object sender, EventArgs e)
//            {
//                //label_check.Text = "delete checK";
//            }

//            protected void Edit_Click(object sender, EventArgs e)
//            {
//                //label_check.Text = "wertyuicjdsncjdsv";
//                Button btnEdit = (Button)sender;
//                string collegeName = btnEdit.CommandArgument;
//                Session["CollegeName"] = collegeName;
//                Session["cs"] = cs;
//                Response.Redirect("EditPage.aspx");
//            }

//            protected void Delete_Click(object sender, EventArgs e)
//            {

//                /*label_check.Text = "delete checl"*/
//                ;

//                Button btnDelete = (Button)sender;
//                string item = btnDelete.CommandArgument;

//                string dltQuery = "DELETE FROM CollegeDB WHERE CollegeName = @item";
//                using (SqlConnection con = new SqlConnection(cs))
//                {
//                    using (SqlCommand cmd = new SqlCommand(dltQuery, con))
//                    {
//                        cmd.Parameters.AddWithValue("@item", item);
//                        con.Open();
//                        cmd.ExecuteNonQuery();
//                    }
//                }
//                Response.Redirect(Request.RawUrl);
//            }

//            //protected void btnGlobalSearch_Click(object sender, EventArgs e)
//            //{
//            //    LoadData(txtGlobalSearch.Text.Trim());
//            //}
//            protected void btnExportPDF_Click(object sender, EventArgs e)
//            {
//                ExportToPDF();
//            }

//            private void ExportToPDF()
//            {
//                Response.ContentType = "application/pdf";
//                Response.AddHeader("content-disposition", "attachment;filename=CollegeData.pdf");
//                Response.Cache.SetCacheability(HttpCacheability.NoCache);

//                using (StringWriter sw = new StringWriter())
//                {
//                    using (HtmlTextWriter hw = new HtmlTextWriter(sw))
//                    {
//                        // Create a new PDF document
//                        Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
//                        PdfWriter.GetInstance(pdfDoc, Response.OutputStream);

//                        pdfDoc.Open();
//                        // Create a paragraph with centered and bold text for "College Data"
//                        Paragraph paragraph = new Paragraph("\n College Data", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 16f, Font.BOLD));
//                        paragraph.Alignment = Element.ALIGN_CENTER;
//                        pdfDoc.Add(paragraph);

//                        pdfDoc.Add(new Paragraph("\n"));

//                        //html table
//                        PdfPTable table = new PdfPTable(tblData.Rows[0].Cells.Count - 1);
//                        // Add header row
//                        for (int i = 0; i < tblData.Rows[0].Cells.Count - 1; i++)
//                        {
//                            // Create a cell with centered and bold text for header
//                            PdfPCell headerCell = new PdfPCell(new Phrase(tblData.Rows[0].Cells[i].Text, FontFactory.GetFont(FontFactory.HELVETICA_BOLD)));
//                            headerCell.HorizontalAlignment = Element.ALIGN_CENTER;
//                            table.AddCell(headerCell);
//                        }

//                        // Add data rows
//                        for (int i = 1; i < tblData.Rows.Count; i++)
//                        {
//                            for (int j = 0; j < tblData.Rows[i].Cells.Count - 1; j++)
//                            {
//                                // Create a cell with centered text for data
//                                PdfPCell dataCell = new PdfPCell(new Phrase(tblData.Rows[i].Cells[j].Text));
//                                dataCell.HorizontalAlignment = Element.ALIGN_CENTER;
//                                table.AddCell(dataCell);
//                            }
//                        }

//                        // Add table to PDF document
//                        pdfDoc.Add(table);

//                        pdfDoc.Close();
//                    }
//                }

//                Response.Write(Response.Output);
//                Response.Flush();
//                Response.End();
//            }



//        }
//    }
//}
//}