<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GetUserDirections.aspx.cs" Inherits="EsteemCabService.Customer.GetUserDirections" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head" runat="server">
     <title>Eseem Cab Services</title>
          <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="../Styles/style.css"/>  
        <script type="text/javascript"  src="http://maps.googleapis.com/maps/api/js?sensor=false">
        </script>   
</head>
<body>    
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
                <li><a href=""></a></li>		
		        <li><a href=""></a></li>
		        <li><a href=""></a></li>
                <li><a href="../EcsMain.aspx">Log out</a></li>
          </ul>
       </div>
   
       <div id="leftcolumn">
       <form id="form1" runat="server">      
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
                    <h1>Source Location:</h1>
                <%--</td>    
                <td>   --%>
                <asp:Textbox ID="txtSource" runat="server" width = "400px" ></asp:Textbox>        
                </td>
            </tr>
            <tr> 
                <td>
                     <h1>Destination Location:</h1>
                <%--</td>   
                <td>--%>                          
                <asp:Textbox ID="txtDestination" runat="server" width = "400px"></asp:Textbox>   
                </td>
            </tr>
             <tr>    
                <td>  
                 <input id = "btnGetRoute" type="button" value="Get Route" onclick="GetRoute()" />
                          </td>
            </tr>
   
            <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script type="text/javascript">
    function GetAddress() {
        
            var lat = '<%= Session["CurrentLat"] %>';
            var lng = '<%= Session["CurrentLong"] %>';           
            var latlng = new google.maps.LatLng(lat, lng);
            var geocoder = geocoder = new google.maps.Geocoder();
            geocoder.geocode({ 'latLng': latlng }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    if (results[1]) {
                       document.getElementById("txtSource").value = results[1].formatted_address;
                    }
                }
            });
        }
    </script>
    
   
    
        <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
     
<script type="text/javascript">
    window.onload = function () {
        document.getElementById("dvPanel").style.display = 'none';
        
        
    };
    var source, destination;
    var directionsDisplay;
    var directionsService = new google.maps.DirectionsService();
    google.maps.event.addDomListener(window, 'load', function () {
        new google.maps.places.SearchBox(document.getElementById('txtSource'));
        new google.maps.places.SearchBox(document.getElementById('txtDestination'));
        directionsDisplay = new google.maps.DirectionsRenderer({ 'draggable': true });
    });

    function GetRoute() {
        
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
            <%--<div>--%>
            <tr>
            <td>
                <div id="dvMap" style="width: 400px; height: 430px">
                </div>
            </td>
            
            <td >
                <div  id="dvPanel"  style="width: 400px; height: 400px; color: navy; background-color: Gray; border: 2px solid Maroon; padding: 5px";>
                </div>            
            </td>
            
            </tr>
            <%--</div> --%>
            <tr>
                <td>
                    <asp:button Id = "btnBookingProcess" runat="server" text = "Go for Booking"  OnClick="BookingProcess" style=" width: 200px; font-family: Verdana; font-size: medium; font-style: normal; text-transform: uppercase; font-weight: bolder"  />
                </td>
            </tr>
            </table>
     
            <asp:HiddenField ID="Distance" runat="server" />
            <asp:HiddenField ID="Duration" runat="server" />    
            
            </form>          
         </div>       
    </div>
</body>
</html>