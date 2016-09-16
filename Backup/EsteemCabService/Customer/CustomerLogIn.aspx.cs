using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;


namespace EsteemCabService
{
    public partial class CustomerLogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            

            if (Convert.ToInt32(Session["SessionCount"])> 1)
            {
                Session.Abandon();
                Session.Clear();
            }
            else
            {
                Session["SessionCount"] = Convert.ToInt32("1");
               // Session["SessionCust"] = Convert.ToInt32(Session["SessionCount"]);
               // Login1.UserName = (string)Session["UserName"];
            }
        }

        protected void ValidateUser(object sender, AuthenticateEventArgs e)
        {
            
            int userId = 0;
            string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SP_EcsValidateUser"))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Username", Login1.UserName);
                    cmd.Parameters.AddWithValue("@Password", Login1.Password);
                    cmd.Parameters.AddWithValue("@Type", 3);
                    cmd.Connection = con;
                    con.Open();
                    userId = Convert.ToInt32(cmd.ExecuteScalar());
                    
                }
                switch (userId)
                {
                    case -1:
                        Login1.FailureText = "Username and/or password is incorrect.";
                        break;
                    case -2:
                        Login1.FailureText = "Not a valid Customer";
                        break;
                    default:
                        FormsAuthentication.RedirectFromLoginPage(Login1.UserName, Login1.RememberMeSet);
                        Session["UserName"] = Login1.UserName;

                        string qry = "select distinct CustId from dbo.EcsCustomer ec inner join dbo.EcsLogin el on ec.userId = el.UserId where el.UserName = '" + Login1.UserName+"'";
                        SqlCommand q = new SqlCommand(qry, con);
                       // int res = q.ExecuteNonQuery();                        
                        using (SqlDataReader reader = q.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                Session["CustId"] = reader["CustId"].ToString(); 
                            }
                           
                        }
                        if (Session["CustId"] != null)
                        {
                            con.Close();
                            Response.Redirect("RideStatus.Aspx");
                        }
                        else
                            Login1.FailureText = "Not a valid Customer";
                        break;
                }
            }
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserRegistration.aspx");
        }
    }
}