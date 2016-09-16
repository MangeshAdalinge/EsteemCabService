using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace EsteemCabService.Admin
{
    public partial class DriverActivate : System.Web.UI.Page
    {

        //protected void Insert(object sender, EventArgs e)
        //{
        //    using (EsteemDataContext ctx = new EsteemDataContext())
        //    {
        //        EcsCabDetail Cab = new EcsCabDetail
        //        {
        //            Status = txtS
        //            Available = txtAvailable.Text
        //        };
        //        ctx.Cabs.InsertOnSubmit(Cab);
        //        ctx.SubmitChanges();
        //    }

        //    this.BindGrid();
        //}


        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GridView1.EditIndex)
            {
                (e.Row.Cells[2].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }
        }


        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            this.BindGrid();
        }



        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }

        private void BindGrid()
        {
            string deptId=null;
            string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();
                SqlCommand cmd1 = new SqlCommand("SELECT DeptId FROM dbo.EcsEmployee WHERE EmpId = " + Session["EmpId"].ToString(),con);
                
                using (SqlDataReader reader = cmd1.ExecuteReader())
                {
                    
                    if (reader.Read())
                    {
                        deptId = reader["DeptId"].ToString();
                    }

                }
                if (deptId == "1")
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.EcsCabDetails WHERE status <> 'Active' and Available = 'n'" + "Order by CabId"))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            //cmd.Connection = con;
                            //sda.SelectCommand = cmd;
                            //using (DataTable dt = new DataTable())
                            //{
                            //    sda.Fill(dt);
                            //    GridView1.DataSource = dt;
                            //    GridView1.DataBind();
                            //}

                            using (EsteemDataContext ctx = new EsteemDataContext())
                            {
                                GridView1.DataSource = from EcsCabDetail in ctx.EcsCabDetails
                                                       select EcsCabDetail;
                                GridView1.DataBind();
                            }
                        }
                    }
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindGrid();
            }

        }
    }
}