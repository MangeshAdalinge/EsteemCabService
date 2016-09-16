using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace EsteemCabService.Admin
{
    public partial class InvoiceReport : System.Web.UI.Page
    {
        private String strConnString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if(Session["EmpId"]!= null)
                {
                     this.BindData();
                }
               

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
                if (deptId == "1")
                {

                    using (SqlCommand cmd = new SqlCommand("SELECT BillNumber,BusinessDate,[Source],[Destination],EstimatedTime,TotalDistance,Cost FROM dbo.VInvoice  where FirstName = '" + txtFirstName.Text.Trim() + "'and LastName = '" + txtLastName.Text.Trim() + "' Order by BillNumber"))
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
                    lblRes.Text = "Invoice can not be genrated at this time";
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
            cmd.CommandText = "delete from  EcsInvoice where " +
            "BillNumber=@BillNumber;" +
             "select * from EcsInvoice " + "Order by BillNumber";
            cmd.Parameters.Add("@BillNumber", SqlDbType.VarChar).Value = lnkRemove.CommandArgument;
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

            string CabId = ((Label)GridView1.Rows[e.RowIndex]

                                .FindControl("lblCabId")).Text;

            string Status = ((TextBox)GridView1.Rows[e.RowIndex]

                                .FindControl("txtStatus")).Text;

            string Available = ((TextBox)GridView1.Rows[e.RowIndex]

                                .FindControl("txtAvailable")).Text;

            SqlConnection con = new SqlConnection(strConnString);

            SqlCommand cmd = new SqlCommand();

            cmd.CommandType = CommandType.Text;

            cmd.CommandText = "update EcsInvoice set Status=@Status," + "Available=@Available where CabId=@CabId;" +

             "select CabId,Status,Available from EcsInvoice where Status ='Deactive' and  Available='n' Order by CabId";

            cmd.Parameters.Add("@CabId", SqlDbType.VarChar).Value = CabId;

            cmd.Parameters.Add("@Status", SqlDbType.VarChar).Value = Status;

            cmd.Parameters.Add("@Available", SqlDbType.VarChar).Value = Available;

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

        protected void FetchInvoice(object sender, EventArgs e)
        {
            if (Session["EmpId"] != null)
            {
                this.BindData();
            }
        }



    }
}