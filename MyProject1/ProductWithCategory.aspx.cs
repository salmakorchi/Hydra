using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyProject1
{
    public partial class ProductWithCategory : System.Web.UI.Page
    {
        string Cat;
        protected void Page_Load(object sender, EventArgs e)
        {
            Cat=Request["Cat"];
            var aboutus = this.Master.FindControl("aboutus");
            aboutus.Visible = false;




        }
    }
}