<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DepartmentDetails.aspx.cs" Inherits="EsteemCabService.DepartmentDetails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1 style="font-family: Verdana; font-size: medium; font-style: normal; text-transform: uppercase; font-weight: bolder"> Department Details </h1> 
    <table>
        <td>
             <asp:label id ="lblDeptName" Text="Department Name: "  runat="server"   />            
            <asp:textbox id ="txtDeptName"  runat="server" BorderColor="Black"  BorderStyle="Solid"   ></asp:TextBox>
            <br />        
            <asp:Label ID="lblDeptType" Text="Department Type: " runat="server" />
            <asp:TextBox ID="txtDeptType" runat="server" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
            <br />
        </td>
        <br />       
    </table>
    <table>
        
          <asp:Button ID="BtnSaveDeptDetails"  runat="server" Text="Save" OnClick="BtnSaveDeptDetails_Click" BorderStyle="Solid" /> 
        
   </table>
        <asp:Label ID="lblRes" runat="server" Text=""></asp:Label>
    
    
    </div>
    </form>
</body>
</html>
