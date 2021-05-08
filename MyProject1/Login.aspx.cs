using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Windows;

namespace MyProject1
{
    public partial class Accueil : System.Web.UI.Page
    {




        protected void Page_Load(object sender, EventArgs e)
        {


            if (Session["User"] != null)
            { Response.Redirect("~/Welcome.aspx"); }
        }
        protected void btnlogin_Click(object sender, EventArgs e)
        {
            try
            {

                // make sure the email and password match the data 
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
                con.Open();
                String query = "select count(*) from TblUser where Email='" + txtmail.Text + "' and Password='" + txtpassword.Text + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                String output = cmd.ExecuteScalar().ToString();
                con.Close();
                SqlConnection con2 = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
                con2.Open();
                query = "select count(*) from TblUser where Email='" + txtmail.Text + "'";

                var cmd2 = new SqlCommand(query, con2);
                int n = 0;
                n = Convert.ToInt32(cmd2.ExecuteScalar());

                if (n == 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "errorr", "Email()", true);
                    con2.Close();
                }
                else if (n == 1)
                {
                    con2.Close();
                    // get info into the data reader

                    var NbrTentative = new Dictionary<string, int>();

                    con2 = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
                    con2.Open();
                    query = "select * from TblUser where Email='" + txtmail.Text + "'";

                    cmd2 = new SqlCommand(query, con2);
                    SqlDataReader dr = cmd2.ExecuteReader();

                   
                    int count = dr.FieldCount;




                    if (Session["dictionary"] == null)
                    {
                        NbrTentative = new Dictionary<String, int>();

                    }
                    else
                    {
                        NbrTentative = Session["dictionary"] as Dictionary<string, int>;

                    }


                    //check if we can access the data reader 
                    if (dr.Read() == true)
                    {

                        try
                        {   //check if the user is blocked in the database before redirecting 

                            if (dr["isblocked"].ToString().Trim() == "True")
                            {
                                Text.Visible = true;
                                Text.Text = "Your account is blocked due to the number of tries ";

                                return;
                            }
                            else
                            {

                                if (output == "1")
                                {

                                    con.Open();
                                    query = "select Name from TblUser where Email='" + txtmail.Text + "' and Password='" + txtpassword.Text + "'";
                                    cmd = new SqlCommand(query, con);
                                    output = cmd.ExecuteScalar().ToString();
                                    Session["User"] = output;
                                    query = "select Role from TblUser where Email='" + txtmail.Text + "' ";
                                    cmd = new SqlCommand(query, con);
                                    output = cmd.ExecuteScalar().ToString();
                                    Session["Role"] = output;
                                    query = "select ID from TblUser where Email='" + txtmail.Text + "' ";
                                    cmd = new SqlCommand(query, con);
                                    output = cmd.ExecuteScalar().ToString();
                                    Session["UserID"] = output;
                                    NbrTentative[dr["Email"].ToString()] = 0;
                                    Session["Email"] = dr["Email"].ToString();
                                    if (Convert.ToInt32(Request.QueryString["page"]) == 1)
                                    {

                                        Response.Redirect(Session["DetailURL"].ToString());
                                    }
                                    else
                                    {
                                        Response.Redirect("Welcome.aspx");
                                    }

                                }
                                else
                                {
                                    if (output != "1")
                                    {
                                        var nbr = 0;
                                        //first time
                                        if (NbrTentative.ContainsKey(dr["Email"].ToString()) == false)
                                        {//check if it exists in the table
                                            if (dr["Email"].Equals(txtmail.Text) == true)
                                            {
                                                nbr = 1;
                                                //add a user to the dictionary
                                                NbrTentative.Add(dr["Email"].ToString(), nbr);

                                            }





                                        }
                                        else
                                        {//get how many times he entered a wrong 

                                            nbr = int.Parse(NbrTentative[dr["Email"].ToString()].ToString());
                                            //if the number reached 3
                                            if (nbr == 2)
                                            {
                                                LockUser(dr["Email"].ToString());

                                            }
                                            else
                                            {
                                                nbr += 1;


                                                //update the nbr
                                                NbrTentative[dr["Email"].ToString()] = nbr;
                                                Text.Text = "Your Email or your Password are wrong ! You still have " + Convert.ToString(3 - NbrTentative[dr["Email"].ToString()]) + "Chance(s)";

                                            }


                                        }
                                        Session["Dictionary"] = NbrTentative;



                                        Text.Visible = true;
                                        if (NbrTentative[dr["Email"].ToString()] < 2)
                                        {
                                            Text.Text = "Your Email or your Password are wrong ! You still have " + Convert.ToString(3 - NbrTentative[dr["Email"].ToString()]) + "Chance(s)";
                                        }







                                    }


                                }
                            }


                        }
                        catch (Exception ex)
                        {
                            Text.Visible = true;
                            Text.Text = "Wrong Password or Email";
                        }





                    }



                }

            }
            catch (Exception ex)
            {


            }

        }

        public void LockUser(string mail)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
            con.Open();
            String query = "update TblUser set isblocked='true' where Email='" + mail + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();
            Text.Visible = true;
            Text.Text = "Your account is blocked due to the number of tries ";

        }
        protected void signup_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SignUp.aspx");
        }
    }
}