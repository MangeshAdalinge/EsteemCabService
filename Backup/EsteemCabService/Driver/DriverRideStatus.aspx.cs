﻿using System;
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
    public partial class DriverRideStatus : System.Web.UI.Page
    {
        private String strConnString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Session["SessionCount"] = Convert.ToInt32("2");
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
            if (Session["EmpId"].ToString() != null)
            {
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

                        using (SqlCommand cmd = new SqlCommand("SELECT BillNumber,FirstName,LastName,[Source],[Destination],RideStatus,EstimatedTime,Distance FROM dbo.VDriverRideStatus WHERE EmpId='" + Session["EmpId"].ToString() + "' Order by EmpId"))
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
                                    if (dt.Rows.Count == 0)
                                    {
                                        lblNoRides.Text = "No rides are assigned till now";
                                    }
                                }
                                

                            }
                        }
                    }
                    else
                    {
                        lblRes.Text = "Details can not be Displayed a this time ..";
                    }
                }

            }
            else
            {
                lblRes.Text = "Details can not be displayed a this time ..";
            }

        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }

        protected void AddNewCustomer(object sender, EventArgs e)
        {

        }

        protected void DeleteCustomer(object sender, EventArgs e)
        {
            LinkButton lnkRemove = (LinkButton)sender;
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "delete from  EcsCustomer where " +
            "CustId=@CustId;" +
             "select * from EcsCustomer where  " + "CustId=@CustId " + "Order by CustId";
            cmd.Parameters.Add("@CustId", SqlDbType.VarChar).Value = lnkRemove.CommandArgument;
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

            string CustId = ((Label)GridView1.Rows[e.RowIndex]

                                .FindControl("lblCustId")).Text;

            string FirstName = ((TextBox)GridView1.Rows[e.RowIndex]

                                .FindControl("txtFirstName")).Text;

            string LastName = ((TextBox)GridView1.Rows[e.RowIndex]

                                .FindControl("txtLastName")).Text;

            string Address = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtAddress")).Text;
            string Email = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEmail")).Text;
            string MobileNo = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtMobileNo")).Text;




            SqlConnection con = new SqlConnection(strConnString);

            SqlCommand cmd = new SqlCommand();

            cmd.CommandType = CommandType.Text;

            cmd.CommandText = "update EcsCustomer set FirstName=@FirstName, LastName=@LastName, Address=@Address,Email=@Email,MobileNo=@MobileNo where CustId='" + Session["CustId"].ToString() + "'; " +

             "select * from EcsCustomer where CustId='" + CustId + "' Order by CustId";

            cmd.Parameters.Add("@CustId", SqlDbType.VarChar).Value = CustId;
            cmd.Parameters.Add("@FirstName", SqlDbType.VarChar).Value = FirstName;
            cmd.Parameters.Add("@LastName", SqlDbType.VarChar).Value = LastName;
            cmd.Parameters.Add("@Address", SqlDbType.VarChar).Value = Address;
            cmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = Email;
            cmd.Parameters.Add("@MobileNo", SqlDbType.VarChar).Value = MobileNo;


            GridView1.EditIndex = -1;
            GridView1.DataSource = GetData(cmd);
            GridView1.DataBind();

        }






    }
}