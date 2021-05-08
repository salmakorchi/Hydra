using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Windows;
using System.Web.Services;
using Amazon.SimpleEmail.Model;

using Microsoft.Ajax.Utilities;

namespace MyProject1
{ 
   
    public partial class Cart : System.Web.UI.Page
    {
    
        protected void Page_Load(object sender, EventArgs e)
        {

            var aboutus = this.Master.FindControl("aboutus");
            aboutus.Visible = false;


            total();


            //if (repeater1.Items.Count == 0)
            //{
            //    Checkout.Enabled = false;
            //    Empty.Visible = true;
            //}
            //else
            //{
            //    Checkout.Enabled = true;
            //    Empty.Visible = false;
            //}



        }
        public void total()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
            con.Open();
            string query = "SELECT SUM(Product.ProductPrice * Cart.Quantity) AS Total FROM Product INNER JOIN Cart ON Product.ID = Cart.ProductID WHERE (Cart.UserID = @User)";
            SqlParameter user = new SqlParameter();
            user.ParameterName = "User";
            user.Value = Convert.ToInt32(Session["UserID"]);

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.Add(user);
            TotalPrice.InnerText = cmd.ExecuteScalar().ToString() + "$";
            Session["Price"] = TotalPrice.InnerText;

        }

        protected void repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {//Delete Button in the repeater
            
            switch (e.CommandName)
            {
                case "Delete":
                    {
                        var first = e.Item.FindControl("First") as Label;
                        var ID = e.CommandArgument;

                        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
                        con.Open();
                        string query = "delete from Cart where ProductID='" + ID + "'";
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.ExecuteNonQuery();
                        con.Close();
                        con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
                        con.Open();
                        query = "update Product set Stock=Stock+'" + Convert.ToInt32(first.Text) + "' where ID='" + ID + "'";
                        cmd = new SqlCommand(query, con);
                        cmd.ExecuteNonQuery();
                        con.Close();


                        repeater1.DataBind();


                        total();
                    }
                    break;
               

                case "Update":
                    { var first = e.Item.FindControl("First") as Label;

                      
                       
                        

                        var ID = e.CommandArgument;

                        var x = e.Item.FindControl("Quantity") as TextBox;

                      

                        if (Convert.ToInt32(x.Text) <  Convert.ToInt32(first.Text))
                        {
                            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
                            con.Open();
                            string query = "update Cart set Quantity='" + Convert.ToInt32(x.Text) + "'  where ProductID='" + ID + "'";
                            SqlCommand cmd = new SqlCommand(query, con);
                            cmd.ExecuteNonQuery();
                            con.Close();
                            int result = Convert.ToInt32(first.Text) - Convert.ToInt32(x.Text);
                            con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
                            con.Open();
                           query = "update Product set Stock=Stock+'"+result+"' where ID='" + ID + "'";
                           cmd = new SqlCommand(query, con);
                            cmd.ExecuteNonQuery();
                            con.Close();

                        }
                        else if (Convert.ToInt32(first.Text) < Convert.ToInt32(x.Text)  )
                        {
                            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
                            string query = "select Stock from Product where ID='" +ID + "'";
                            SqlCommand cmd = new SqlCommand(query, con);
                            con.Open();
                            int stock = Convert.ToInt32(cmd.ExecuteScalar());


                            con.Close();
                             int result = Convert.ToInt32(x.Text) - Convert.ToInt32(first.Text);
                            if (stock > result) {
                          
                            con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
                            con.Open();
                             query = "update Cart set Quantity='" + Convert.ToInt32(x.Text) + "'  where ProductID='" + ID + "'";

                            cmd = new SqlCommand(query, con);
                            cmd.ExecuteNonQuery();
                            con.Close();

                          
                            con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
                            con.Open();
                            query = "update Product set Stock=Stock-'" + result + "' where ID='" + ID + "'";
                            cmd = new SqlCommand(query, con);
                            cmd.ExecuteNonQuery();
                            con.Close(); }
                            else
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "errorr", "OutOfStock()", true);
                            }
                        }

                        repeater1.DataBind();

                       first.Text = x.Text;
                      

                        total();
                    }
                    break;



            }
            
          
        }
      
        
    }
    
}