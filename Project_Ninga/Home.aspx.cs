using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Configuration;

namespace Project_Ninga
{
    
    public partial class Home : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
                if (!this.IsPostBack)
            {
                //this.BindGrid();
                string SID = Request.QueryString["myid"];
                if (SID != "" &&  SID != null)  
                {

                    DataTable dt = new DataTable();
                    String FileNamez = Server.MapPath("\\Data\\Data.xls");
                    string connectionString = "Provider=Microsoft.Jet.OleDb.4.0; Data Source=" + FileNamez + "; Extended Properties = Excel 8.0; ";
                    //string connectionString = "Driver ={ Microsoft Excel Driver(*.xls)}; READONLY = FALSE; DriverId = 790; Dbq = " + FileNamez +"; ";
                    OleDbConnection Connection = new OleDbConnection(connectionString);
                    Connection.Open();
                    OleDbCommand command1 = new OleDbCommand();
                    command1.Connection = Connection;
                    command1.CommandText = "SELECT * FROM [User$] where [Sorority_ID]=" + SID + ";";
                    OleDbDataAdapter adapter1 = new OleDbDataAdapter();
                    adapter1.SelectCommand = command1;
                    adapter1.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        lblmyid.Text = dt.Rows[0]["Sorority_ID"].ToString();
                        prolink.HRef = "Profile.aspx?myid="+ dt.Rows[0]["Sorority_ID"].ToString();
                        prohome.HRef = "Home.aspx?myid=" + dt.Rows[0]["Sorority_ID"].ToString();
                    }

                    Connection.Close();
                    dt.Dispose();
                    adapter1.Dispose();
                    command1.Dispose();
                    Connection.Dispose();
                }
            }
        }
        private void BindGrid()
        {

            //string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            //using (SqlConnection con = new SqlConnection(constr))
            //{
            //    using (SqlCommand cmd = new SqlCommand("SELECT CustomerId, ContactName, City, Country FROM Customers"))
            //    {
            //        using (SqlDataAdapter sda = new SqlDataAdapter())
            //        {
            //            cmd.Connection = con;
            //            sda.SelectCommand = cmd;
            //            using (DataTable dt = new DataTable())
            //            {
            //                sda.Fill(dt);
            //                GridView2.DataSource = dt;
            //                GridView2.DataBind();
            //            }
            //        }
            //    }
            //}
            DataTable dt = new DataTable();
            DataRow dr;
            dt.Columns.Add("CustomerID");
            dt.Columns.Add("ContactName");
            dt.Columns.Add("Occupation");
            dt.Columns.Add("Business_Type");
            dt.Columns.Add("Phone");
            dt.Columns.Add("Mail");
            dt.Columns.Add("City");
            dt.Columns.Add("Country");
            for (int i = 0; i < 100; i++)
            {
                dr = dt.NewRow();
                dr["CustomerID"] = i++;
                dr["ContactName"] = (i * 1000).ToString();
                dr["Occupation"] = "Electronics";
                dr["Business_Type"] = "Seller";
                dr["Phone"] = "69087651";
                dr["Mail"] = "Philipzap@hotmail.com";
                dr["City"] = "Chennai";
                dr["Country"] = "India";
                dt.Rows.Add(dr);
            }

            GridHomeResult.DataSource = dt;
            GridHomeResult.DataBind();
            
        }
        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridHomeResult.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }

        protected void GridHomeResult_DataBinding(object sender, EventArgs e)
        {
            
        }

        protected void GridHomeResult_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            Response.Redirect("User.aspx?Sorority_ID="+ GridHomeResult.Rows[GridHomeResult.SelectedIndex].Cells[0].Text);
        }


        protected void GridHomeResult_RowCreated(object sender, GridViewRowEventArgs e)
        {
            e.Row.ToolTip = "Click to select row";
            //e.Row.Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.GridHomeResult, "Select$" + e.Row.RowIndex);
            e.Row.Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.GridHomeResult, "Select$" + e.Row.RowIndex);
        }

        protected void btncsearch_Click(object sender, EventArgs e)
        {
            GridHomeResult.DataSource = null;
            DataTable dt = new DataTable();
            dt.Columns.Add("Sorority_ID");
            dt.Columns.Add("CustomerName");
            dt.Columns.Add("BusinessCategory");
            dt.Columns.Add("BusinessType");
            dt.Columns.Add("ContactNumber");
            dt.Columns.Add("EmailContact");
            dt.Columns.Add("Address");
            dt.Columns.Add("Country");



            String FileNamez = Server.MapPath("\\Data\\Data.xls");
            string connectionString = "Provider=Microsoft.Jet.OleDb.4.0; Data Source=" + FileNamez + "; Extended Properties = Excel 8.0; ";
            //string connectionString = "Driver ={ Microsoft Excel Driver(*.xls)}; READONLY = FALSE; DriverId = 790; Dbq = " + FileNamez +"; ";
            OleDbConnection Connection = new OleDbConnection(connectionString);
            Connection.Open();
            OleDbCommand command1 = new OleDbCommand();
            command1.Connection = Connection;
            if (BCategory.Items[BCategory.SelectedIndex].Text == "-- All --" && BTYPE.Value == "All")
            {
                command1.CommandText = "SELECT * FROM [User$]";
            }
            else if (BCategory.Items[BCategory.SelectedIndex].Text != "-- All --" && BTYPE.Value == "All")
            {
                command1.CommandText = "SELECT * FROM [User$] where [BusinessCategory]='" + BCategory.Items[BCategory.SelectedIndex].Text + "'";
            }
            else if (BCategory.Items[BCategory.SelectedIndex].Text == "-- All --" && BTYPE.Value != "All")
            {
                command1.CommandText = "SELECT * FROM [User$] where [BusinessType]='" + BTYPE.Value + "'";
            }
            else
            {
                command1.CommandText = "SELECT * FROM [User$] where [BusinessCategory]='" + BCategory.Items[BCategory.SelectedIndex].Text + "' and [BusinessType]='" + BTYPE.Value + "'";
            }
            
            OleDbDataAdapter adapter1 = new OleDbDataAdapter();
            adapter1.SelectCommand = command1;
            adapter1.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                GridHomeResult.DataSource = dt;
                GridHomeResult.DataBind();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Login Error", "alert('" + "Account Number / Password Mismatch..." + "');", true);
            }

            Connection.Close();
            dt.Dispose();
            adapter1.Dispose();
            command1.Dispose();
            Connection.Dispose();


        }
    }
}