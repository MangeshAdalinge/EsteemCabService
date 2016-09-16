<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StartRide.aspx.cs" Inherits="EsteemCabService.Driver.StartRide" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head" runat="server"> 
<title>Eseem Cab Services</title>    
  <meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="../Styles/style.css"/>
</head>

<body>
    
    <div id="wrapper">
        <div id="header">
          <div class="logo"> 
               <image src="../Images/TruckIcon.jpg" width="70" height="70" /> 
           </div>
          <div class="site-head">
                <p>Esteem Cab Services</p>
                <p>Distance made shorter</p>   
          </div> 
      </div>
        <div id="navbar">
	        <ul>		                     
		        <li><a href="DriverRideStatus.aspx">Home</a></li>
                <li><a href="FinishRide.aspx">Complete Ride</a></li>                
		        <li><a href="DriverPersonalDetails.aspx">Update Profile</a></li>
                <li><a href=""></a></li>
		        <li><a href="ContactUsD.aspx">Contact Us</a></li>
                <li><a href="DriverLogIn.aspx">Log out</a></li>
            </ul>
            
       </div>
       <form id="form1" runat="server">       
       <div ="leftcolumn">   
   
   <table>
     <tr>    
        <td >
        <asp:label ID="lblNC" runat="server" text = "Your Directions" style="font-family: Verdana; font-size: medium; font-style: normal; text-transform: uppercase; font-weight: bolder" ></asp:label>    
        </td>
    </tr>
    <br />
    <br />
    <tr>    
        <td>   
        <asp:Textbox ID="txtSource" runat="server" width = "400px" ></asp:Textbox>        
        </td>
    </tr>
    <tr>    
        <td>          
        <asp:Textbox ID="txtDestination" runat="server" width = "400px"></asp:Textbox>   
        </td>
    </tr>
     <tr>    
        <td>  
         <%--<asp:button ID = "btnRoute" runat ="server" Text ="Get Route" OnClientClick="GetRoute()" />--%>
         <input id = "btnGetRoute" type="button" value="Get Route" onclick="GetRoute()" />
                  </td>
    </tr>
   
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript">
        
    </script>
    
   
    
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
<script type="text/javascript">
    window.onload = function () {
        document.getElementById("dvPanel").style.display = 'none';
        //document.getElementById("btnGetRoute").style.display = 'none';
        document.getElementById("btnStartRide").style.display = 'none';


    };


    function GetAddress() {

        var lat = '<%= Session["DrLattitude"] %>';
        var lng = '<%= Session["DrLongitude"] %>';
        var latlng = new google.maps.LatLng(lat, lng);
        var geocoder = geocoder = new google.maps.Geocoder();
        geocoder.geocode({ 'latLng': latlng }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                if (results[1]) {
                    document.getElementById("txtSource").value = results[1].formatted_address;
                    document.getElementById("btnGetRoute").style.display = 'block';
                }
            }
        });
    }
    function alertMessage() {
        alert('Ride is already Started .... ');
    }
    var source, destination;
    var directionsDisplay;
    var directionsService = new google.maps.DirectionsService();
    google.maps.event.addDomListener(window, 'load', function () {
        new google.maps.places.SearchBox(document.getElementById('txtSource'));
        new google.maps.places.SearchBox(document.getElementById('txtDestination'));
        directionsDisplay = new google.maps.DirectionsRenderer({ 'draggable': true });
    });

    function GetRoute() {
        document.getElementById("btnStartRide").style.display = 'block';
        var LatLng = new google.maps.LatLng('<%= Session["CurrentLat"] %>', '<%= Session["CurrentLong"] %>');
        var mapOptions = {
            zoom: 7,
            mapTypeControl: false,
            center: LatLng
        };
        map = new google.maps.Map(document.getElementById('dvMap'), mapOptions);
        directionsDisplay.setMap(map);
        directionsDisplay.setPanel(document.getElementById('dvPanel'));

        //*********DIRECTIONS AND ROUTE**********************//
        source = document.getElementById("txtSource").value;
        destination = document.getElementById("txtDestination").value;

        document.getElementById("dvPanel").style.display = 'block';

        var request = {
            origin: source,
            destination: destination,
            travelMode: google.maps.TravelMode.DRIVING
        };
        directionsService.route(request, function (response, status) {
            if (status == google.maps.DirectionsStatus.OK) {
                directionsDisplay.setDirections(response);
            }
        });

        //*********DISTANCE AND DURATION**********************//
        var service = new google.maps.DistanceMatrixService();
        service.getDistanceMatrix({
            origins: [source],
            destinations: [destination],
            travelMode: google.maps.TravelMode.DRIVING,
            unitSystem: google.maps.UnitSystem.METRIC,
            avoidHighways: false,
            avoidTolls: false
        }, function (response, status) {
            if (status == google.maps.DistanceMatrixStatus.OK && response.rows[0].elements[0].status != "ZERO_RESULTS") {
                var distance = response.rows[0].elements[0].distance.text;
                var duration = response.rows[0].elements[0].duration.text;
                var dvDistance = document.getElementById("dvDistance");
                dvDistance.innerHTML = "";
                dvDistance.innerHTML += "Distance: " + distance + "<br />";
                dvDistance.innerHTML += "Duration:" + duration;
                document.getElementById("Distance").value = distance;
                document.getElementById("Duration").value = duration;
                

            } else {
                alert("Unable to find the distance via road.");
            }
        });
    }
</script>

    <tr>
        <td colspan="2">
            <div id="dvDistance">
            </div>
        </td>
    </tr>
    <tr>
    <td>
        <div id="dvMap" style="width: 400px; height: 300px">
        </div>
    </td>
    <td>
        <div id="dvPanel" style="width: 300px; height: 300px; color: navy; background-color: Gray; border: 2px solid Maroon; padding: 5px";>
        </div>
    </td>
    </tr>
    <tr>
        <td>
            <asp:button Id = "btnStartRide" runat="server" text = "Start Ride"   OnClick="BookingProcess" style=" width: 200px; font-family: Verdana; font-size: medium; font-style: normal; font-weight: bolder"  />
        </td>
        <td>
            <asp:Label ID ="lblRes" runat="server"></asp:Label>
        </td>
    </tr>
     <tr>
        <%--<td>
            <asp:button Id = "btnFinishRide" runat="server" text = "Finish Ride"   OnClick="FinishRideClick" style=" width: 200px; font-family: Verdana; font-size: medium; font-style: normal;  font-weight: bolder"  Visible="False" />
        </td>--%>
        <td>
            <asp:Label ID ="lblRes1" runat="server"></asp:Label>
        </td>
    </tr>
    </table> 
    <asp:HiddenField ID="Distance" runat="server" />
    <asp:HiddenField ID="Duration" runat="server" />           
    </div>
    </form>
    </div>
</body>
</html>
