<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RideStatus.aspx.cs" Inherits="EsteemCabService.Customer.RideStatus" %>

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
                <li><a href="UpdatePersonalDetails.aspx">Update Profile</a></li>
                <li><a href="UserHome.aspx">New Ride</a></li>
                <li><a href="AboutUsC.aspx">About us</a></li>
                <li><a href="ContactUsC.aspx">Contact us</a></li>
                <li><a href="../EcsMain.aspx">Log out</a></li>
            </ul>
        </div>
        
        <div id="leftcolumn">
        <br />
        <br />
        <br />
        <h1>
            Ride Details:
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
                        <asp:GridView ID="GridView1" runat="server" Width="550px" AutoGenerateColumns="true"
                            Font-Names="Time New Roman" Font-Size="10pt" HeaderStyle-BackColor="Green" AllowPaging="true" 
                            ShowFooter="true" OnPageIndexChanging="OnPaging"                           
                            PageSize="10" ForeColor="#e1ffaf">
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
