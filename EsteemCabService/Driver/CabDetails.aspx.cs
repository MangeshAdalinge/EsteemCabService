using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace EsteemCabService.Driver
{
    public partial class CabDetails : System.Web.UI.Page
    {
        private String strConnString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Session["EmpId"] = "2";
                this.BindData();

            }

        }

        private DataTable GetData(SqlCommand cmd)
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(strConnString);
            SqlDataAdapter sda = new SqlDataAdapter();
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            con.Open();
            sda.SelectCommand = cmd;
            sda.Fill(dt);
            return dt;
        }

        private void BindData()
        {

            string deptId = null;
            string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();
                SqlCommand cmd1 = new SqlCommand("SELECT DeptId FROM dbo.EcsEmployee WHERE EmpId = " + Session["EmpId"].ToString(), con);

                using (SqlDataReader reader = cmd1.ExecuteReader())
                {

                    if (reader.Read())
                    {
                        deptId = reader["DeptId"].ToString();
                    }

                }
                if (deptId == "2")
                {

                    using (SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.EcsCabDetails WHERE DriverId='" + Session["EmpId"].ToString() + "' Order by DriverId"))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            cmd.Connection = con;
                            sda.SelectCommand = cmd;
                            using (DataTable dt = new DataTable())
                            {
                                sda.Fill(dt);
                                GridView1.DataSource = dt;
                                GridView1.DataBind();
                            }
                            //if (GridViewRowEventArgs..Row.RowType == DataControlRowType.DataRow)
                            //{
                            //    //Find the DropDownList in the Row
                            //    DropDownList ddlCountries = (e.Row.FindControl("ddlCountries") as DropDownList);
                            //    ddlCountries.DataSource = GetData("SELECT DISTINCT Country FROM Customers");
                            //    ddlCountries.DataTextField = "Country";
                            //    ddlCountries.DataValueField = "Country";
                            //    ddlCountries.DataBind();

                            //    //Add Default Item in the DropDownList
                            //    ddlCountries.Items.Insert(0, new ListItem("Please select"));

                            //    //Select the Country of Customer in DropDownList
                            //    string country = (e.Row.FindControl("lblCountry") as Label).Text;
                            //    ddlCountries.Items.FindByValue(country).Selected = true;
                            //}

                        }
                    }
                }
            }

        }



        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }

        protected void AddNewCustomer(object sender, EventArgs e)
        {
            //string CustomerID = ((TextBox)GridView1.FooterRow.FindControl("txtCustomerID")).Text;
            //string Name = ((TextBox)GridView1.FooterRow.FindControl("txtContactName")).Text;
            //string Company = ((TextBox)GridView1.FooterRow.FindControl("txtCompany")).Text;
            //SqlConnection con = new SqlConnection(strConnString);
            //SqlCommand cmd = new SqlCommand();
            //cmd.CommandType = CommandType.Text;
            //cmd.CommandText = "insert into customers(CustomerID, ContactName, CompanyName) " +
            //"values(@CustomerID, @ContactName, @CompanyName);" +
            // "select CustomerID,ContactName,CompanyName from customers";
            //cmd.Parameters.Add("@CustomerID", SqlDbType.VarChar).Value = CustomerID;
            //cmd.Parameters.Add("@ContactName", SqlDbType.VarChar).Value = Name;
            //cmd.Parameters.Add("@CompanyName", SqlDbType.VarChar).Value = Company;
            //GridView1.DataSource = GetData(cmd);
            //GridView1.DataBind();
        }

        protected void DeleteCustomer(object sender, EventArgs e)
        {
            LinkButton lnkRemove = (LinkButton)sender;
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "delete from  EcsCabDetails where " +
            "DriverId=@EmpId;" +
             "select * from EcsCabDetails where DriverId=@EmpId Order by EmpId";
            cmd.Parameters.Add("@EmpId", SqlDbType.VarChar).Value = lnkRemove.CommandArgument;
            GridView1.DataSource = GetData(cmd);
            GridView1.DataBind();
        }


        protected void EditCustomer(object sender, GridViewEditEventArgs e)
        {

            GridView1.EditIndex = e.NewEditIndex;

            BindData();

        }

        protected void CancelEdit(object sender, GridViewCancelEditEventArgs e)
        {

            GridView1.EditIndex = -1;

            BindData();

        }

        protected void UpdateCustomer(object sender, GridViewUpdateEventArgs e)
        {

            string EmpId = ((Label)GridView1.Rows[e.RowIndex].FindControl("lblEmpId")).Text;
            string Name = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtName")).Text;
            string Color = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtColor")).Text;
            string Rental = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtRental")).Text;
            string City = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtState")).Text;
            string State = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtMobileNo")).Text;
            string Country = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtCountry")).Text;



            SqlConnection con = new SqlConnection(strConnString);

            SqlCommand cmd = new SqlCommand();

            cmd.CommandType = CommandType.Text;

            cmd.CommandText = "update EcsCabDetails set Name=@Name, Name=@Name, Color=@Color,Rental=@Rental,City=@City,State=@State,Country=@Country where DriverId='" + Session["EmpId"].ToString() + "'; " +

             "select * from EcsCabDetails where DriverId='" + EmpId + "' Order by EmpId";

            cmd.Parameters.Add("@EmpId", SqlDbType.VarChar).Value = EmpId;
            cmd.Parameters.Add("@FirstName", SqlDbType.VarChar).Value = Name;
            cmd.Parameters.Add("@LastName", SqlDbType.VarChar).Value = Color;
            cmd.Parameters.Add("@Address", SqlDbType.VarChar).Value = Rental;
            cmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = City;
            cmd.Parameters.Add("@MobileNo", SqlDbType.VarChar).Value = State;
            cmd.Parameters.Add("@DLNo", SqlDbType.VarChar).Value = Country;

            GridView1.EditIndex = -1;
            GridView1.DataSource = GetData(cmd);
            GridView1.DataBind();

            //GridView1.EditIndex = -1;

            //using (SqlDataAdapter sda = new SqlDataAdapter())
            //{
            //    cmd.Connection = con;
            //    sda.SelectCommand = cmd;
            //    using (DataTable dt = new DataTable())
            //    {
            //        sda.Fill(dt);
            //        GridView1.DataSource = dt;
            //        GridView1.DataBind();
            //    }

        }



    }
}