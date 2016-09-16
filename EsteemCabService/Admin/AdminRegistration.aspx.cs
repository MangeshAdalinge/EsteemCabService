using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicLayer;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace EsteemCabService.Admin
{
    public partial class AdminRegistration : System.Web.UI.Page
    {


        ClassAdmin objAdmin = new ClassAdmin();


        protected void RegisterUser(object sender, EventArgs e)
        {
            int userId = 0;
            string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Sp_EcsInsertEmployeeLogin"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@FirstName", Convert.ToString(txtFName.Text.Trim()));
                        cmd.Parameters.AddWithValue("@LastName", Convert.ToString(txtLName.Text.Trim()));
                        cmd.Parameters.AddWithValue("@Address", Convert.ToString(txtAddress.Text.Trim()));
                        cmd.Parameters.AddWithValue("@Email", Convert.ToString(txtEmail.Text.Trim()));
                        cmd.Parameters.AddWithValue("@MobileNo", Convert.ToString(txtMobileNo.Text.Trim()));
                        cmd.Parameters.AddWithValue("@Feedback", "");
                        cmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                        cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                        cmd.Parameters.AddWithValue("@DL", txtDlNo.Text.Trim());
                        cmd.Connection = con;
                        con.Open();
                        userId = Convert.ToInt32(cmd.ExecuteScalar());
                    }
                }
                string message = string.Empty;
                switch (userId)
                {
                    case -1:
                        message = "Username already exists.\\nPlease choose a different username.";
                        break;
                    case -2:
                        message = "Supplied email address has already been used.";
                        break;
                    default:
                        message = "Registration successful.";

                        Session["UserName"] = txtUsername.Text.Trim();

                        // string qry = "select distinct CustId from dbo.EcsCustomer where Email ='" + Convert.ToString(txtEmail.Text.Trim()) + "' and FirstName ='" + Convert.ToString(txtFirstname.Text.Trim()) + "'";
                        // SqlCommand q = new SqlCommand(qry, con);
                        //// int res = q.ExecuteNonQuery();                        
                        // using (SqlDataReader reader = q.ExecuteReader())
                        // {
                        //     if (reader.Read())
                        //     {
                        //         Session["CustId"] = reader["CustId"].ToString(); 
                        //     }

                        // }

                        con.Close();
                        break;
                }
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "User Name: " + Session["UserName"] + "');", true);
                Response.Redirect("CustomerLogIn.aspx");
            }
        }
        

        //protected void btnSave_Click(object sender, EventArgs e)
        //{

        //    objAdmin.p_DeptName = Convert.ToString("Admin");
        //    objAdmin.p_FName = Convert.ToString(txtFName.Text);
        //    objAdmin.p_LName = Convert.ToString(txtLName.Text);
        //    objAdmin.p_Address = Convert.ToString(txtAddress.Text);
        //    objAdmin.p_EMail = Convert.ToString(txtEmail.Text);
        //    objAdmin.p_MobileNo = Convert.ToString(txtMobileNo.Text);
        //    objAdmin.p_DL = Convert.ToString(txtDlNo.Text);



        //    int result = objAdmin.InsertAdminDetails();

        //    if (result > 0)
        //    {


        //        lblRes.Text = "Succefully added";
        //    }
        //    else
        //    {
        //        lblRes.Text = "not added";
        //    }

        //}
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}