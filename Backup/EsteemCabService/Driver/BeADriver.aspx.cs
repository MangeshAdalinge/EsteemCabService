using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Device.Location;
using System.Configuration;
using System.Data.SqlClient;
using BusinessLogicLayer;


namespace EsteemCabService
{
    public partial class BeADriver : System.Web.UI.Page
    {
        ClassDriver objDriver = new ClassDriver();
        protected void RegisterUser(object sender, EventArgs e)
        {
            int userId = 0;
            string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Sp_EcsInsertEmployeeDriverLogin"))
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
                        btnSaveDriverDetails_Click();                       

                        con.Close();
                        break;
                }
               
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "User Name: " + Session["UserName"] + "');", true);
               // Response.Redirect("DriverLogIn.aspx");
                lblRes.Text = message;
            }
        }
        protected void btnSaveDriverDetails_Click()
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConString"].ConnectionString);

            string query = "SELECT MAX(EmpId) AS EmpId FROM  dbo.EcsEmployee WHERE DeptId = 2";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                objDriver.p_DriverId = Convert.ToSingle((reader["EmpId"]).ToString());
                objDriver.p_Type = Convert.ToString(ddlCabType.SelectedValue);
                objDriver.p_Name = Convert.ToString(txtName.Text);
                objDriver.p_Color = Convert.ToString(txtColour.Text);
                objDriver.p_Rental = Convert.ToSingle(txtRental.Text);
                objDriver.p_Latitude = Convert.ToSingle(lat.Value.ToString());
                objDriver.p_Longitude = Convert.ToSingle(lng.Value.ToString());
                objDriver.p_City = Convert.ToString(txtCity.Text);
                objDriver.p_State = Convert.ToString(txtState.Text);
                objDriver.p_Country = Convert.ToString(txtCountry.Text);
                objDriver.p_NumberPlate = Convert.ToString(txtNumberPlate.Text);
            }
            else 
            {
                lblRes1.Text = "Not able to register";
            }


            


            int result = objDriver.InsertDriverDetails();

            if (result > 0)
            {
                lblRes.Text = "Succefully added";
            }
            else
            {
                lblRes.Text = "not added";
            }

            //SqlConnection con = new
            //SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConString"].ConnectionString);

            //string query1 = "insert into EcsCabDetails(Type, Name, color, rental, Lattitude,Longitude, city, state, country) values (@type, @name, @colour, @rental, @lati, @longi,@city, @state, @country)";

            //SqlCommand cmd1 = new SqlCommand(query1, con);
            //cmd1.Parameters.AddWithValue("@type", type);
            //cmd1.Parameters.AddWithValue("@name", name);
            //cmd1.Parameters.AddWithValue("@colour", colour);
            //cmd1.Parameters.AddWithValue("@rental", rental);
            //cmd1.Parameters.AddWithValue("@lati", latitude);
            //cmd1.Parameters.AddWithValue("@longi", longitude);
            //cmd1.Parameters.AddWithValue("@city", city);
            //cmd1.Parameters.AddWithValue("@state", state);
            //cmd1.Parameters.AddWithValue("@country", country);

            //con.Open();
            //cmd1.ExecuteNonQuery();
            //con.Close();
        }


        protected void Page_Load(object sender, EventArgs e)
        {

           // string s = lat.Value.ToString();
           //string s1 = lat.Value.ToString();

        }


    }
}