using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using Microsoft.SqlServer.Server;
using System.Data;
using System.IO;

namespace MyProject1
{
    public partial class AddItem : System.Web.UI.Page
    {
        public void ClearControl(Control control)
        {
            var textbox = control as TextBox;
            if (textbox != null)
                textbox.Text = string.Empty;

            var dropDownList = control as DropDownList;
            if (dropDownList != null)
                dropDownList.SelectedIndex = 0;


            foreach (Control childControl in control.Controls)
            {
                ClearControl(childControl);
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            var aboutus = this.Master.FindControl("aboutus");
            aboutus.Visible = false;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {



                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
                SqlCommand cmd = new SqlCommand("insert into Seller(CompanyName,CEO,Phone,Email,ImageLink) values(@CName,@ceo,@phone,@email,@image)", con);
                con.Open();
                //Name
                SqlParameter Name = new SqlParameter();
                Name.ParameterName = "@CName";
                Name.Value = TextBox1.Text;
                cmd.Parameters.Add(Name);
                //Ceo
                SqlParameter Ceo = new SqlParameter();
                Ceo.ParameterName = "@ceo";
                Ceo.Value = TextBox2.Text;
                cmd.Parameters.Add(Ceo);
             
                //Phone

                SqlParameter Phone = new SqlParameter();
                Phone.ParameterName = "@phone";
                Phone.Value = Convert.ToInt32(TextBox4.Text);
                cmd.Parameters.Add(Phone);
                //Email
                SqlParameter Email = new SqlParameter();
                Email.ParameterName = "@email";
                Email.Value = TextBox3.Text;
                cmd.Parameters.Add(Email);
              

                // Picture  capture
                if (FileUpload1.HasFile)
                {
                    string filename = FileUpload1.PostedFile.FileName;
                    string filepath = "SellerImages/" + FileUpload1.FileName;
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/SellerImages/") + filename);

                    SqlParameter ImageLink = new SqlParameter();
                    ImageLink.ParameterName = "@image";
                    ImageLink.Value = filepath;
                    cmd.Parameters.Add(ImageLink);


                }







                cmd.ExecuteNonQuery();

                con.Close();
                GridView1.DataBind();
                ClearControl(this);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
           

        }
    }
}