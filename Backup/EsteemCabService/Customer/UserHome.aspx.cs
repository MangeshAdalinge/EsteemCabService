using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicLayer;

namespace EsteemCabService
{
    public partial class UserHome : System.Web.UI.Page
    {
        ClassDriver objDriver = new ClassDriver();

        protected void btnGetCabs_Click(object sender, EventArgs e)
        {
            
            Session["CurrentLat"] = Convert.ToSingle(lat.Value.ToString());
            Session["CurrentLong"] = Convert.ToSingle(lng.Value.ToString());
            Session["Type"] = ddlType.SelectedValue.ToString();
            string s = ddlType.SelectedValue.ToString();

            if (s == "Select Type")
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Please select the cab type ...." + "');", true);
            }
            else
            {
                Response.Redirect("NearByCabs.aspx");
            }
            
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" +  "Session Variable" + Session["CustId"] + "User Name: " + Session["UserName"] + "');", true);
            //txtCustomerId.Text = (string)Session["CustId"];
           // txtUserName.Text = (string)Session["UserName"];
            
               //Session["SessionCount"] = Convert.ToInt32(Session["SessionCount"]) + 1;
        }
    }
}