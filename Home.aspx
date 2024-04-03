using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Collections.Generic;

namespace College
{
    public partial class Show : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadData();
            LoadNames();
            //AddSearchControls();
        }

        string cs = "Data Source=LAPTOP-NC93TFFK\\SQLEXPRESS; Initial Catalog=EmpDB;Integrated Security=True;Encrypt=False";

        private void LoadData()
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                conn.Open();
                string query = "SELECT CollegeName, CollegeID, CollegeState FROM CollegeDB";

                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader sqlDataReader = cmd.ExecuteReader();

                TableHeaderRow headerRow = new TableHeaderRow();
                headerRow.CssClass = "thead-dark table-dark";
                headerRow.TableSection = TableRowSection.TableHeader;

                TableHeaderCell itemHeader = new TableHeaderCell();
                itemHeader.Text = "College Name";
                itemHeader.HorizontalAlign = HorizontalAlign.Center; // Align text to the center
                itemHeader.CssClass = "theading";
                headerRow.Cells.Add(itemHeader);
                itemHeader.Style["text-align"] = "center";

                TableHeaderCell categoryHeader = new TableHeaderCell();
                categoryHeader.Text = "College ID";
                //itemHeader.HorizontalAlign = HorizontalAlign.Center;
                categoryHeader.CssClass = "theading";
                headerRow.Cells.Add(categoryHeader);
                categoryHeader.CssClass = "theading";
                //to adjust tyhe styling of header
                categoryHeader.Style["text-align"] = "center";

                TableHeaderCell priceHeader = new TableHeaderCell();
                priceHeader.Text = "College State";
                headerRow.Cells.Add(priceHeader);
                priceHeader.CssClass = "theading";
                priceHeader.Style["text-align"] = "center";

                TableHeaderCell actionHeader = new TableHeaderCell();
                actionHeader.Text = "Action";
                headerRow.Cells.Add(actionHeader);
                actionHeader.CssClass = "theading";
                actionHeader.Style["text-align"] = "center";

                //TableHeaderCell actionHeader = new TableHeaderCell();
                //actionHeader.Text = "Action";
                //headerRow.Cells.Add(actionHeader);
                //actionHeader.CssClass = "theading";
                //actionHeader.Style["text-align"] = "center";

                List<string> columnsToDisplay = new List<string>() {"College Name","College Id","College State"};
                // Add the <thead> to the table
                tblData.Rows.Add(headerRow);
                

                while (sqlDataReader.Read())
                {
                    TableRow row = new TableRow();

                    TableCell cell1 = new TableCell();
                    cell1.Text = sqlDataReader["CollegeName"].ToString();
                    row.Cells.Add(cell1);
                    //to style the cell in center
                    cell1.Style["text-align"] = "center";

                    TableCell cell2 = new TableCell();
                    cell2.Text = sqlDataReader["CollegeID"].ToString();
                    cell2.Style["text-align"] = "center";
                    row.Cells.Add(cell2);

                    TableCell cell3 = new TableCell();
                    cell3.Text = sqlDataReader["CollegeState"].ToString();
                    row.Cells.Add(cell3);
                    cell3.Style["text-align"] = "center";

                    TableCell cell4 = new TableCell();
                    //TableCell cell5 = new TableCell();

                    Button btnEdit = new Button();
                    btnEdit.Text = "EDIT";
                    btnEdit.CssClass = "btn btn-beige-brown";
                    btnEdit.CommandArgument = sqlDataReader["CollegeName"].ToString();
                    btnEdit.Attributes["onmouseover"] = "this.style.backgroundColor='burlywood';this.style.borderColor='burlywood';";
                    btnEdit.Attributes["onmouseout"] = "this.style.backgroundColor='';this.style.borderColor='';";
                    btnEdit.Click += Edit_Click;
                    cell4.Controls.Add(btnEdit);

                    Button btnDelete = new Button();
                    btnDelete.Text = "DELETE";
                    btnDelete.CssClass = "btn btn-beige-brown";
                    btnDelete.CommandArgument = sqlDataReader["CollegeName"].ToString();
                    btnDelete.Attributes["onclick"] = "return confirmDelete('" + sqlDataReader["CollegeName"].ToString() + "');";
                    btnDelete.Attributes["onmouseover"] = "this.style.backgroundColor='burlywood';this.style.borderColor='burlywood';";
                    btnDelete.Attributes["onmouseout"] = "this.style.backgroundColor='';this.style.borderColor='';";
                    btnDelete.Click += Delete_Click;
                    cell4.Controls.Add(btnDelete);

                    row.Cells.Add(cell4);
                    //row.Cells.Add(cell5);
                    tblData.Rows.Add(row);
                }

                TableFooterRow footerRow = new TableFooterRow();
                for (int i = 0; i < 3; i++)
                {
                    TableCell footerCell = new TableCell();
                    TextBox textBox = new TextBox();
                    textBox.ID = "searchBox" + i;
                    textBox.CssClass = "searchTextBox";
                    textBox.Attributes["placeholder"] = "Search " + columnsToDisplay[i];
                    textBox.Attributes["onkeyup"] = "searchTable(" + i + ")";
                    footerCell.Controls.Add(textBox);
                    footerRow.Cells.Add(footerCell);
                }
                footerRow.TableSection = TableRowSection.TableFooter;
                tblData.Rows.Add(footerRow);

            }
        }

        //private void AddSearchControls()
        //{
        //    // Add search buttons at the bottom of each column
        //    TableRow searchRow = new TableRow();
        //    for (int i = 0; i < tblData.Rows[0].Cells.Count - 1; i++)
        //    {
        //        TableCell searchCell = new TableCell();
        //        TextBox searchTextBox = new TextBox();
        //        Button searchButton = new Button();
        //        searchTextBox.CssClass = "form-control search-textbox";
        //        searchButton.CssClass = "btn btn-beige-brown search-button";
        //        searchButton.Text = "Search";
        //        searchButton.Click += SearchButton_Click;
        //        searchButton.CommandArgument = i.ToString(); // CommandArgument to identify the column
        //        searchCell.Controls.Add(searchTextBox);
        //        searchCell.Controls.Add(searchButton);
        //        searchRow.Cells.Add(searchCell);
        //    }
        //    tblData.Rows.Add(searchRow);
        //}

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            Button searchButton = (Button)sender;
            int columnIndex = int.Parse(searchButton.CommandArgument);
            string searchText = ((TextBox)tblData.Rows[tblData.Rows.Count - 1].Cells[columnIndex].Controls[0]).Text;

            // Loop through the rows starting from the second row (data rows)
            for (int i = 0; i < tblData.Rows.Count; i++)
            {
                TableCell cell = tblData.Rows[i].Cells[columnIndex];
                if (cell.Text.ToLower().Contains(searchText.ToLower()))
                {
                    tblData.Rows[i].Visible = true;
                }
                else
                {
                    tblData.Rows[i].Visible = false;
                }
            }

        }

        protected void Edit_Click(object sender, EventArgs e)
        {
            Button btnEdit = (Button)sender;
            string collegeName = btnEdit.CommandArgument;
            Session["CollegeName"] = collegeName;
            Session["cs"] = cs;
            Response.Redirect("EditPage.aspx");
        }

        public void LoadNames()
        {
            try
            {
                SqlConnection conn = new SqlConnection(cs);
                conn.Open();
                string query = "SELECT collegename  FROM collegedb;";

                SqlCommand cmd = new SqlCommand(query, conn);

                SqlDataReader reader = cmd.ExecuteReader();

                offcanvasBody.InnerHtml = "";
                string namesHtml = "";

                while (reader.Read())
                {
                    string name = reader["collegename"].ToString();
                    namesHtml += $"<div><hr />{name.ToUpper()}</div>";
                }

                offcanvasBody.InnerHtml = namesHtml;
                conn.Close();
            }
            catch (Exception ex)
            {
                // Handle the exception
            }
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            Button btnDelete = (Button)sender;
            string item = btnDelete.CommandArgument;

            string dltQuery = "DELETE FROM CollegeDB WHERE CollegeName = @item";
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand(dltQuery, con))
                {
                    cmd.Parameters.AddWithValue("@item", item);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            Response.Redirect(Request.RawUrl);
        }

        protected void btnExportPDF_Click(object sender, EventArgs e)
        {
            ExportToPDF();
        }

        private void ExportToPDF()
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=CollegeData.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    // Create a new PDF document
                    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
                    PdfWriter.GetInstance(pdfDoc, Response.OutputStream);

                    pdfDoc.Open();
                    // Create a paragraph with centered and bold text for "College Data"
                    Paragraph paragraph = new Paragraph("\n College Data", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 16f, Font.BOLD));
                    paragraph.Alignment = Element.ALIGN_CENTER;
                    pdfDoc.Add(paragraph);

                    pdfDoc.Add(new Paragraph("\n"));

                    //html table
                    PdfPTable table = new PdfPTable(tblData.Rows[0].Cells.Count - 1);
                    // Add header row
                    for (int i = 0; i < tblData.Rows[0].Cells.Count - 1; i++)
                    {
                        // Create a cell with centered and bold text for header
                        PdfPCell headerCell = new PdfPCell(new Phrase(tblData.Rows[0].Cells[i].Text, FontFactory.GetFont(FontFactory.HELVETICA_BOLD)));
                        headerCell.HorizontalAlignment = Element.ALIGN_CENTER;
                        table.AddCell(headerCell);
                    }

                    // Add data rows
                    for (int i = 1; i < tblData.Rows.Count; i++)
                    {
                        for (int j = 0; j < tblData.Rows[i].Cells.Count - 1; j++)
                        {
                            // Create a cell with centered text for data
                            PdfPCell dataCell = new PdfPCell(new Phrase(tblData.Rows[i].Cells[j].Text));
                            dataCell.HorizontalAlignment = Element.ALIGN_CENTER;
                            table.AddCell(dataCell);
                        }
                    }

                    // Add table to PDF document
                    pdfDoc.Add(table);

                    pdfDoc.Close();
                }
            }

            Response.Write(Response.Output);
            Response.Flush();
            Response.End();
        }

        protected void btnAddCollege_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddCollege.aspx");
        }
    }
}
