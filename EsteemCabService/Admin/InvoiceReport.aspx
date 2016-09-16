<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvoiceReport.aspx.cs" Inherits="EsteemCabService.Admin.InvoiceReport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Esteem Cab Service</title>
    <link rel="stylesheet" type="text/css" href="../Styles/style.css" />
<script type = "text/javascript" src = "../Scripts/jquery-1.3.2.min.js"></script>
<script type = "text/javascript" src = "../Scripts/jquery.blockUI.js"></script>
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
                <p>
                    Esteem Cab Services</p>
                <p>
                    Distance made shorter</p>
            </div>
        </div>
        <div id="navbar">
            <ul>
                <li><a href="AdminHome.aspx">Home</a></li>
                <li><a href="AdminDetails.aspx">Update Profile</a></li>
                <li><a href="ActivateDriver.aspx">Activate</a></li>
                <li><a href="EditDriverDetails.aspx">Update Driver</a></li>                                
                <li><a href=""></a></li>
                <li><a href="AdminLogIn.aspx">Log out</a></li>
            </ul>
        </div>
        <div id="leftcolumn">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div id = "dvGrid" style ="padding:10px;width:550px">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">

        <ContentTemplate>

            <asp:GridView ID="GridView1" runat="server"  Width = "550px"

            AutoGenerateColumns = "True"  Font-Names="Time New Roman" Font-Size="10pt" AlternatingRowStyle-BackColor="Blue" AllowPaging ="true"  ShowFooter = "true" 

            OnPageIndexChanging = "OnPaging"  HeaderStyle-BackColor ="Green"

            PageSize = "10" ForeColor="#e1ffaf">


          

            

            </asp:GridView>

            </ContentTemplate>

        <Triggers>

        <asp:AsyncPostBackTrigger ControlID = "GridView1" />

        </Triggers>

        </asp:UpdatePanel>

        </div>

        <table>
        <h1>Enter Customer Details:</h1>
            <tr>
            <td>
                <asp:Label ID ="lblFirstName" runat="server" Text="First Name" Max></asp:Label>
            </td>
                <td>
                    <asp:Textbox ID ="txtFirstName" runat="server"></asp:Textbox>
                </td>
            </tr>

            <tr>
            <td>
                <asp:Label ID ="lblLastName" runat="server" Text="Last Name"></asp:Label>
            </td>
                <td>
                    <asp:Textbox ID ="txtLastName" runat="server"></asp:Textbox>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Button ID="btnFetchInvoice" Text="Fetch Invoice" runat="server"  OnClick="FetchInvoice"/>
                </td>
            </tr>
        </table>
    


        <table>
            <tr>
                <td>
                    <asp:Label ID ="lblRes" runat="server"></asp:Label>
                </td>
            </tr>
        </table>

    </form>
    </div>
    </div>
</body>
</html>
