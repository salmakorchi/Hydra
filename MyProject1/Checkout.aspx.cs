using Amazon.CloudFormation.Model;
using Amazon.SimpleEmail.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace MyProject1
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var aboutus = this.Master.FindControl("aboutus");
            aboutus.Visible = false;
            total();

            firstName.Value = Session["User"].ToString();
            email.Value = Session["Email"].ToString();
           

        }
        public void total()
        {
            try { 
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
            con.Open();
            string query = "SELECT SUM(Product.ProductPrice * Cart.Quantity) AS Total FROM Product INNER JOIN Cart ON Product.ID = Cart.ProductID WHERE (Cart.UserID = @User)";
            SqlParameter user = new SqlParameter();
            user.ParameterName = "User";
            user.Value = Convert.ToInt32(Session["UserID"]);

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.Add(user);
            Label1.Text= cmd.ExecuteScalar().ToString() + "$";
          }
            catch (Exception ex)
            {
                System.Windows.MessageBox.Show(ex.Message);

            }


        }
        public void AddToOrder()
        {
            //AddToOrder 
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
            SqlCommand cmd = new SqlCommand("SELECT IDPayment FROM Payment WHERE IDPayment=(SELECT max(IDPayment) FROM Payment);", con);
            con.Open();
            int output = Convert.ToInt32(cmd.ExecuteScalar());


            cmd.CommandText = "insert into Orders (UserID,Payment) values('"+Convert.ToInt32(Session["UserID"])+"','"+output+"')";
            cmd.ExecuteNonQuery();

            con.Close();


            //Update order count 
           con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
            SqlConnection con2 = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
            cmd = new SqlCommand("(select count(Seller) as countt, Seller from Product inner join OrderItems on Product.ID = ProductID where Seller = Seller group by Seller)", con);
            con.Open();
            SqlDataReader odr = cmd.ExecuteReader();
       SqlCommand cmd2 = new SqlCommand();
            con2.Open();
            cmd2.Connection = con2;
         
                int count = odr.FieldCount;
               
            while (odr.Read())
            {
                for (int i = 0; i < count; i++)
                {
                   
                    cmd2.CommandText = "update Seller set Orders ='" + Convert.ToInt32( odr["countt"]) + "' where CompanyName='" + Convert.ToString( odr["Seller"]) + "'";
                    

                    cmd2.ExecuteNonQuery();
                }
            }

            con2.Close();
        


           
            con.Close();


        }
        public void AddToPayment()
        { string type;

            if (credit.Checked == true)
            {
                type = "Credit";

            }
            else if (debit.Checked== true)
            {
                type = "Debit";
            }
            else
            {
                type = "Paypal";
            }


            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
            SqlCommand cmd = new SqlCommand("insert into Payment(Type,NameOnCard,CCN,Expiration,CvV) values('" + type.ToString() + "','"+name.Value.ToString()+"','"+Convert.ToInt32( number.Value)+"','"+expiration.Value.ToString()+"','"+ Convert.ToInt32( cvv.Value)+"')", con) ;
            
            con.Open();

            cmd.ExecuteNonQuery();
            con.Close();
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            try { 
            AddToPayment();
            AddToOrder();
            AddToDetails();
                ClearCart();
                ClientScript.RegisterStartupScript(this.GetType(), "success", "alertSuccess()", true);
            }
            catch (Exception )
            {

            }

        }
        public void AddToDetails()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
            SqlCommand cmd = new SqlCommand("SELECT ID FROM Orders WHERE ID=(SELECT max(ID) FROM Orders);", con);
            con.Open();
            int output = Convert.ToInt32(cmd.ExecuteScalar());

            cmd.CommandText = "INSERT INTO OrderItems(OrderID, ProductID, Quantity) SELECT Orders.ID ,Cart.ProductID,Cart.Quantity FROM Cart , Orders WHERE Cart.UserID ='"+Convert.ToInt32(Session["UserID"])+"' ";
            cmd.ExecuteNonQuery();

            con.Close();
        }
        public void ClearCart()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
            SqlCommand cmd = new SqlCommand("Delete From Cart where UserID='"+Session["UserID"]+"'", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}