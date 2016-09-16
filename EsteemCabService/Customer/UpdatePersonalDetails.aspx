<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdatePersonalDetails.aspx.cs"
    Inherits="EsteemCabService.Customer.UpdatePersonalDetails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Eseem Cab Services</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="../Styles/style.css" />
    <script type="text/javascript" src="../Scripts/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="../Scripts/jquery.blockUI.js"></script>
    <script type="text/javascript">
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
<body style="margin: 0; padding: 0">
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
                <li><a href="UserHome.aspx">New Ride</a></li>
                <li><a href="AboutUsC.aspx">About us</a></li>
                <li><a href="ContactUsC.aspx">Contact us</a></li>                
                <li><a href=""></a></li>
                <li><a href="../EcsMain.aspx">Log out</a></li>
            </ul>
        </div>
        
        <div id="leftcolumn">
        <br />
        <br />
        <br />
        <h1>
            Customer Details:
        </h1>
        <br />
        <br />
        <br />
        <br />
            <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <div id="dvGrid" style="padding: 10px; width: 550px">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="GridView1" runat="server" Width="550px" AutoGenerateColumns="false"
                            Font-Names="Time New Roman" Font-Size="10pt" 
                            HeaderStyle-BackColor="Green" AllowPaging="true" ShowFooter="true" OnPageIndexChanging="OnPaging"
                            OnRowEditing="EditCustomer" OnRowCancelingEdit="CancelEdit" OnRowUpdating="UpdateCustomer"
                            PageSize="10" ForeColor="#e1ffaf">
                            <Columns>
                                <asp:TemplateField ItemStyle-Width="30px" HeaderText="CustId">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCustId" runat="server" Text='<%# Eval("CustId")%>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtCustId" Width="40px" MaxLength="5" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                    <ItemStyle Width="30px" />
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="100px" HeaderText="FirstName">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFirstName" runat="server" Text='<%# Eval("FirstName")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtFirstname" MaxLength = "20" runat="server" Text='<%# Eval("FirstName")%>'></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="Required"
                                            ForeColor="Red" ControlToValidate="txtFirstName" runat="server" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtFirstname" MaxLength = "20" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                    <ItemStyle Width="100px" />
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="100px" HeaderText="LastName">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLastName" runat="server" Text='<%# Eval("LastName")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtLastName"  MaxLength = "20" runat="server" Text='<%# Eval("LastName")%>'></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ErrorMessage="Required"
                                            ForeColor="Red" ControlToValidate="txtLastName" runat="server" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtLastName"  MaxLength = "20" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                    <ItemStyle Width="100px" />
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="100px" HeaderText="Address">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtAddress"  MaxLength = "500" runat="server" Text='<%# Eval("Address")%>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtAddress"  MaxLength = "500" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                    <ItemStyle Width="100px" />
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="100px" HeaderText="Email">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltxtEmail" runat="server" Text='<%# Eval("Email")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEmail" MaxLength = "20" runat="server" Text='<%# Eval("Email")%>'></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ErrorMessage="Required"
                                            Display="Dynamic" ForeColor="Red" ControlToValidate="txtEmail" runat="server" />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Display="Dynamic"
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail"
                                            ForeColor="Red" ErrorMessage="Invalid email" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtEmail" MaxLength = "20" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                    <ItemStyle Width="100px" />
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="100px" HeaderText="MobileNo">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMobileNo" runat="server" Text='<%# Eval("MobileNo")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtMobileNo"  MaxLength = "10" runat="server" Text='<%# Eval("MobileNo")%>'></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtMobileNo"
                                            ErrorMessage="Should be 10 digit no" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtMobileNo"  MaxLength = "10" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                    <ItemStyle Width="100px" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkRemove" runat="server" CommandArgument='<%# Eval("CustId")%>'
                                            OnClientClick="return confirm('Do you want to delete?')" Text="Delete" OnClick="DeleteCustomer"></asp:LinkButton>
                                    </ItemTemplate>
                                    <%--<FooterTemplate>
                                        <asp:Button ID="btnAdd" runat="server" Text="Add" />
                                        OnClick = "AddNewCustomer"
                                    </FooterTemplate>--%>
                                </asp:TemplateField>
                                <asp:CommandField ShowEditButton="True" />
                            </Columns>
                            <AlternatingRowStyle BackColor="#C2D69B" />
                            <HeaderStyle BackColor="Green" />
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="GridView1" />
                    </Triggers>
                </asp:UpdatePanel>
                <asp:Label ID ="lblRes" runat="server"></asp:Label>
            </form>
        </div>
    </div>
</body>
</html>
