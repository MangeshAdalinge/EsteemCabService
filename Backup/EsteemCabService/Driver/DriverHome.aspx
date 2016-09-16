<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DriverHome.aspx.cs" Inherits="EsteemCabService.Driver.DriverHome" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
                <li><a href="DriverPersonalDetails.aspx">PersonalDetails</a></li>		
		        <li><a href="CabDetails.aspx">Cab Details</a></li>	
                <li><a href="AboutUsD.aspx">About us</a></li>
                <li><a href="ContactUsD.aspx">Contact us</a></li>                
		        <li><a href="../EcsMain.aspx">Log Out</a></li>	        
            </ul>           
       </div>
       <form id="form1" runat="server">
       <div id ="leftcolumn">
        <asp:Image ID="imgStartRide" runat="server" ImageUrl="Images/StartRide.jpeg" Width="750px" Height="400" />
       <%-- <asp:Image ID="Image1" runat="server" ImageUrl="Images/StartRide.jpeg" Width="750px" Height="400" />--%>
       <table>
           <tr>
                <td>               
                <asp:button Id = "btnStartRide" runat="server" text = "Start Ride"  OnClick="BookingProcess" 
                style=" width: 200px; font-family: Verdana; font-size: medium; font-style: normal; 
                    text-transform: uppercase; font-weight: bolder"  />            
                </td>
                <td>
                        <asp:Label id="lblres" runat="server"></asp:Label>
                </td>
           </tr>  
           <tr>
                <td>
                       <asp:button Id = "btnFinishRide" runat="server" text = "Finish Ride" 
                 OnClick="FinishRideClick" style=" width: 200px; font-family: 
                    Verdana; font-size: medium; font-style: normal; text-transform: uppercase; font-weight: bolder"  />  
                    <asp:Label id="lblRes1" runat="server"></asp:Label>
                </td>           
           </tr> 
         </table>
       </div>
    </form>
    </div>
</body>
</html>
