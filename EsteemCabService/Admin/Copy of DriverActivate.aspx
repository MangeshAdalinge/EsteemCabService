<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DriverActivate.aspx.cs" Inherits="EsteemCabService.Admin.DriverActivate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
     <title>Eseem Cab Services</title>
  <meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="Styles/Style.css"/>
</head>

<body>
    <form id="form1" runat="server">
    
             
            <p>Driver`s to be activated</p>     
                         
 <%--<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" >--%>
  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataKeyNames="CabId" AllowPaging="true"  OnPageIndexChanging="OnPageIndexChanging" PageSize="20"
OnRowEditing="OnRowEditing" >
<%--OnRowDataBound="OnRowDataBound"  EmptyDataText="No records has been added."   OnRowCancelingEdit="OnRowCancelingEdit"
OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting">--%>
  <Columns>
     <asp:TemplateField HeaderText="CabId" ItemStyle-Width="150">
        <ItemTemplate>
            <asp:Label ID="lblCabId" runat="server" Text='<%# Eval("CabId") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtCabId" runat="server" Text='<%# Eval("CabId") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>

        <asp:TemplateField HeaderText="Status" ItemStyle-Width="150">
        <ItemTemplate>
            <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtStatus" runat="server" Text='<%# Eval("Status") %>'></asp:TextBox>
        </EditItemTemplate>

</asp:TemplateField>
       
 <asp:TemplateField HeaderText="Available" ItemStyle-Width="150">
        <ItemTemplate>
            <asp:Label ID="lblAvailable" runat="server" Text='<%# Eval("Available") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtAvailable" runat="server" Text='<%# Eval("Available") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>

     <%--<asp:TemplateField HeaderText="Type" ItemStyle-Width="150">
        <ItemTemplate>
            <asp:Label ID="lblType" runat="server" Text='<%# Eval("Type") %>'></asp:Label>
        </ItemTemplate>
         <EditItemTemplate>
            <asp:TextBox ID="txtType" runat="server" Text='<%# Eval("Type") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
        <asp:TemplateField HeaderText="Color" ItemStyle-Width="150">
        <ItemTemplate>
            <asp:Label ID="lblColor" runat="server" Text='<%# Eval("Color") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtColor" runat="server" Text='<%# Eval("Color") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
        <asp:TemplateField HeaderText="Rental" ItemStyle-Width="150">
        <ItemTemplate>
            <asp:Label ID="lblRental" runat="server" Text='<%# Eval("Rental") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtRental" runat="server" Text='<%# Eval("Rental") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>--%>

   
<%--            <asp:TemplateField HeaderText="Lattitude" ItemStyle-Width="150">
        <ItemTemplate>
            <asp:Label ID="lblLattitude" runat="server" Text='<%# Eval("Lattitude") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtLattitude" runat="server" Text='<%# Eval("Lattitude") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>

        <asp:TemplateField HeaderText="City" ItemStyle-Width="150">
        <ItemTemplate>
            <asp:Label ID="lblCity" runat="server" Text='<%# Eval("City") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtCity" runat="server" Text='<%# Eval("City") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>

        <asp:TemplateField HeaderText="State" ItemStyle-Width="150">
        <ItemTemplate>
            <asp:Label ID="lblState" runat="server" Text='<%# Eval("State") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtState" runat="server" Text='<%# Eval("State") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>

        <asp:TemplateField HeaderText="Country" ItemStyle-Width="150">
        <ItemTemplate>
            <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("Country") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtCountry" runat="server" Text='<%# Eval("Country") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>

--%>

<%--
        <asp:TemplateField HeaderText="NumberPlate" ItemStyle-Width="150">
        <ItemTemplate>
            <asp:Label ID="lblNumberPlate" runat="server" Text='<%# Eval("NumberPlate") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtNumberPlate" runat="server" Text='<%# Eval("NumberPlate") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>

        <asp:TemplateField HeaderText="DriverId" ItemStyle-Width="150">
        <ItemTemplate>
            <asp:Label ID="lblDriverId" runat="server" Text='<%# Eval("DriverId") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtDriverId" runat="server" Text='<%# Eval("DriverId") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
    --%>    <%--<asp:BoundField ItemStyle-Width="150px" DataField="CabId" HeaderText="Cab ID" />
        <asp:BoundField ItemStyle-Width="150px" DataField="Type" HeaderText="Type" />
        <asp:BoundField ItemStyle-Width="150px" DataField="Color" HeaderText="Color" />
        <asp:BoundField ItemStyle-Width="150px" DataField="Rental" HeaderText="Rental" />
        <asp:BoundField ItemStyle-Width="150px" DataField="Status" HeaderText="Status" />
        <asp:BoundField ItemStyle-Width="150px" DataField="Lattitude" HeaderText="Lattitude" />        
        <asp:BoundField ItemStyle-Width="150px" DataField="City" HeaderText="City" />
        <asp:BoundField ItemStyle-Width="150px" DataField="State" HeaderText="State" />
        <asp:BoundField ItemStyle-Width="150px" DataField="Country" HeaderText="Country" />        
        <asp:BoundField ItemStyle-Width="150px" DataField="Available" HeaderText="Available" />
        <asp:BoundField ItemStyle-Width="150px" DataField="NumberPlate" HeaderText="NumberPlate" />
        <asp:BoundField ItemStyle-Width="150px" DataField="DriverId" HeaderText="DriverId" />--%>
        
    </Columns>
</asp:GridView>
               
    </form>
</body>
</html>
