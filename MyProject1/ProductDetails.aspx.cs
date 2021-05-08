using System;
using System.Web.UI.WebControls;
using System.Windows;

using System.Data.SqlClient;
using System.Configuration;
using System.Data;



namespace MyProject1
{ 
    public partial class ProductDetails : System.Web.UI.Page
    { string output;
        int thisid;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            var aboutus = this.Master.FindControl("aboutus");
            aboutus.Visible = false;
            thisid = Convert.ToInt32(Request["ThisId"]);


            Session["DetailURL"] = Request.Url.ToString();


        }
    

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

         
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {


                addToCart(int.Parse(Session["UserId"].ToString()), thisid, 1, DateTime.Today);
            }
            else {
                ClientScript.RegisterStartupScript(this.GetType(), "errorr", "login()", true);
                if (labelclick.InnerText == "clicked")
                {
                    Response.Redirect(string.Format("~/Login.aspx?RedirectUr={0}", Request.UrlReferrer));
                }
                
            }

        }
        public void addToCart(int userid, int pid, int quantity, DateTime cdate)
        {


            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());

            con.Open();
            String query = "select count(*) from cart where ProductID='"+thisid+"' and UserID='"+Convert.ToInt32(Session["UserId"])+"' ";
            SqlCommand cmd = new SqlCommand(query, con);
            output = cmd.ExecuteScalar().ToString();
             query = "select Stock from Product where ID='" + thisid + "'";
            cmd = new SqlCommand(query, con);
            int stock  = Convert.ToInt32( cmd.ExecuteScalar());


            con.Close();
           

            if (int.Parse(output) == 0 && stock>0)
            {   // add an item to cart
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());


                con.Open();
               cmd = new SqlCommand("additemtocart", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userid", userid);

                cmd.Parameters.AddWithValue("@pid", pid);
                cmd.Parameters.AddWithValue("@quantity", quantity);

                cmd.Parameters.AddWithValue("@Cdate", cdate);
                cmd.ExecuteNonQuery();
                con.Close();
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
                con.Open();
                query = "update Product set Stock=Stock-1 where ID='" + thisid+ "'";
                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();

                ClientScript.RegisterStartupScript(this.GetType(), "success", "alertSuccess()", true);

                // -1 from stock

             //   con.Open();
             //query = "update Product set Stock = Stock -1 where ID='" + thisid + "'";
             //  cmd = new SqlCommand(query, con);


            }
            else
            { // if the item is already in cart
                if (int.Parse(output) > 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "errorr", "alertalreadyincart()", true);
                    output = "";
                }
               // if its out of stock 
                else
                {
                    if (stock <= 0)
                    {
                       
                          ClientScript.RegisterStartupScript(this.GetType(), "errorr", "OutOfStock()", true);
                       
                        stock = 0;
                    }
                }
            }



            
             
         

            
        }
    
    }
}