using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using BusinessLogicLayer;


namespace EsteemCabService
{
    public partial class UserRegistration : System.Web.UI.Page
    {
        string message = string.Empty;
        ClassCard ObjCust = new ClassCard();

        protected void InsertCardDetails(string CustId)
        {
            ObjCust.p_CustId = CustId;
            ObjCust.p_CardHolderName = Convert.ToString(txtCardHoldername.Text.Trim());
            ObjCust.p_CardNumber = Convert.ToString(txtCardNumber.Text.Trim());

                int Res = ObjCust.InsertCustomerCarddetails();
                string message = string.Empty;
            if (Res>0)
            {
                message = "Registration successful.";
            }
            else
            {
                message = "Registration not successful.";
            }
               
            
        }

        //protected void RegisterUser(object sender, EventArgs e)
        //{
            //ObjCust.p_FirstName = Convert.ToString(txtFirstname.Text.Trim());
            //ObjCust.p_LastName = Convert.ToString(txtLastname.Text.Trim());
            //ObjCust.p_Address = Convert.ToString(txtAddress.Text.Trim());
            //ObjCust.p_Email = Convert.ToString(txtEmail.Text.Trim());
            //ObjCust.p_MobileNo = Convert.ToString(txtMob.Text.Trim());
            //ObjCust.p_Feedback = "";
            //ObjCust.p_UserName = Convert.ToString(txtUsername.Text.Trim());
            //ObjCust.p_Password = Convert.ToString(txtPassword.Text.Trim());

        //    int Res = ObjCust.InsertCustomerDetails();
        //    string message = string.Empty;
        //    switch (Res)
        //    {
        //        case 0:
        //            message = "Username already exists.\\nPlease choose a different username.";
        //            break;
        //        case 2:
        //            message = "Supplied email address has already been used.";
        //            break;
        //        default:
        //            message = "Registration successful.";
        //            break;
        //    }
        //    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "');", true);

        //}

        protected void RegisterUser(object sender, EventArgs e)
        {
            int userId = 0;
            string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Sp_EcsInsertCustomer"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@FirstName", Convert.ToString(txtFirstname.Text.Trim()));
                        cmd.Parameters.AddWithValue("@LastName", Convert.ToString(txtLastName.Text.Trim()));
                        cmd.Parameters.AddWithValue("@Address" , Convert.ToString(txtAddress.Text.Trim()));
                        cmd.Parameters.AddWithValue("@Email" , Convert.ToString(txtEmail.Text.Trim()));
                        cmd.Parameters.AddWithValue("@MobileNo" , Convert.ToString(txtMob.Text.Trim()));
                        cmd.Parameters.AddWithValue("@Feedback" , "");                       
                        cmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                        cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());                        
                        cmd.Connection = con;
                        con.Open();
                        userId = Convert.ToInt32(cmd.ExecuteScalar());
                    }
                }
                
                switch (userId)
                {
                    case -1:
                        message = "Username already exists.\\nPlease choose a different username.";
                        lblRes.Text = message;
                        break;
                    case -2:
                        message = "Supplied email address has already been used.";
                        lblRes.Text = message;
                        break;
                    default:
                        Session["UserName"] = txtUsername.Text.Trim();

                        string qry = "select top 1 CustId from dbo.EcsCustomer where UserId = (select UserId from EcsLogin where UserName ='" + Session["UserName"] +"')";
                        SqlCommand q = new SqlCommand(qry, con);
                       // int res = q.ExecuteNonQuery();                        
                        SqlDataReader reader = q.ExecuteReader();
                        if (reader.Read())
                        {
                            Session["CustId"] = reader["CustId"].ToString();
                            InsertCardDetails(Session["CustId"].ToString());
                            message = "Registration successful.";
                            lblRes.Text = message;
                            this.Page.ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "User Name: " + Session["UserName"] + "');", true);
                            Response.Redirect("CustomerLogIn.aspx");
                            con.Close();
                        }
                        else 
                        {
                            lblRes.Text = "Registration not successful...";
                        }
                        break;
                }
                this.Page.ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "User Name: " + Session["UserName"] + "');", true);

            }
        }
        


        protected void Page_Load(object sender, EventArgs e)
        {

        }

                }
    }
