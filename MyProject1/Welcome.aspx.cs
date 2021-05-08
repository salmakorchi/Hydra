using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyProject1
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           var aboutus = this.Master.FindControl("aboutus") ;
            aboutus.Visible = true;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
            SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());

            con.Open();
            con1.Open();
            String query1 = "select top 5 ProductName from Product";
            String query = "select top 3 CompanyName from Seller order by Orders desc";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlCommand cmd1 = new SqlCommand(query1, con1);
            SqlDataReader odr1;
            odr1 = cmd1.ExecuteReader();
            int count1 = odr1.FieldCount;
            SqlDataReader odr;

            odr = cmd.ExecuteReader();
            int count = odr.FieldCount;

            while (odr.Read())
            {
                for (int i = 0; i < count; i++)
                {
                    sellers.InnerText += " " + odr["CompanyName"] + " - ";


                }
            }
            while (odr1.Read())
            {
                for (int i = 0; i < count1; i++)
                {
                    New.InnerText += " " + odr1["ProductName"] + "  -  ";


                }
            }
            con1.Close();
                con.Close();

        }

    }
}