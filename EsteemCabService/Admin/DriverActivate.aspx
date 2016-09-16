<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DriverActivate.aspx.cs" Inherits="EsteemCabService.Admin.DriverActivate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
     <title>Eseem Cab Services</title>
  <meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="../Styles/Style.css"/>
</head>

<body>
    <form id="form1" runat="server">
    
             
            <p>Driver`s to be activated</p>     
                         
 

<div id = "dvGrid" style ="padding:10px;width:550px">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">

        <ContentTemplate>

            <asp:GridView ID="GridView1" runat="server"  Width = "550px"

            AutoGenerateColumns = "false" Font-Names = "Arial"

            Font-Size = "11pt" AlternatingRowStyle-BackColor = "#C2D69B" 

            HeaderStyle-BackColor = "green" AllowPaging ="true"  ShowFooter = "true" 

            OnPageIndexChanging = "OnPaging" onrowediting="EditCustomer"

            onrowupdating="UpdateCustomer"  onrowcancelingedit="CancelEdit"

            PageSize = "10" >

<Columns>

<asp:TemplateField ItemStyle-Width = "30px"  HeaderText = "CustomerID">

    <ItemTemplate>

        <asp:Label ID="lblCustomerID" runat="server"

        Text='<%# Eval("CustomerID")%>'></asp:Label>

    </ItemTemplate>

    <FooterTemplate>

        <asp:TextBox ID="txtCustomerID" Width = "40px"

            MaxLength = "5" runat="server"></asp:TextBox>

    </FooterTemplate>

</asp:TemplateField>

<asp:TemplateField ItemStyle-Width = "100px"  HeaderText = "Name">

    <ItemTemplate>

        <asp:Label ID="lblContactName" runat="server"

                Text='<%# Eval("ContactName")%>'></asp:Label>

    </ItemTemplate>

    <EditItemTemplate>

        <asp:TextBox ID="txtContactName" runat="server"

            Text='<%# Eval("ContactName")%>'></asp:TextBox>

    </EditItemTemplate> 

    <FooterTemplate>

        <asp:TextBox ID="txtContactName" runat="server"></asp:TextBox>

    </FooterTemplate>

</asp:TemplateField>

<asp:TemplateField ItemStyle-Width = "150px"  HeaderText = "Company">

    <ItemTemplate>

        <asp:Label ID="lblCompany" runat="server"

            Text='<%# Eval("CompanyName")%>'></asp:Label>

    </ItemTemplate>

    <EditItemTemplate>

        <asp:TextBox ID="txtCompany" runat="server"

            Text='<%# Eval("CompanyName")%>'></asp:TextBox>

    </EditItemTemplate> 

    <FooterTemplate>

        <asp:TextBox ID="txtCompany" runat="server"></asp:TextBox>

    </FooterTemplate>

</asp:TemplateField>

<asp:TemplateField>

    <ItemTemplate>

        <asp:LinkButton ID="lnkRemove" runat="server"

            CommandArgument = '<%# Eval("CustomerID")%>'

         OnClientClick = "return confirm('Do you want to delete?')"

        Text = "Delete" OnClick = "DeleteCustomer"></asp:LinkButton>

    </ItemTemplate>

    <FooterTemplate>

        <asp:Button ID="btnAdd" runat="server" Text="Add"

            OnClick = "AddNewCustomer" />

    </FooterTemplate>

</asp:TemplateField>

<asp:CommandField  ShowEditButton="True" />

</Columns>

<AlternatingRowStyle BackColor="#C2D69B"  />

</asp:GridView>

</ContentTemplate>

<Triggers>

<asp:AsyncPostBackTrigger ControlID = "GridView1" />

</Triggers>

</asp:UpdatePanel>

</div>
               
    </form>
</body>
</html>
