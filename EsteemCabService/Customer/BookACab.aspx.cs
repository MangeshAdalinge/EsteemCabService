using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using BusinessLogicLayer;
using System.Net;
using System.Net.Mail;

namespace EsteemCabService.Customer
{
    public partial class BookACab : System.Web.UI.Page
    {
        ClassBookingDetails ObjCust = new ClassBookingDetails();
        ClassInvoice ObjI = new ClassInvoice();
        string CabId,CustId, Distance,lbl1,lbl2;

        public void SendMail()
        {
            string smtpAddress = "smtp.mail.yahoo.com";
            int portNumber = 587;
            bool enableSSL = true;

            string emailFrom = "mangesh.adalinge@yahoo.com";
            string password = "9561m@ngesh868068";
            string emailTo = "mangesh.adalinge@yahoo.com";
            string subject = "Booking Successful";
            //string body = "Booking Date: " + DateTime.Now.ToShortDateString() + "</ br> Source: " + Session["SourceLocation"].ToString() + "</ br> Destination: " + Session["DestinationLocation"].ToString() +
            //    "</ br> Distance: " + Session["Distance"].ToString() + "</ br> Duration:" + Session["Duration"].ToString() + "</ br> Rental: " + lblRental.Text + " $ </ br>Ride Cost: " + lblCostOfRide.Text + " $"; ;  

            using (MailMessage mail = new MailMessage())
            {
                mail.From = new MailAddress(emailFrom);
                mail.To.Add(emailTo);
                mail.Subject = subject;
                mail.Body = "<div style=\"font: 15px Calibri, arial;\">";
                mail.Body += "<table width=100%>";
                mail.Body += "<tr><td>Thank you for booking</td></tr>";
                mail.Body += "<tr><td>Booking Date: " + DateTime.Now.ToShortDateString() +
                    "</td></tr> <tr><td> Source: " + Session["SourceLocation"].ToString() + "</td></tr> <tr><td> Destination: "
                    + Session["DestinationLocation"].ToString() + "</td></tr> <tr><td> Distance: " + Session["Distance"].ToString() + "</td> <td> Duration:"
                    + Session["Duration"].ToString() + "</td></tr><tr><td> Rental: " + lblRental.Text + " $ </td><td>Ride Cost: " + lblCostOfRide.Text + " $ </td></tr>";
                mail.Body += "</br> </br><tr><td>Regards,</td></tr>";
                mail.Body += "</table>Esteem Cab Services</div>";
                mail.IsBodyHtml = true;
                
                // Can set to false, if you are sending pure text.

                //mail.Attachments.Add(new Attachment("C:\\SomeFile.txt"));
                //mail.Attachments.Add(new Attachment("C:\\SomeZip.zip"));

                using (SmtpClient smtp = new SmtpClient(smtpAddress, portNumber))
                {
                    smtp.Credentials = new NetworkCredential(emailFrom, password);
                    smtp.EnableSsl = enableSSL;
                    smtp.Send(mail);
                }
            }
        }
        public void BookACab_Click(object sender, EventArgs e)
        {
            ////Establishing the SQL Connection
            //SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConString"].ConnectionString);
            //SqlCommand SqlCommand;
            //string query = "SELECT Rental,(Rental*" + Distance + ") AS RideCost FROM dbo.EcsCabDetails  WHERE CabId = " + CabId;
            //con.Open();

            ////Generating the query to fetch the contact details           
            //SqlCommand = new SqlCommand(query, con);          
           
           

            ObjCust.p_BusinessDate = DateTime.Now.ToShortDateString();
            ObjCust.p_BookingTime = DateTime.Now.ToString("HH:mm:ss");
            ObjCust.p_StartLocation = Session["SourceLocation"].ToString();
            ObjCust.p_DestinationLocation = Session["DestinationLocation"].ToString(); 
            ObjCust.p_TotalDistance =Session["Distance"].ToString();
            ObjCust.p_EstimatedTime = Session["Duration"].ToString(); 
            ObjCust.p_RideStatus = "Not Started";


            
            int Res = ObjCust.InsertBookingDetails();

            ObjI.p_CustId = Session["CustId"].ToString();
            ObjI.p_EmpId = Session["DriverId"].ToString();
            //ObjI.p_BookingId = "";
            ObjI.p_CabId = Session["SelectedCabId"].ToString();
            //ObjI.p_CardId = "";            
            ObjI.p_BusinessDate = Convert.ToString(DateTime.Now.ToShortDateString());
            ObjI.p_BookingTime = Convert.ToString(DateTime.Now.ToString("HH:mm:ss"));
            ObjI.p_StartLocation = Session["SourceLocation"].ToString();
            ObjI.p_DestinationLocation = Session["DestinationLocation"].ToString();
            ObjI.p_TotalDistance = Session["Distance"].ToString();
            ObjI.p_EstimatedTime = Session["Duration"].ToString();
            
            

            string message = string.Empty;
            if (Res < 0)
            {
                 Res = ObjI.InsertInvoice();
                
                if (Res < 0)
                {
                    LblRes.Text = "Booking successful.";
                    SendMail();
                    //Response.Redirect("UserHome.aspx");

                }
                else
                {
                    LblRes.Text = "Booking not successful.";
                }
                

            }
            else
            {
                LblRes.Text = "Registration not successful.";
            }

        }
        public void GetResults(string query,string col1,string col2)
        {
            //Establishing the SQL Connection
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConString"].ConnectionString);           
            SqlCommand SqlCommand;
            SqlDataReader reader;
            SqlDataAdapter adapter = new SqlDataAdapter();
            //Open the connection to db
            con.Open();

            //Generating the query to fetch the contact details           
            SqlCommand = new SqlCommand(query, con);
            //execute the query
            reader = SqlCommand.ExecuteReader();
            if (reader.Read())
            {
                lbl1 = reader[col1].ToString();
                lbl2 = reader[col2].ToString();
            }
            
            
            
        }

        
        protected void Page_Load(object sender, EventArgs e)
        {
                 //Session["SessionCount"] = Convert.ToInt32(Session["SessionCount"]) + 1;
                CabId = Session["SelectedCabId"].ToString();
                CustId = Session["CustId"].ToString();
                Distance = Session["Distance"].ToString();
                lblCabType.Text = Session["Type"].ToString();
                string col1, col2;
                string query = "SELECT Rental,(Rental*" + Distance + ") AS RideCost FROM dbo.EcsCabDetails  WHERE CabId = " + CabId;
                col1 = "Rental";
                col2 = "RideCost";
                //ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Cab Id:  " + Session["SelectedCabId"]  +"  Distance:  " + Session["Distance"] + "');", true);
                //ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Customer Id:  " + Session["CustId"] + "  Duration:  " + Session["Duration"] + "');", true);
                GetResults(query, col1, col2);
                if (lbl1 != null)
                {
                    lblRental.Text = lbl1 + " $";
                    lblCostOfRide.Text = lbl2 + " $";
                    query = "SELECT FirstName,LastName FROM dbo.EcsCustomer  WHERE CustId = " + CustId;
                    col1 = "FirstName";
                    col2 = "LastName";
                    GetResults(query, col1, col2);
                    if (lbl1 != null)
                    {
                        lblFirstName.Text = lbl1 + " " + lbl2;
                        //lblLastName.Text = lbl2;
                        lblDriverName.Text = Session["DriverName"].ToString();
                    }
                    else
                    {
                        LblRes.Text = "Booking can not be at this time ...";
                    }
                }
                else
                {
                    LblRes.Text = "Booking can not be at this time ...";
                }
            }

        
    }
}