using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace MyProject1
{
    public partial class SignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submit_Click(object sender, EventArgs e)
        {

            try
            {


                SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connect"].ToString());
                con.Open();
                String query = "select count(*) from TblUser where Email='" +email.Value+ "' ";
                SqlCommand cmd = new SqlCommand(query, con);
                string output = cmd.ExecuteScalar().ToString();
                con.Close();
                if (Convert.ToInt32(output) > 0)
                {

                    ClientScript.RegisterStartupScript(this.GetType(), "errorr", "Email()", true);

                }
                else
                {

                    con.Open();
                    query = "insert into TblUser(Name,Email,Password) values ('" + name.Value+ "', '" + email.Value + "', '" + Password.Value + "')";
                    cmd = new SqlCommand(query, con);
                    output = cmd.ExecuteNonQuery().ToString();
                    con.Close();


                    Email(email.Value);
                    Response.Redirect("login.aspx");
                }

            }
            catch (Exception)
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
