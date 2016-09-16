<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="EsteemCabService.Admin.AdminHome" %>

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
                <li><a href="AdminDetails.aspx">Update Profile</a></li>
                <li><a href="EditDriverDetails.aspx">Driver</a></li> 
                <li><a href="ActivateDriver.aspx">Activate</a></li>
                <li><a href="EditCustomerDetails.aspx">Customer</a></li>
                <li><a href="InvoiceReport.aspx">Invoice Report</a></li>
		        <li><a href="AdminLogIn.aspx">Log out</a></li>
            </ul>            
       </div>    
       <div id="leftcolumn"> &nbsp;
            <h3>Admin Activities</h3>
            <form id="form1" runat="server">
                     
            </form>
            
               <h3>News and Events</h3>
     <div class="news">
           <h4>Feb.1923.</h4>
               <p><b>Founded in 1923, Esteem Cab is one of the oldest cab companies in Long beach ...  </p>
            <a href="../AboutUs.Aspx">read more</a>
           <h4>Aug.1950.</h4>
               <p><b>In the 1950′s, Esteem Cab installed two-way radios ...  </p>
                 <a href="../AboutUs.Aspx">read more</a>
           <h4>Mar.2015.</h4>
               <p><b>Today Esteem Cab ...  </p>
            <a href="../AboutUs.Aspx">read more</a>
      </div>
   
        </div>

         <div id="rightcolumn">
           <asp:Image ID="imgStartRide" runat="server" ImageUrl="Images/AdminWork.jpeg" Width="520" Height="520" />        
       </div>
    </div>
</body>
</html>

