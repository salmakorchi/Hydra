using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Services.Description;
using System.Windows;
using Google;
using System.Net.Mail;
using System.Net;

namespace MyProject1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
       
        
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void login_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                
                
                    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connect"].ToString());
                    con.Open();
                    String query = "select count(*) from TblUser where Email='" + TxtEmail.Text + "' ";
                    SqlCommand cmd = new SqlCommand(query, con);
                    string output = cmd.ExecuteScalar().ToString();
                    con.Close();
                    if (Convert.ToInt32(output)>0)
                    {

                    MessageBox.Show("This Email Already exists ");

                    }
                    else
                    {
                  
                        con.Open();
                        query = "insert into TblUser(Name,Email,Password) values ('" + Name.Text + "', '" + TxtEmail.Text + "', '" + TxtPassword.Text + "')";
                        cmd = new SqlCommand(query, con);
                        output = cmd.ExecuteNonQuery().ToString();
                        con.Close();
                   

                    Email(TxtEmail.Text);
                    Response.Redirect("login.aspx");
                }
                
        }
            catch (Exception )
            { 
                Response.Write("Verify Your info ");


            }
}
        public static void Email(string email)
        {
            try
            {
                MailMessage message = new MailMessage();
                SmtpClient smtp = new SmtpClient();
                message.From = new MailAddress("Contact.Hydra.maroc@gmail.com");
                message.To.Add(new MailAddress(email));
                message.Subject = "Test";
                message.IsBodyHtml = false; //to make message body as html  
                message.Body =
                   " holaaaaa,This email has been sent from Hydra You have received this email because this email address was used during registration for our forums.If you did not register at our forums, please disregard this email.You do not need to unsubscribe or take any further action.";
                smtp.Port = 587;
                smtp.Host = "smtp.gmail.com"; //for gmail host  
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential("Contact.Hydra.maroc@gmail.com", "Hydra123456789");
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.Send(message);
            }
            catch (Exception) { }
        }
    }
}
