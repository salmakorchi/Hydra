using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace MyProject1
{
  
    public partial class AddProducts : System.Web.UI.Page
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
            FillType();
            FillSeller();
           
           
        }

        void FillSeller()
        {
            if (!IsPostBack)
            {
                try { 


                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                String query = "select CompanyName from Seller ";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DropDownList2.DataSource = dt;
                DropDownList2.DataValueField = "CompanyName";
                DropDownList2.DataBind();

                con.Close();



                }
                catch (Exception)
                {

                } 
            }
        }
        void FillType()
        {
            if (!IsPostBack)
            {
                 try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                String query = "select Label from Type ";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DropDownList1.DataSource = dt;
                DropDownList1.DataValueField = "Label";
                DropDownList1.DataBind();

                con.Close();



            }
            catch (Exception)
            {

            }
   }
         

           
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {



                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
            SqlCommand cmd = new SqlCommand("insert into Product(ProductName,ProductType,Seller,ProductPrice,Stock,ProductDescription,ProductImageLink) values(@name,@type,@seller,@price,@stock,@description,@image)", con);
            con.Open();
            //Name
            SqlParameter Name = new SqlParameter();
            Name.ParameterName = "@name";
            Name.Value = TextBox1.Text;
            cmd.Parameters.Add(Name);
            //Category
            SqlParameter Type = new SqlParameter();
            Type.ParameterName = "@type";
            Type.Value = DropDownList1.SelectedItem.Value;
            cmd.Parameters.Add(Type);
            //Seller
            SqlParameter Seller = new SqlParameter();
            Seller.ParameterName = "@seller";
            Seller.Value = DropDownList2.SelectedItem.Value.ToString();
            cmd.Parameters.Add(Seller);
            //Price

            SqlParameter Price = new SqlParameter();
            Price.ParameterName = "@price";
            Price.Value = Convert.ToInt16(TextBox2.Text);
            cmd.Parameters.Add(Price);
            //Stock
            SqlParameter Stock = new SqlParameter();
            Stock.ParameterName = "@stock";
            Stock.Value = TextBox3.Text;
            cmd.Parameters.Add(Stock);
            //Description
            SqlParameter Description = new SqlParameter();
            Description.ParameterName = "@description";
            Description.Value = TextBox4.Text;
            cmd.Parameters.Add(Description);
           
            // Picture  capture
            if (FileUpload1.HasFile)
            {
                string filename = FileUpload1.PostedFile.FileName;
                string filepath = "ProductImages/" + FileUpload1.FileName;
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/ProductImages/")+filename);

                SqlParameter ImageLink = new SqlParameter();
                ImageLink.ParameterName = "@image";
                ImageLink.Value = filepath;
                cmd.Parameters.Add(ImageLink);
               

            }
            
            





            cmd.ExecuteNonQuery();
            
            con.Close();
        }
            catch (Exception ex)
            {
                Response.Write("<script>alert('"+ex.Message+"');</script>");
            }
    GridView1.DataBind();

            ClearControl(this);
}

     
    }
}