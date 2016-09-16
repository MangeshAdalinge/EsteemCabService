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
    public partial class StartRide : System.Web.UI.Page
    {
       
        protected void BookingProcess(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);

            string qry = "SELECT v.BookingId as BookingId,c.Available as Available FROM EcsCabDetails c INNER JOIN dbo.VgetLatLngNS v ON v.EmpId = c.DriverId WHERE v.UserName = '" + Session["UserName"].ToString() + "'";
            con.Open();
            SqlCommand q1 = new SqlCommand(qry, con);
            // int res = q.ExecuteNonQuery();
            
            string Available = null;
            
            using (SqlDataReader reader1 = q1.ExecuteReader())
            {
                if (reader1.Read())
                {
                    Session["BookingId"] = reader1["BookingId"].ToString();
                    Available = reader1["Available"].ToString();

                }

            }
            con.Close();
            if (Available.Trim() == "y")
            {                   
                    
            
                string distance = Convert.ToString(Distance.Value.ToString());
                distance = distance.Replace(",", "");
                distance = distance.Replace(" km", "");
                Session["Distance"] = distance;
                //Session["Duration"] = Duration.Value.ToString();
                Session["SourceLocation"] = txtSource.Text;
                Session["DestinationLocation"] = txtDestination.Text;
                string s = (Duration.Value.ToString()).ToLower();
                string hr;
                if (s.IndexOf("hours") != -1)
                {
                    hr = s.Substring(0, s.IndexOf("hours") - 1);
                }
                else
                {
                    hr = "00";
                }
                string min;                

                if (s.IndexOf("m") != -1)
                {
                    if ((s.IndexOf("m") - 3) >= 0)
                        min = s.Substring(s.IndexOf("m") - 3, 2);
                    else
                    {
                        if ((s.IndexOf("m") - 2) >= 0)
                            min = "0"+s.Substring(s.IndexOf("m") - 2, 1);
                        else
                            min = "00";
                    }
                }
                else
                {
                    min = "00";
                }
                string sec;
                if (s.IndexOf("se") != -1)
                {
                    sec = s.Substring(s.IndexOf("se") - 3, 2);
                }
                else
                {
                    sec = "00";
                }

                Session["Duration"] = hr + ":" + min + ":" + sec;
                if (Session["Duration"].ToString() == "00:00:00")
                {
                    Session["Duration"] = "00:05:00";
                }
                StartRide1();
            }
            else
            {
                string display = "Ride is already Started!";
               // Page.ClientScript.RegisterOnSubmitStatement(this.GetType(), "Message Box", "<Script language ='javascript'>alert('" + display + "')</Script>");
                //Response.Redirect("FinishRide.aspx");
                

            }

            
        }

        public void StartRide1()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SPStartRide"))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@EmpId", Session["EmpId"].ToString());
                    cmd.Parameters.AddWithValue("@BookingId", Session["BookingId"].ToString());
                    cmd.Parameters.AddWithValue("@Duration", Session["Duration"].ToString());
                    cmd.Connection = con;
                    con.Open();
                    int res = Convert.ToInt32(cmd.ExecuteScalar());
                    switch (res)
                    {
                        case 0:
                            lblRes.Visible = false;
                            lblRes1.Visible = true;
                            lblNC.Text = "Ride Started";
                           // btnFinishRide.Visible = true;
                            btnStartRide.Visible = false;                            
                           // Response.Redirect("FinishRide.Aspx");
                            break;
                        default:
                            lblRes.Visible = false;
                            lblNC.Text = "Ride not Started";
                                              
                            break;

                    }
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //btnFinishRide.Visible = false;
            lblRes1.Visible = false;
        
            string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {

                // string qry1 = "select distinct EmpId from dbo.EcsEmployee ec inner join dbo.EcsLogin el on ec.userId = el.UserId where el.UserName = '" + Login1.UserName + "'";
                string qry = "select EmpId,Lattitude,Longitude,DestinationLocation from dbo.VgetLatLngNS where UserName = '" + Session["UserName"].ToString() + "'";

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
                    txtDestination.Text = Session["DestinationLocation"].ToString();
                    ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:GetAddress(); ", true);
                }
                else 
                {
                    txtDestination.Visible = false;
                    txtSource.Visible = false;
                    btnStartRide.Visible = false;
                    //btnRoute.Visible = false;
                    txtDestination.Enabled = false;
                    txtSource.Enabled = false;
                    btnStartRide.Enabled = false;
                    
                   // btnRoute.Enabled = false;
                    lblNC.Text = "Ride already Started or No Ride is assigned";
                }
                

            }     
          
           
        }

        //protected void FinishRideClick(object sender, EventArgs e)
        //{
        //    btnStartRide.Visible = true;
        //    Response.Redirect("FinishRide.aspx");
        //}
    }
}