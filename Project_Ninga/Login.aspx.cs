using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;

namespace Project_Ninga
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

            }
        }

        protected void Signin_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            String FileNamez = Server.MapPath("\\Data\\Data.xls");
            string connectionString = "Provider=Microsoft.Jet.OleDb.4.0; Data Source=" + FileNamez + "; Extended Properties = Excel 8.0; ";
            //string connectionString = "Driver ={ Microsoft Excel Driver(*.xls)}; READONLY = FALSE; DriverId = 790; Dbq = " + FileNamez +"; ";
            OleDbConnection Connection = new OleDbConnection(connectionString);
            Connection.Open();
            OleDbCommand command1 = new OleDbCommand();
            command1.Connection = Connection;
            command1.CommandText = "SELECT * FROM [Login$] where [Account_Number]="+ Account_ID.Value +" and [Password]='"+ exampleInputPassword1.Value +"'";
            OleDbDataAdapter adapter1 = new OleDbDataAdapter();
            adapter1.SelectCommand = command1;
            adapter1.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Response.Redirect("Home.aspx?myid="+ dt.Rows[0]["Sorority_ID"].ToString());
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