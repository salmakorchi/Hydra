using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace MyProject1
{
    public partial class AllProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var aboutus = this.Master.FindControl("aboutus");
            aboutus.Visible = false;

        }
        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
           
           // List<string[]> items = new List<string[]>();

           // for (int i = 0; i < wordlist.Length; i++)
           // {
           //     if (wordlist[i].StartsWith(
           //             TextBox1.Text,
           //             StringComparison.OrdinalIgnoreCase))
           //     {
           //         string[] item = new string[1];
           //         item[0] = wordlist[i];

           //         items.Add(item);
           //     }
           // }

           //repeater1.DataSource = items;
           // repeater1.DataBind();
        }
    }
}