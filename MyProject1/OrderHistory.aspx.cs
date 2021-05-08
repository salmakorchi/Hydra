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
    public partial class OrderHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var aboutus = this.Master.FindControl("aboutus");
            aboutus.Visible = false;
            name.InnerText = Session["User"].ToString();
            total();
        }
        public void total()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
            con.Open();
            string query = "SELECT SUM(Product.ProductPrice * OrderItems.Quantity) AS Total FROM Product INNER JOIN OrderItems ON Product.ID = OrderItems.ProductID inner join Orders on Orders.ID=OrderItems.OrderID where(Orders.UserID = @User)";

            SqlParameter user = new SqlParameter();
            user.ParameterName = "User";
            user.Value = Convert.ToInt32(Session["UserID"]);

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.Add(user);
            TotalPrice.InnerText = cmd.ExecuteScalar().ToString() + "$";
           
           

        }
    }
}