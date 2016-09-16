﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDetails.aspx.cs" Inherits="EsteemCabService.AdminDetails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
     <title>Eseem Cab Services</title>
  <meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="../Styles/style.css"/>

<script type = "text/javascript" src = "../scripts/jquery-1.3.2.min.js"></script>
<script type = "text/javascript" src = "../scripts/jquery.blockUI.js"></script>
<script type = "text/javascript">
    function BlockUI(elementID) {
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_beginRequest(function () {
            $("#" + elementID).block({ message: '<table align = "center"><tr><td>' +
     '<img src="images/loadingAnim.gif"/></td></tr></table>',
                css: {},
                overlayCSS: { backgroundColor: '#000000', opacity: 0.6, border: '3px solid #63B2EB'
                }
            });
        });
        prm.add_endRequest(function () {
            $("#" + elementID).unblock();
        });
    }
    $(document).ready(function () {

        BlockUI("dvGrid");
        $.blockUI.defaults.css = {};
    });
</script>
</head>
<body style ="margin:0;padding:0">
   

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
		       <li><a href="AdminHome.aspx">Home</a></li>  
                <li><a href="EditDriverDetails.aspx">Driver</a></li> 
                <li><a href="ActivateDriver.aspx">Activate</a></li>
                <li><a href="EditCustomerDetails.aspx">Customer</a></li>        		        
                <li><a href="InvoiceReport.aspx">Invoice Report</a></li>
		        <li><a href="AdminLogIn.aspx">Log out</a></li>			
		     </ul>            
       </div>  


       <div id="leftcolumn"> &nbsp;
       <h3>Update Profile</h3>

        <form id="form1" runat="server">
    
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

       <div id = "dvGrid" style ="padding:10px;width:550px">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">

        <ContentTemplate>

            <asp:GridView ID="GridView1" runat="server"  Width = "550px"

            AutoGenerateColumns = "false"  Font-Names="Time New Roman" Font-Size="10pt" 
                            HeaderStyle-BackColor="Green" AllowPaging ="true"  ShowFooter = "true" 
            OnPageIndexChanging = "OnPaging" onrowediting="EditCustomer" 
                onrowcancelingedit="CancelEdit" onrowupdating="UpdateCustomer" 

            PageSize = "10"  ForeColor="#e1ffaf" >
            


            <Columns>

            <asp:TemplateField ItemStyle-Width = "30px"  HeaderText = "EmpId">
                <ItemTemplate>
                    <asp:Label ID="lblEmpId" runat="server" Text='<%# Eval("EmpId")%>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtEmpId" Width = "40px" MaxLength = "5" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemStyle Width="30px" />
            </asp:TemplateField>

            <asp:TemplateField ItemStyle-Width = "100px"  HeaderText = "FirstName">
                <ItemTemplate>
                    <asp:Label ID="lblFirstName" runat="server" Text='<%# Eval("FirstName")%>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>   
                    <asp:TextBox ID="txtFirstname" MaxLength = "20" runat="server" Text='<%# Eval("FirstName")%>' ></asp:TextBox>   
                </EditItemTemplate> 
                <FooterTemplate>
                    <asp:TextBox ID="txtFirstName" runat="server" MaxLength = "20"></asp:TextBox>
                </FooterTemplate>
                <ItemStyle Width="100px" />
            </asp:TemplateField>

            <asp:TemplateField ItemStyle-Width = "100px"  HeaderText = "LastName">
                <ItemTemplate>
                    <asp:Label ID="lblLastName" runat="server" Text='<%# Eval("LastName")%>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>   
                    <asp:TextBox ID="txtLastName" runat="server" Text='<%# Eval("LastName")%>' MaxLength = "20"></asp:TextBox>   
                </EditItemTemplate> 
                <FooterTemplate>
                    <asp:TextBox ID="txtLastName" runat="server" MaxLength = "20"></asp:TextBox>
                </FooterTemplate>
                <ItemStyle Width="100px" />
            </asp:TemplateField>
            

            <asp:TemplateField ItemStyle-Width = "100px"  HeaderText = "Address">
                <ItemTemplate>
                    <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address")%>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>   
                    <asp:TextBox ID="txtAddress"  MaxLength = "500" runat="server" Text='<%# Eval("Address")%>' ></asp:TextBox>   
                </EditItemTemplate> 
                <FooterTemplate>
                    <asp:TextBox ID="txtAddress"  MaxLength = "500" runat="server" ></asp:TextBox>
                </FooterTemplate>
                <ItemStyle Width="100px" />
            </asp:TemplateField>

            <asp:TemplateField ItemStyle-Width = "100px"  HeaderText = "Email">
                <ItemTemplate>
                    <asp:Label ID="lbltxtEmail" runat="server" Text='<%# Eval("Email")%>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>   
                    <asp:TextBox ID="txtEmail" MaxLength = "20" runat="server" Text='<%# Eval("Email")%>'></asp:TextBox>   
                </EditItemTemplate> 
                <FooterTemplate>
                    <asp:TextBox ID="txtEmail" MaxLength = "20" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemStyle Width="100px" />
            </asp:TemplateField>

            <asp:TemplateField ItemStyle-Width = "100px"  HeaderText = "MobileNo">
                <ItemTemplate>
                    <asp:Label ID="lblMobileNo" runat="server" Text='<%# Eval("MobileNo")%>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>   
                    <asp:TextBox ID="txtMobileNo"  MaxLength = "10" runat="server" Text='<%# Eval("MobileNo")%>'></asp:TextBox>   
                </EditItemTemplate> 
                <FooterTemplate>
                    <asp:TextBox ID="txtMobileNo"  MaxLength = "10" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemStyle Width="100px" />
            </asp:TemplateField>

            <asp:TemplateField ItemStyle-Width = "100px"  HeaderText = "DLNo">
                <ItemTemplate>
                    <asp:Label ID="lblDLNo" runat="server" Text='<%# Eval("DLNo")%>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>   
                    <asp:TextBox ID="txtDlNo"  MaxLength = "20" runat="server" Text='<%# Eval("DLNo")%>'></asp:TextBox>   
                </EditItemTemplate> 
                <FooterTemplate>
                    <asp:TextBox ID="txtDlNo"  MaxLength = "20" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemStyle Width="100px" />
            </asp:TemplateField>

            
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="lnkRemove" runat="server" CommandArgument = '<%# Eval("EmpId")%>'
                     OnClientClick = "return confirm('Do you want to delete?')"
                    Text = "Delete" OnClick = "DeleteCustomer"></asp:LinkButton>
                </ItemTemplate>
                <%--<FooterTemplate>
                    <asp:Button ID="btnAdd" runat="server" Text="Add" />
                         OnClick = "AddNewCustomer"
                </FooterTemplate>--%>
            </asp:TemplateField>
            <asp:CommandField  ShowEditButton="True" />
            </Columns>
            
                <HeaderStyle BackColor="Green" />
            </asp:GridView>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID = "GridView1" />
            </Triggers>
        </asp:UpdatePanel>
        </div>
        <asp:Label ID = "lblres" runat="server"></asp:Label>
        </form>
       </div>  
      </div>  
    
</body>
</html>
