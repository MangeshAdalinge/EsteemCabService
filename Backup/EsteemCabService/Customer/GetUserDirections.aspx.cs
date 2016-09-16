using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EsteemCabService.Customer
{
    public partial class GetUserDirections : System.Web.UI.Page
    {

        protected void BookingProcess(object sender, EventArgs e)
        {
            
            string distance = Convert.ToString(Distance.Value.ToString());
            distance = distance.Replace(",", "");
            distance = distance.Replace(" km", "");
            Session["Distance"] = distance;
            
            Session["SourceLocation"] = txtSource.Text;
            Session["DestinationLocation"] = txtDestination.Text;
            string s = (Duration.Value.ToString()).ToLower();
            string hr;
            if (s.IndexOf("hours") != -1)
            {
                hr = s.Substring(0, s.IndexOf("hours") - 1);
            }
            else
            {
                hr = "00";
            }
            string min;
            if (s.IndexOf("m") != -1)
            {
                if ((s.IndexOf("m") - 3) >= 0)
                {
                    min = s.Substring(s.IndexOf("m") - 3, 2);
                }
                else
                {
                    min = "0"+ s.Substring(s.IndexOf("m") - 2, 1);
                }
                
            }
            else
            {
                min = "00";
            }
            string sec;
            if (s.IndexOf("secs") != -1)
            {
                sec = s.Substring(s.IndexOf("secs") - 3, 2);
            }
            else
            {
                sec = "00";
            }

            Session["Duration"] = hr + ":" + min + ":" + sec;
            btnBookingProcess.Text = Session["Duration"].ToString();
            
            Response.Redirect("BookACab.aspx");
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            
                //Session["SessionCount"] = Convert.ToInt32(Session["SessionCount"]) + 1;
                ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:GetAddress(); ", true);
            

        }
    }
}