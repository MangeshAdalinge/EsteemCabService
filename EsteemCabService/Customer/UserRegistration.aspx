<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="EsteemCabService.UserRegistration" %>

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
		        <li><a href="CustomerLogIn.aspx">Log In</a></li>
                <li><a href=""></a></li>
                <li><a href=""></a></li>
                <li><a href=""></a></li>
                <li><a href=""></a></li>

            </ul>
        </div>
        <form id="form2" runat="server">
               <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <th colspan="3" 
                    style="font-family: Verdana; font-size: medium; text-decoration: underline; font-weight: bold; font-style: normal" 
                    align="left">
                    Registration Form
                </th>
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
                    <asp:TextBox ID="txtFirstname" MaxLength = "20" runat="server" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtFirstname"
                        runat="server" />
                </td>    
                <td colspan="3">
                    Last Name
                </td>
                <td colspan="3">
                    <asp:TextBox ID="txtLastName"  MaxLength = "20" runat="server"  />
                </td>
                <td colspan="2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtLastname"
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
                <td colspan="3">
                    Email
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtEmail" MaxLength = "20" runat="server" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ErrorMessage="Required" Display="Dynamic" ForeColor="Red"
                        ControlToValidate="txtEmail" runat="server" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Invalid email address." />
                </td>
                <td colspan="3">
                    Mobile Number
                </td>
                 <td colspan="3">
                    <asp:TextBox ID="txtMob" runat="server"  />
                </td>
                <td>
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtMob" ErrorMessage="10 Digit Mobile No"   ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                </td>
            </tr>    
        <br />    
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtUsername"
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtPassword"
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
        <br />
        <br />
        <table  cellpadding="0" cellspacing="0" border="1" rules="none" frame="box">
            <tr >
                <th colspan="3" style="font-family: Verdana; font-size: medium; text-decoration: underline; font-weight: bold; font-style: normal" align="left">
                    Card Details
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
                        Name on the Card 
                </td>
                <td colspan="3">
                    <asp:TextBox ID="txtCardHoldername" runat="server" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtUsername"
                        runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    Card Number
                </td>
                <td colspan="3">
                    <asp:TextBox ID="txtCardNumber" runat="server"  />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtCardNumber"
                        runat="server" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" 
                        ControlToValidate="txtCardNumber" ErrorMessage="16 Digit Card No"   ValidationExpression="[0-9]{16}"></asp:RegularExpressionValidator>

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
                    <asp:Label ID="lblRes" runat="server" />
            </td>
         </tr>
        </table>
     </form>
   </div>
</body>
</html>