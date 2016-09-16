using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;

namespace EsteemCabService.Driver
{
    public partial class DriverHome : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["SessionCount"] = Convert.ToInt32("2"); 
        }
        protected void FinishRideClick(object sender, EventArgs e)
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
                con.Close();
                if (Session["DestinationLocation"] != null)
                {
                    Response.Redirect("FinishRide.aspx");
                }
                else
                {
                    lblRes1.Text = "Ride is not Started or Ride not assigned ...";
                }  
            }            
        }

        protected void BookingProcess(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {

                // string qry1 = "select distinct EmpId from dbo.EcsEmployee ec inner join dbo.EcsLogin el on ec.userId = el.UserId where el.UserName = '" + Login1.UserName + "'";
                string qry = "select Top 1 EmpId,Lattitude,Longitude,DestinationLocation from dbo.VgetLatLngNS where UserName = '" + Session["UserName"].ToString() + "'";

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
                        Response.Redirect("StartRide.aspx");
                    }
                    else
                    {
                        lblres.Text = "No Rides are assigned or Ride already Started... ";
                    }

                }

                con.Close();
            }   

        }
        }
    }
