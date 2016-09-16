<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPersonalDetails.aspx.cs" Inherits="EsteemCabService.Admin.AdminPersonalDetails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
     <title>Eseem Cab Services</title>
  <meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="../Styles/Style.css"/>
</head>


<body>
    <form id="form1" runat="server">
    
    <div id="wrapper">
       <div id="header">
          <div class="logo"><a href="">Eseem Cab Services</a>
            <p>Distance made shorter</p>
            </div>
       </div>
        <h1 style="font-family: Verdana; font-size: medium; font-style: normal; text-transform: uppercase; font-weight: bolder">Admin Personal Details</h1> 
      <br />
       </div> 
       
       <div>
       <table>
          <tr>
                <asp:label id ="lblDeptName" Text="Department: "  runat="server"  style="width:200px; font-family: Verdana; font-size: medium; font-style: normal; text-transform: uppercase; font-weight: bolder" />   
                &nbsp; 
                <asp:textbox id ="txtDeptName"  runat="server"  width= "150px" BorderColor="Black"  BorderStyle="Solid"   ></asp:TextBox>    
                &nbsp;
         

        </tr>
        <tr>
               <asp:label id ="lblFName" Text="First Name: "  runat="server" style="width:200px; font-family: Verdana; font-family: Verdana; font-size: medium; font-style: normal; text-transform: uppercase; font-weight: bolder"  />      
                &nbsp;
                <asp:textbox id ="txtFName"  runat="server"  width= "150px" BorderColor="Black" BorderStyle="Solid"   ></asp:TextBox> 
                &nbsp;   
        </tr>
        <tr>
                <asp:label id ="lblLName" Text="Last Name: "  runat="server"  style="width:200px; font-family: Verdana; font-family: Verdana; font-size: medium; font-style: normal; text-transform: uppercase; font-weight: bolder" />   
                &nbsp;
                <asp:textbox id ="txtLName"  runat="server"  width= "150px" BorderColor="Black"  BorderStyle="Solid"   ></asp:TextBox>       
         </tr>
         <tr>
                <asp:label id ="lblAddress" Text="Address: "  runat="server"  style="width:200px; font-family: Verdana; font-size: medium; font-style: normal; text-transform: uppercase; font-weight: bolder" />   
                &nbsp; 
                <asp:textbox id ="txtAddress"  runat="server"  width= "150px" BorderColor="Black"  BorderStyle="Solid"   ></asp:TextBox>    
                &nbsp;

        </tr>
        <tr>
               <asp:label id ="lblEMail" Text="EMail: "  runat="server" style="width:200px; font-family: Verdana; font-family: Verdana; font-size: medium; font-style: normal; text-transform: uppercase; font-weight: bolder"  />      
                &nbsp;
                <asp:textbox id ="txtEMail"  runat="server"  width= "150px" BorderColor="Black" BorderStyle="Solid"   ></asp:TextBox> 
                &nbsp;   
        </tr>
        <tr>
                <asp:label id ="lblMobileNo" Text="Mobile Number: "  runat="server"  style="width:200px; font-family: Verdana; font-family: Verdana; font-size: medium; font-style: normal; text-transform: uppercase; font-weight: bolder" />   
                &nbsp;
                <asp:textbox id ="txtMobileNo"  runat="server"  width= "150px" BorderColor="Black"  BorderStyle="Solid"   ></asp:TextBox>       
         </tr>
         <tr>
                <asp:label id ="lblDLNo" Text="Driving License Number: "  runat="server"  style="width:200px; font-family: Verdana; font-family: Verdana; font-size: medium; font-style: normal; text-transform: uppercase; font-weight: bolder" />   
                &nbsp;
                <asp:textbox id ="txtDlNo"  runat="server"  width= "150px" BorderColor="Black"  BorderStyle="Solid"   ></asp:TextBox>       
         </tr>
         <br />
         <tr>
            <asp:Button ID="btnSave"  runat="server" Text="Save Admin Details" OnClick="btnSave_Click" 
             style="font-family: Verdana; font-size: medium; font-style: normal; " />
              <asp:label id ="lblRes" Text=""  runat="server"  style="width:200px; font-family: Verdana; font-family: Verdana; font-size: medium; font-style: normal; text-transform: uppercase; font-weight: bolder" />   
             
       
         </tr>
       </div>   
    </form>
</body>
</html>
