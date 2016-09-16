<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookACab.aspx.cs"  Inherits="EsteemCabService.Customer.BookACab" %>

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
		        <li><a href=""></a></li>
		        <li><a href=""></a></li>
                <li><a href="../EcsMain.aspx">Log out</a></li>
          </ul>
       </div>
       <div id ="leftcolumn"> 
       <form id="form1" runat="server"> 
           
           <br />           

               <table>
               <tr>
                    <td colspan="2">
                         <h1  Width="100">Customer: </h1>
                    </td>
                    <td colspan="0">
                         <asp:Label ID="lblFirstName" runat="server"></asp:Label>
                    </td>
                    <td>
                        <%-- <asp:Label ID="lblLastName" runat="server"  Width="100" ></asp:Label>--%>
                    </td>
                </tr>
                <br />
    
               <tr>
                    <td colspan="2">
                    <h1  Width="100">Cab Type: </h1>                        
                    </td>
                    <td>
                         <asp:Label ID="lblCabType" runat="server"  Width="100" ></asp:Label>
                    </td>
                </tr>
                <br />
                <tr>
                    <td colspan="2">
                    <h1  Width="100">Driver: </h1>  
                         
                    </td>
                    <td>
                         <asp:Label ID="lblDriverName" runat="server"  Width="100" ></asp:Label>
                    </td>
                </tr>
                <br />
                <tr>
                    <td colspan="2">
                         <h1  Width="100">Rental/KM: </h1>
                    </td>
                    <td>
                         <asp:Label ID="lblRental" runat="server"  Width="100" ></asp:Label>
                    </td>
                </tr>
                <br />
                <tr>
                    <td colspan="2">
                         <h1  Width="100">Total cost: </h1>
                    </td>
                    <td>
                         <asp:Label ID="lblCostOfRide" runat="server"  Width="100" ></asp:Label>
                    </td>
                </tr>
                <br />
                 <tr>
                    <td colspan="2">
           
                    </td>
                    <td>
           
                    </td>
                </tr>
                <br />
                <br />
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
                 <tr>
                 <td colspan="2"></td>
                    <td colspan="2">
                         <asp:Button ID="btnBook" runat="server" Text="Book" width="150px" Height="25px" OnClick="BookACab_Click"></asp:Button>
                         <asp:Label ID="LblRes" runat="server" ></asp:Label>
                    </td>
       
                </tr>
                </table> 
                </form>     
            </div>
        
    </div>
    

</body>
</html>