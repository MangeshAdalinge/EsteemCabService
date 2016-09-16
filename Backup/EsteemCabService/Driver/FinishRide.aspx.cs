using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace EsteemCabService.Driver
{
    public partial class FinishRide : System.Web.UI.Page
    {

        public void NowFinishRide()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {

                using (SqlCommand cmd = new SqlCommand("SPFinishRide"))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@DriverId", Session["DriverId"].ToString());
                    cmd.Parameters.AddWithValue("@BookingId", Session["BookingId"].ToString());
                    cmd.Connection = con;
                    con.Open();
                    int res = Convert.ToInt32(cmd.ExecuteScalar());
                    switch (res)
                    {
                        case 0:
                            lblRes1.Text = "Ride Finished";
                            //Response.Redirect("DriverHosme.aspx");
                            break;
                        default:
                            lblRes1.Text = "Error in Ride Finish";
                            //Response.Redirect("FinishRide.Aspx");
                            break;

                    }
                }
            }
        }
        protected void FinishRide_Click()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();
                string qry = "select Top 1 DriverId,BookingId from dbo.VgetLatLng where UserName = '" + Session["UserName"] + "'";
                SqlCommand q = new SqlCommand(qry, con);
                // int res = q.ExecuteNonQuery();                        
                using (SqlDataReader reader = q.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        Session["DriverId"] = reader["DriverId"].ToString();
                        Session["BookingId"] = reader["BookingId"].ToString();
                        
                    }

                }
            }
            if (Session["DriverId"] != null)
            {
                NowFinishRide();
            }
            else 
            {

                lblRes1.Text = "Ride can not finished ... Please check if you have any ride started to complete";
            }
            



        }
        protected void Page_Load(object sender, EventArgs e)
        {

            string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {

                // string qry1 = "select distinct EmpId from dbo.EcsEmployee ec inner join dbo.EcsLogin el on ec.userId = el.UserId where el.UserName = '" + Login1.UserName + "'";
                string qry = "select Top 1 EmpId,Lattitude,Longitude,DestinationLocation from dbo.VgetLatLng where UserName = '" + Session["UserName"].ToString() + "'";

                con.Open();
                SqlCommand q = new SqlCommand(qry, con);
                // int res = q.ExecuteNonQuery();                        
                using (SqlDataReader reader = q.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        Session["EmpId"] = reader["EmpId"].ToString();
                        Session["DrLattitude"] = Convert.ToSingle(reader["Lattitude"].ToString());
                        Session["DrLongitude"] = Convert.ToSingle(reader["Longitude"].ToString());
                        Session["DestinationLocation"] = reader["DestinationLocation"].ToString();
                    }

                }
                if (Session["DestinationLocation"] != null)
                {   

                    qry = "SELECT Available FROM dbo.EcsCabDetails WHERE DriverId = (select Top 1 EmpId from dbo.VgetLatLng where UserName = '" + Session["UserName"].ToString() + "')";
                    SqlCommand q1 = new SqlCommand(qry, con);
                    // int res = q.ExecuteNonQuery(); 
                    string Available = null;
                    using (SqlDataReader reader1 = q1.ExecuteReader())
                    {
                        if (reader1.Read())
                        {
                            Available = reader1["Available"].ToString();

                        }

                    }
                    con.Close();
                    if (Available != null)
                    {
                        if (Available.Trim() == "n")
                        {
                            //Response.Redirect("StartRide.Aspx");                    
                            FinishRide_Click();
                        }
                    }
                    else
                        lblRes1.Text = "Ride is not started yet";
                }
                else
                {
                    lblRes1.Text = "Ride can not be finished, as no ride is started yet";
                }

            }
        }

    }
}