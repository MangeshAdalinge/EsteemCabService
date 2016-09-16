using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace EsteemCabService
{
    public partial class NearByCabs : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
                           
                if (Session["CurrentLat"].ToString() != null && Session["CurrentLong"].ToString() != null)
                {                    

                    string clat = Session["CurrentLat"].ToString();
                    string clong = Session["CurrentLong"].ToString();

                    string markers = GetMarkers();
                    Literal1.Text = @" <script type='text/javascript'>
                     function initialize() { 
                     var mapOptions = {
                     center: new google.maps.LatLng(" + clat + "," + clong + "),zoom: 10, panControl:true,zoomControl:true,mapTypeControl:false,scaleControl:false,streetViewControl:false,overviewMapControl:false,rotateControl:false, mapTypeId: google.maps.MapTypeId.ROADMAP,};var myMap = new google.maps.Map(document.getElementById('mapArea'),mapOptions);"
                          + markers +

                                @"}
                     </script>";

                    if (cabLat.Value.ToString() != "")
                    {
                        Session["cabLat"] = Convert.ToSingle(cabLat.Value.ToString());
                        Session["cabLong"] = Convert.ToSingle(cabLng.Value.ToString());

                        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Cab Lat: " + Session["cabLat"] + "');", true);
                    }
                }
                else
                {
                    lblRes.Text = "Not able to get bear by cabs";
                }
            

        }

        protected string GetMarkers()
        {
            Single clat = Convert.ToSingle(Session["CurrentLat"].ToString());
            Single clong = Convert.ToSingle(Session["CurrentLong"].ToString());
            string type = Session["Type"].ToString();
            string icon;
            string markers = "";

            if (type == "Truck")
            {
                icon = "icon:'Images/truckt.png',";
            }
            else
            {
                icon = "icon:'Images/cabs.png',";
            }

            markers += "var marker1 = " + @"new google.maps.Marker({position: new google.maps.LatLng(" + clat + "," + clong + ")," + @"icon: 'Images/u1.png'," + @"map: myMap,title:' Current Location '});";

             

            using (SqlConnection con = new
            SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConString"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT Type, Name,  Lattitude, Longitude, City FROM EcsCabDetails where Type = '" + type +"' and Status = 'Active' and Available = 'y'", con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();                

                int i = 1;                
                while (reader.Read())
                {
                    
                    i++;

                    markers +=
                    @"var marker" + i.ToString() + @" = new google.maps.Marker({
              position: new google.maps.LatLng(" + reader["Lattitude"].ToString() + ", " +
                    reader["Longitude"].ToString() + ")," +
                     @icon +
                    @"map: myMap,                   
                   
              title:' Type:" + reader["Type"].ToString() + " |Name: " + reader["Name"].ToString()  + " |City: " + reader["City"].ToString() + "'});";
                }
            }


            return markers;
        }

        protected void btnGetDirection_Click(object sender, EventArgs e)
        {
            Single clat = Convert.ToSingle(Session["CurrentLat"].ToString());
            Single clong = Convert.ToSingle(Session["CurrentLong"].ToString());

            // Get selected cab id
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConString"].ConnectionString);

            string query = "SELECT ID,DriverId,EE.FirstName, EE.LastName FROM (SELECT NL.CabId AS ID,NL.DriverId, NL.Name,NL.Rental, (ABS(NL.Lattitude - " + clat + ") + ABS(NL.Longitude - " + clong + ")) / 2 AS Distance FROM EcsCabDetails AS NL WHERE (NL.Lattitude IS NOT NULL) AND (NL.Longitude IS NOT NULL) AND Available = 'y' AND Status = 'Active' AND type = '" + Session["Type"].ToString() + "') AS D1  INNER JOIN dbo.EcsEmployee EE ON  D1.DriverId = EE.EmpId WHERE D1.Distance < 25 ORDER BY Distance";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                Session["SelectedCabId"] = (reader["ID"]).ToString();
                Session["DriverId"] = (reader["DriverId"]).ToString();
                Session["DriverName"] = (reader["FirstName"]).ToString() + " "+(reader["LastName"]).ToString();
                // ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Selected cab Id: " + Session["SelectedCabId"].ToString()+"');", true);
                con.Close();

                // Get direction from source to destination
                Response.Redirect("GetUserDirections.aspx");
            }
            else
            {
                lblRes.Text = "Not able to get near by cabs ..";
            }
                          

        }
    }
}