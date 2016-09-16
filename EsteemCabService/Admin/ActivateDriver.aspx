<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActivateDriver.aspx.cs" Inherits="EsteemCabService.Admin.ActivateDriver" %>

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
		        <li><a href="AdminDetails.aspx">Update Profile</a></li>
                <li><a href="EditDriverDetails.aspx">Driver</a></li>		        		        
                <li><a href="EditCustomerDetails.aspx">Customer</a></li>
                <li><a href="InvoiceReport.aspx">Invoice Report</a></li>
		        <li><a href="AdminLogIn.aspx">Log out</a></li>			
		     </ul>            
       </div>  


       <div id="leftcolumn"> &nbsp;
       <h3>Activate Driver</h3>
          <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>   

        <div id = "dvGrid" style ="padding:10px;width:550px">

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">

                <ContentTemplate>

                    <asp:GridView ID="GridView1" runat="server"  Width = "550px"

                    AutoGenerateColumns = "false"  Font-Names="Time New Roman" Font-Size="10pt" 
                            HeaderStyle-BackColor="Green" AllowPaging ="true"  ShowFooter = "true" 

                    OnPageIndexChanging = "OnPaging" onrowediting="EditCustomer" onrowcancelingedit="CancelEdit" onrowupdating="UpdateCustomer" 

                    PageSize = "10"  ForeColor="#e1ffaf" >
            


                    <Columns>

                    <asp:TemplateField ItemStyle-Width = "30px"  HeaderText = "CabID">

                        <ItemTemplate>

                            <asp:Label ID="lblCabId" runat="server"

                            Text='<%# Eval("CabId")%>'></asp:Label>

                        </ItemTemplate>

                        <FooterTemplate>

                            <asp:TextBox ID="txtCabId" Width = "40px"

                                MaxLength = "5" runat="server"></asp:TextBox>

                        </FooterTemplate>

                    </asp:TemplateField>

                    <asp:TemplateField ItemStyle-Width = "100px"  HeaderText = "Status">

                        <ItemTemplate>

                            <asp:Label ID="lblStatus" runat="server"

                                    Text='<%# Eval("Status")%>'></asp:Label>


                        </ItemTemplate>
                

                        <EditItemTemplate>
                            <%--<asp:DropDownList ID="txtStatus" runat="server">
                            ='<%# Eval("Status")%>'>
                            </asp:DropDownList>--%>
                            <asp:TextBox ID="txtStatus" runat="server"
                                Text='<%# Eval("Status")%>'></asp:TextBox>
            <%--                    <asp:RegularExpressionValidator ID="regexpName" runat="server"     
                                            ErrorMessage="Value: Y or N" 
                                            ControlToValidate="txtAvailable"     
                                            ValidationExpression="^[Deactive]*$" />
        --%>
                        </EditItemTemplate> 

                        <FooterTemplate>

                            <asp:TextBox ID="txtStatus" runat="server" MaxLength = "20"></asp:TextBox>

                        </FooterTemplate>

                    </asp:TemplateField>

                    <asp:TemplateField ItemStyle-Width = "400px"  HeaderText = "Available">

                        <ItemTemplate>

                            <asp:Label ID="lblAvailable" runat="server"

                                Text='<%# Eval("Available")%>'></asp:Label>

                        </ItemTemplate>

                        <EditItemTemplate>

                            <asp:TextBox ID="txtAvailable" runat="server" MaxLength = "20"

                                Text='<%# Eval("Available")%>'></asp:TextBox>
                        
                                <asp:RegularExpressionValidator ID="regexpName" runat="server"     
                                            ErrorMessage="Value: Y or N" 
                                            ControlToValidate="txtAvailable"     
                                            ValidationExpression="^[YNyn\s]*$" />
                        </EditItemTemplate> 

                        <FooterTemplate>

                            <asp:TextBox ID="txtAvailable" runat="server" MaxLength = "20"></asp:TextBox>

                        </FooterTemplate>

                    </asp:TemplateField>

                    <asp:TemplateField>

                        <ItemTemplate>

                            <asp:LinkButton ID="lnkRemove" runat="server"

                                CommandArgument = '<%# Eval("CabID")%>'

                             OnClientClick = "return confirm('Do you want to delete?')"

                            Text = "Delete" OnClick = "DeleteCustomer"></asp:LinkButton>

                        </ItemTemplate>

                        <%--<FooterTemplate>

                            <asp:Button ID="btnAdd" runat="server" Text="Add"

                                 />
                                 OnClick = "AddNewCustomer"

                        </FooterTemplate>--%>

                    </asp:TemplateField>

                    <asp:CommandField  ShowEditButton="True" />

                    </Columns>

                    

                    </asp:GridView>

                    </ContentTemplate>

                <Triggers>

                <asp:AsyncPostBackTrigger ControlID = "GridView1" />

                </Triggers>

                </asp:UpdatePanel>

                </div>
                <table>
                <tr>
                    <td>
                        <asp:Label ID = "lblRes" runat="server"></asp:Label>
                    </td>
                </tr>
                </table>

          </form>
          </div>
        </div>
</body>
</html>
