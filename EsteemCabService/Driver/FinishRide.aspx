<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FinishRide.aspx.cs" Inherits="EsteemCabService.Driver.FinishRide" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Eseem Cab Services</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="../Styles/style.css" />
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
                <li><a href="DriverRideStatus.aspx">Home</a></li>
                <li><a href="DriverPersonalDetails.aspx">Update Profile</a></li>
                <li><a href="CabDetails.aspx">Update Cab</a></li>
                <li><a href="AboutUsD.aspx">About Us</a></li>
                <li><a href="ContactUsD.aspx">Contact Us</a></li>
                <li><a href="../EcsMain.aspx">Log out</a></li>
            </ul>
        </div>
        <form id="form1" runat="server">
        <div id="leftcolumn">
            &nbsp;
            <asp:Image ID="imgStartRide" runat="server" ImageUrl="Images/FinishRide.jpeg" Width="750px"
                Height="400" />

            <table>
                <tr>
                    <td>
                        <asp:Button ID="btnFinishRide" runat="server" Text="Finish Ride" Style="font-family: Verdana;
                    font-size: small; font-style: normal; width: 150px; height: 25px" />
                    <asp:Label id="lblRes1" runat="server"></asp:Label>                        
                    </td>
                </tr>

            </table>
            
            <p>
                
            </p>

        </div>
        </form>
    </div>
</body>
</html>
