<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BeADriver.aspx.cs" Inherits="EsteemCabService.BeADriver" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml"> 
<head id="Head1" runat="server">
     <title>Eseem Cab Services</title>
  <meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="../Styles/style.css"/>
</head>
<body>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=places""></script>
   <script type="text/javascript">

       var long = 0;
       var lat = 0;
       //var mapOptions;
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
           city = position.coords.locality;
           LatLng = new google.maps.LatLng(lat, long);
           mapOptions = {
               center: LatLng,
               zoom: 12,
               mapTypeId: google.maps.MapTypeId.ROADMAP
           };

           var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
           var marker = new google.maps.Marker({
               position: LatLng,
               title: "<div style = 'height:60px;width:200px'><b>Your location:</b><br />Latitude: "
                            + lat + +"<br />Longitude: " + long
           });

           marker.setMap(map);
           var getInfoWindow = new google.maps.InfoWindow({ content: "<b>Your Current Location</b><br/> Latitude:" +
                                    lat + "<br /> Longitude:" + long + ""
           });
           getInfoWindow.open(map, marker);

       }



       //           window.onload = function () {
       //               

       //               var mapOptions = {
       //                   center: new google.maps.LatLng(lat, long),
       //                   zoom: 14,
       //                   mapTypeId: google.maps.MapTypeId.ROADMAP
       //               };

       //           var infoWindow = new google.maps.InfoWindow();
       //           var latlngbounds = new google.maps.LatLngBounds();
       //           var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
       //           google.maps.event.addListener(map, 'click', function (e) {
       //               long = e.latLng.lng();
       //               lat = e.latLng.lat();
       //               
       //               document.getElementById("lat").value = lat;
       //               document.getElementById("lng").value = long;

       //               alert("Latitude: " + lat + "\r\nLongitude: " + long);
       //           });
       //       }
  
   </script>
           
    <div id="wrapper" >
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
		        <li><a href="DriverLogIn.aspx">Log In</a></li>
                <li><a href=""></a></li>
                <li><a href=""></a></li>
                <li><a href=""></a></li>
                <li><a href=""></a></li>
            </ul>            
       </div>

       
          <h1> Want to Drive Esteem Cab? </h1> 
          <br />
          <br />
      

       <form id="form1" runat="server">
      
    
     <div id="dvMap" style="width: 0px; height: 0px">
        </div>
   <asp:HiddenField ID="lat" runat="server" />
   <asp:HiddenField ID="lng" runat="server" />
  <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <th colspan="3" 
                style="font-family: Verdana; font-size: medium; text-decoration: underline; font-weight: bold; font-style: normal" 
                align="left">
                Registration Form
            </th>
        </tr>
        <br />    
    </table>
   <table  cellpadding="0" cellspacing="0" border="1" rules="none" frame="box">
        <tr>
            <th colspan="3" style="font-family: Verdana; font-size: medium; text-decoration: underline; font-weight: bold; font-style: normal" align="left">
                Cab Details
            </th>
        </tr>
        <tr>
                <td>
                    <br />
                    <br />
                </td>
         </tr>
        <tr>
            <td colspan="3">
                Cab Type
            </td>
            <td colspan="2">
                <asp:DropDownList ID="ddlCabType" runat="server">
                <asp:ListItem Text="Select Type" Value="Select Type" />
                   <asp:ListItem Text="Truck" Value="Truck" />
                   <asp:ListItem Text="Cab" Value="Cab" />               
              </asp:DropDownList>
            
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ErrorMessage="Required" ForeColor="Red" ControlToValidate="ddlCabType"
                    runat="server" />
            </td>    
            <td colspan="3">
                Cab Name
            </td>
            <td colspan="2">
                <asp:textbox id ="txtName"  runat="server"  width= "200px" BorderColor="Black" BorderStyle="Solid"   ></asp:TextBox> 
            </td>
            <td colspan="2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtName"
                    runat="server" />
            </td>
        </tr>
        <br />
        <br />
        <tr>
            <td colspan="3">
                Color 
            </td>
            <td colspan="3">
              <asp:textbox id ="txtColour"  runat="server"  style="text-indent: 4em;" BorderColor="Black"  BorderStyle="Solid"   ></asp:TextBox>       
            </td>
        
            <td colspan="3">
                Rental 
            </td>
            <td colspan="3">
              <asp:textbox id ="txtRental"  runat="server" BorderColor="Black" BorderStyle="Solid"   ></asp:TextBox>    
               <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="txtMobileNo" ErrorMessage="RegularExpressionValidator"   ValidationExpression="([0-9])[0-9]*[.]?[0-9]*"></asp:RegularExpressionValidator> 
            </td>
        </tr>
        <br />    
        <tr>
            <td colspan="2">
                City
            </td>
            <td colspan="4">
               <asp:textbox id ="txtCity"  runat="server" BorderColor="Black"  BorderStyle="Solid"   ></asp:TextBox>    
            </td>
            <td>
           
            </td>
            <td colspan="2">
                State
            </td>
             <td colspan="">
                <asp:textbox id ="txtState"  runat="server" BorderColor="Black" BorderStyle="Solid"   ></asp:TextBox>       
            </td>
            <td>              
            </td>
        </tr>
        <br />    
        <tr>
            <td colspan="2">
                Country
            </td>
            <td colspan="4">
               <asp:textbox id ="txtCountry"  runat="server" BorderColor="Black" BorderStyle="Solid"   ></asp:TextBox>
            </td>
            <td>
           
            </td>
            <td colspan="2">
                Number Plate
            </td>
             <td colspan="">
                <asp:textbox id ="txtNumberPlate"  runat="server" BorderColor="Black" BorderStyle="Solid"   ></asp:TextBox>       
            </td>
            <td>              
            </td>
        </tr>    
    
        <tr>
            <td>
               <%-- <asp:Button ID="btnSaveDriverDetails"  runat="server" Text="Save Driver Details" OnClick="btnSaveDriverDetails_Click" 
                 style="font-family: Verdana; font-size: medium; font-style: normal; text-transform: uppercase; font-weight: bolder" />
                <br />
                <br />--%>
               <asp:Label ID="lblRes" runat="server" Text=""></asp:Label>
        </td>
     </tr>
    </table>


           <table  cellpadding="0" cellspacing="0" border="1" rules="none" frame="box">
        <tr>
            <th colspan="3" style="font-family: Verdana; font-size: medium; text-decoration: underline; font-weight: bold; font-style: normal" align="left">
                Registration Data
            </th>
        </tr>
        <tr>
                <td>
                    <br />
                    <br />
                </td>
         </tr>
        <tr>
            <td colspan="3">
                First Name
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtFName" runat="server" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtFName"
                    runat="server" />
            </td>    
            <td colspan="3">
                Last Name
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtLName" runat="server"  />
            </td>
            <td colspan="2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtLName"
                    runat="server" />
            </td>
        </tr>
        <br />
        <br />
        <tr>
            <td colspan="3">
                Address
            </td>
            <td colspan="3">
                <asp:TextBox ID="txtAddress"  MaxLength = "500" runat="server" TextMode="MultiLine" />
            </td>
        
        </tr>
        <br />    
        <tr>
            <td colspan="2">
                Email
            </td>
            <td colspan="4">
                <asp:TextBox ID="txtEmail" MaxLength = "20" runat="server" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ErrorMessage="Required" Display="Dynamic" ForeColor="Red"
                    ControlToValidate="txtEmail" runat="server" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Invalid email address." />
            </td>
            <td colspan="2">
                Mobile Number
            </td>
             <td colspan="">
                <asp:TextBox ID="txtMobileNo"  MaxLength = "10" runat="server"  />
            </td>
            <td>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtMobileNo" ErrorMessage="RegularExpressionValidator"   ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
            </td>
        </tr>   
        <tr>
         <td colspan="2">
                Driving License
            </td>
         <td colspan="">
                <asp:TextBox ID="txtDlNo"  MaxLength = "20" runat="server"  />
            </td>
            <td>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ErrorMessage="Required" Display="Dynamic" ForeColor="Red"
                    ControlToValidate="txtDlNo" runat="server" />
            </td>
        </tr> 
    
    </table> 
    <br />
    <br />
            
    <table  cellpadding="0" cellspacing="0" border="1" rules="none" frame="box">
        <tr >
            <th colspan="3" style="font-family: Verdana; font-size: medium; text-decoration: underline; font-weight: bold; font-style: normal" align="left">
                Authorization Data
            </th>        
        </tr>
        <tr>
                <td>
                    <br />
                    <br />
                </td>
         </tr>
        <tr>
            <td colspan="3">
                Username
            </td>
            <td colspan="3">
                <asp:TextBox ID="txtUsername" runat="server" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtUsername"
                    runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                Password
            </td>
            <td colspan="3">
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtPassword"
                    runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                Confirm Password
            </td>
            <td colspan="3">
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" />
            </td>
            <td>
                <asp:CompareValidator ID="CompareValidator1" ErrorMessage="Passwords do not match." ForeColor="Red" ControlToCompare="txtPassword"
                    ControlToValidate="txtConfirmPassword" runat="server" />
            </td>
        </tr>    
    </table>
    <table>
    <tr>
                <td>
                    <br />
                    <br />
                </td>
         </tr>    
    <tr>
        <td>
                <asp:Button ID="BtnRegister" Text="Submit" runat="server"    OnClick="RegisterUser" style="height: 26px" />
                <br />
                <br />
                <asp:Label ID="lblRes1" runat="server" />
        </td>
     </tr>
    </table>

    </form>
   </div>  
  
</body>
</html>