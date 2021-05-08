using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyProject1
{
    public partial class Main : System.Web.UI.MasterPage
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
         
            if (Session["User"] != null  ){
                LinkButton1.Visible = false;
            LinkButton2.Visible = false;
               
               
            UsernameDisplay.InnerText = "Welcome ," + Session["User"].ToString();
             if (Session["Role"].ToString()=="Admin"){
                    this.footer1.Visible = true;
                }
                else

                {
                    this.footer1.Visible = false;
                }
               
            }
            else
            {
                this.UserList.Visible = false;

                this.footer1.Visible = false;
                LinkButton3.Visible = false;
            }
        }
        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("Welcome.aspx");
        }

        protected void LinkButton12_Click(object sender, EventArgs e)
        {

        }
        //public string AboutLink
        //{
        //    get
        //    {
        //        return aboutus.InnerText;
        //    }
        //    set
        //    {
        //        aboutus.InnerText = value;
        //    }
        //}
    }
}