using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace EsteemCabService
{
    public partial class AdminDetails : System.Web.UI.Page
    {
        private String strConnString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

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
            if (Session["EmpId"] != null)
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
                    if (deptId == "1")
                    {

                        using (SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.EcsEmployee WHERE Empid='" + Session["EmpId"].ToString() + "' Order by EmpId"))
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
                    else
                    {
                        lblres.Text = "Admin profile is not updated...";
                    }
                }
            }
            else
            {
                lblres.Text = "Please log in again";
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
            cmd.CommandText = "delete from  EcsEmployee where " +
            "EmpId=@EmpId;" +
             "select CabId,Status,Available from EcsEmployee where  " + "Order by EmpId";
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

            string EmpId = ((Label)GridView1.Rows[e.RowIndex]

                                .FindControl("lblEmpId")).Text;

            string FirstName = ((TextBox)GridView1.Rows[e.RowIndex]

                                .FindControl("txtFirstName")).Text;

            string LastName = ((TextBox)GridView1.Rows[e.RowIndex]

                                .FindControl("txtLastName")).Text;

            string Address = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtAddress")).Text;
            string Email = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEmail")).Text;
            string MobileNo = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtMobileNo")).Text;
            string DLNo = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtDLNo")).Text;
            


            SqlConnection con = new SqlConnection(strConnString);

            SqlCommand cmd = new SqlCommand();

            cmd.CommandType = CommandType.Text;

            cmd.CommandText = "update EcsEmployee set FirstName=@FirstName, LastName=@LastName, Address=@Address,Email=@Email,MobileNo=MobileNo,DLNo=@DLNo where EmpId='" + Session["EmpId"].ToString() + "'; " +

             "select * from EcsEmployee where EmpId='" + EmpId + "' Order by EmpId";

            cmd.Parameters.Add("@EmpId", SqlDbType.VarChar).Value = EmpId;
            cmd.Parameters.Add("@FirstName", SqlDbType.VarChar).Value = FirstName;
            cmd.Parameters.Add("@LastName", SqlDbType.VarChar).Value = LastName;
            cmd.Parameters.Add("@Address", SqlDbType.VarChar).Value = Address;
            cmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = Email;
            cmd.Parameters.Add("@MobileNo", SqlDbType.VarChar).Value = MobileNo;
            cmd.Parameters.Add("@DLNo", SqlDbType.VarChar).Value = DLNo;

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