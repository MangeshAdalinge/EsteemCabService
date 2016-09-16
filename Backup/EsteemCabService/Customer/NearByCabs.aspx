<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NearByCabs.aspx.cs" Inherits="EsteemCabService.NearByCabs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
     <title>Eseem Cab Services</title>
          <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="../Styles/style.css"/>  
        <script type="text/javascript"  src="http://maps.googleapis.com/maps/api/js?sensor=false">
        </script>   
</head>
    <body onload="initialize()">
     
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
		    <li><a href="AboutUsC.aspx">About Us</a></li>
		    <li><a href="ContactUsC.aspx">Contact Us</a></li>
            <li><a href="../EcsMain.aspx">Log out</a></li>
      </ul>
   </div>  
    
    
    <form id="form1" runat="server">      
        <div id ="leftcolumn">            
     
            <table>
             <tr>    
                <td >
                <asp:label ID="lblNC" runat="server" text = "Near By cabs" style="font-family: Verdana; font-size: medium; font-style: normal; text-transform: uppercase; font-weight: bolder" ></asp:label>    
                </td>
            </tr>
            <br />
            <br />
            <tr>    
                <td>   
                <asp:Textbox ID="Textbox1" runat="server" style="display:none"></asp:Textbox>        
                </td>
            </tr>
            <tr>    
                <td>          
                <asp:Textbox ID="Textbox2" runat="server" style="display:none"></asp:Textbox>   
                </td>
            </tr>
            <tr>    
                <td>
                    <div id="mapArea" style="width: 700px; height: 300px; ">   
                        </div>
                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>  
                    </td>
            </tr>
             <tr>    
                <td>   
            
                </td>
            </tr>

             <tr>  
                <td>
                 </td>
              </tr>  
              <tr>
                <td>   
        
            
                </td>
            </tr>

             <tr>    
                <td>   
                     <asp:button ID="btnGetDirection" runat="server" Text = "Get Direction" 
                 
                         style="font-family: Verdana; font-size: medium; font-style: normal; text-transform: uppercase; font-weight: bolder" 
                         BorderStyle="Solid" onclick="btnGetDirection_Click" ></asp:button>      
                </td>
                <td>
                    <asp:Label ID = "lblRes" runat="server"></asp:Label>
                </td>
            </tr>


            </table>  
            <asp:HiddenField ID="cabLat" runat="server" />
            <asp:HiddenField ID="cabLng" runat="server" />  
            </div>
        </form> 
    </div>


   
</body>
</html>
