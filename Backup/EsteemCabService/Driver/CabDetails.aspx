<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CabDetails.aspx.cs" Inherits="EsteemCabService.Driver.CabDetails" %>

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
                <li><a href="DriverRideStatus.aspx">Home</a></li>
                <li><a href="DriverPersonalDetails.aspx">Update Profile</a></li>
                <li><a href="AboutUsD.aspx">About us</a></li>
                <li><a href="ContactUsD.aspx">Contact us</a></li>
                <li><a href="../EcsMain.aspx">Log out</a></li>
            </ul>
        </div>
        
        
        <div id="leftcolumn">
        <br/>
        <br/>
        <br/>

        <h1>
            Cab Details:
        </h1>
        <br/>
        <br/>
        <br/>
        <br/>
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
                                <asp:TemplateField ItemStyle-Width="30px" HeaderText="EmpId">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEmpId" runat="server" Text='<%# Eval("DriverId")%>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtEmpId" Width="40px" MaxLength="5" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                    <ItemStyle Width="30px" />
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="50px" HeaderText="Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("Name")%>'></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="Required"
                                            ForeColor="Red" ControlToValidate="txtName" runat="server" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                    <ItemStyle Width="50px" />
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="50px" HeaderText="Color">
                                    <ItemTemplate>
                                        <asp:Label ID="lblColor" runat="server" Text='<%# Eval("Color")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtColor" runat="server" Text='<%# Eval("Color")%>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtColor" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                    <ItemStyle Width="50px" />
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="50px" HeaderText="Rental">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRental" runat="server" Text='<%# Eval("Rental")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtRental" runat="server" Text='<%# Eval("Rental")%>'></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ErrorMessage="Required"
                                            ForeColor="Red" ControlToValidate="txtRental" runat="server" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtRental" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                    <ItemStyle Width="50px" />
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="50px" HeaderText="City">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCity" runat="server" Text='<%# Eval("City")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtCity" runat="server" Text='<%# Eval("City")%>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                    <ItemStyle Width="50px" />
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="50px" HeaderText="State">
                                    <ItemTemplate>
                                        <asp:Label ID="lblState" runat="server" Text='<%# Eval("State")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtState" runat="server" Text='<%# Eval("State")%>'></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtState"
                                            ErrorMessage="length must b < 20" ValidationExpression="[0-9a-zA-Z #,-]{20}$"></asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtState" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                    <ItemStyle Width="50px" />
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="50px" HeaderText="Country">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("Country")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtCountry" runat="server" Text='<%# Eval("Country")%>' MaxLength="20"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ErrorMessage="Required"
                                            Display="Dynamic" ForeColor="Red" ControlToValidate="txtCountry" runat="server" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtCountry" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                    <ItemStyle Width="50px" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkRemove" runat="server" CommandArgument='<%# Eval("DriverId")%>'
                                            OnClientClick="return confirm('Do you want to delete?')" Text="Delete" OnClick="DeleteCustomer"></asp:LinkButton>
                                    </ItemTemplate>
                                   <%-- <FooterTemplate>
                                        <asp:Button ID="btnAdd" runat="server" Text="Add" />
                                            OnClick = "AddNewCustomer"
                                    </FooterTemplate>--%>
                                </asp:TemplateField>
                                <asp:CommandField ShowEditButton="True" />
                            </Columns>
                            
                            <HeaderStyle BackColor="Green" />
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="GridView1" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </form>
        </div>
        
    </div>
</body>
</html>
