<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DriverLogIn.aspx.cs" Inherits="EsteemCabService.DriverLogIn" %>

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
		        <li><a href="../EcsMain.aspx">Home</a></li>                
		        <li><a href="DriverLogIn.aspx">Driver</a></li>
		        <li><a href="../Customer/CustomerLogIn.aspx">Customer</a></li>
                <li><a href="BeADriver.aspx">Want to drive?</a></li>		
		        <li><a href="../AboutUs.aspx">About Us</a></li>
		        <li><a href="../ContactUs.aspx">Contact Us</a></li>
            </ul>            
       </div>
       
      <div id="leftcolumn"> &nbsp;
            <h3>Driver Login</h3>
       <form id="form1" runat="server">
            <p>
                <asp:Login ID = "Login1" runat = "server" OnAuthenticate= "ValidateUser" 
                TitleTextStyle-Wrap="False" LabelStyle-Wrap="False" TextBoxStyle-Width="100px"></asp:Login>
            </p>      
            <p>
                <asp:Button ID="btnSignup"  runat="server" Text="Sign up" OnClick="btnSignup_Click" 
                style="font-family: Verdana; font-size: small; font-style: normal; width: 150px;height: 25px" />
            </p>
        </form>
       
                <h3>News and Events</h3>
     <div class="news">
           <h4>Feb.1923.</h4>
               <p><b>Founded in 1923, Esteem Cab is one of the oldest cab companies in Long beach ...  </p>
            <a href="AboutUsD.Aspx">read more</a>
           <h4>Aug.1950.</h4>
               <p><b>In the 1950′s, Esteem Cab installed two-way radios ...  </p>
                 <a href="AboutUsD.Aspx">read more</a>
           <h4>Mar.2015.</h4>
               <p><b>Today Esteem Cab ...  </p>
            <a href="AboutUsD.Aspx">read more</a>
      </div>
   
              </div>   
        </div>        
       
       
       <div id="rightcolumn">

           
           <asp:Image ID="imgStartRide" runat="server" ImageUrl="Images/DriverLogin.jpeg" Width="500" Height="480" />
        
       </div>
</div>
</body>
</html>

