<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="EsteemCabService.UserHome" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
     <title>Eseem Cab Services</title>
          <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="../Styles/style.css"/>  
        <script type="text/javascript"  src="http://maps.googleapis.com/maps/api/js?sensor=false">
        </script>     
</head>
<body>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=places""></script>
     <script type="text/javascript">

         var long = 0;
         var lat = 0;         
         var LatLng;
         var city;
         if (navigator.geolocation) {
             navigator.geolocation.getCurrentPosition(success);
         } else {
             alert("There is Some Problem on your current browser to get Geo Location!");
         }

         function success(position) {
             lat = position.coords.latitude;
             long = position.coords.longitude;
             document.getElementById("lat").value = lat;
             document.getElementById("lng").value = long;
//             Session["lat"] = lat;
//             Session["long"] = long;
             city = position.coords.locality;
             LatLng = new google.maps.LatLng(lat, long);
             mapOptions = {
                 center: LatLng,
                 zoom: 12,
                 panControl: true, zoomControl: false, mapTypeControl: false, scaleControl: false, streetViewControl: false, overviewMapControl: false, rotateControl: false, 
                 mapTypeId: google.maps.MapTypeId.ROADMAP
             };

             var map = new google.maps.Map(document.getElementById("dvMap1"), mapOptions);
             var marker = new google.maps.Marker({
                 position: LatLng,
                 icon: 'u1.png',

                 title: "<div style = 'height:60px;width:200px'><b>Your location:</b><br />Latitude: "
                            + lat + +"<br />Longitude: " + long
             });

             marker.setMap(map);
             var getInfoWindow = new google.maps.InfoWindow({ content: "<b>Your Current Location</b>"
             });
             getInfoWindow.open(map, marker);

         }      
  
   </script>
    
     
    <div id="wrapper">
        <div id="header">
            <div class="logo">
                <image src="../Images/TruckIcon.jpg" width="70" height="70" />
            </div>
            <div class="site-head">
                <p>
                    Esteem Cab Services</p>
                <p>
                    Distance made shorter</p>
            </div>
        </div>
           
        <div id="navbar">   
	        <ul>
		        <li><a href="RideStatus.aspx">Home</a></li>                
                <li><a href="UpdatePersonalDetails.aspx">Update Profile</a></li>
		        <li><a href="UserHome.aspx">New Ride</a></li>
                <li><a href="AboutUsC.aspx">About us</a></li>
                <li><a href="ContactUsC.aspx">Contact us</a></li>                
                <li><a href="../EcsMain.aspx">Log out</a></li>
		        
            </ul>
        </div>
        <div id ="leftcolumn">       
        <form id="form2" runat="server"> 
        
       <table> 
        <tr>
            <td >
                <h1>
                    Your Current Location is:
                </h1>                
            </td>
       </tr>
    
    <tr>
        <td>   
            <div id="dvMap1" style="width: 800px; height: 300px">            
            </div>
            <asp:HiddenField ID="lat" runat="server" />
            <asp:HiddenField ID="lng" runat="server" />
            
        </td>
      </tr>
      <tr>
        <td>
           <asp:Label ID="lblCabType" runat="server" Text="Cab Type: " style="font-family: Verdana; font-size: medium; font-style: normal; text-transform: uppercase; font-weight: bolder" ></asp:Label>  
        
              <asp:DropDownList ID="ddlType" runat="server" Width = "150px">  
              <asp:ListItem Text="Select Type" Value="Select Type" />
               <asp:ListItem Text="Truck" Value="Truck" />
               <asp:ListItem Text="Cab" Value="Cab" />               
              </asp:DropDownList>
             
          </td>
      </tr>
        <tr>
          <td>
             <asp:Button ID="btnGetCabs"  runat="server" Text="Get Near By Cabs" OnClick="btnGetCabs_Click" 
             style="font-family: Verdana; font-size: medium; font-style: normal; text-transform: uppercase; font-weight: bolder" />
             <br />            
          </td>
      </tr>
      <br />
      <br />
      </table>
      </form>
      </div>
   </div>
   
</body>
</html>
