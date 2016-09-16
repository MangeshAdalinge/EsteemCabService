using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Net;
using System.Net.Mail;

namespace EsteemCabService.Customer
{
    public partial class RideStatus : System.Web.UI.Page
    {
        public void SendMail()
        {
            string smtpAddress = "smtp.mail.yahoo.com";
            int portNumber = 587;
            bool enableSSL = true;

            string emailFrom = "mangesh.adalinge@yahoo.com";
            string password = "9561m@ngesh868068";
            string emailTo = "mangesh.adalinge@yahoo.com";
            string subject = "Booking Successful";
            //string body = "Booking Date: " + DateTime.Now.ToShortDateString() + "</ br> Source: ";
            //    //+ Session["SourceLocation"].ToString() + "</ br> Destination: " + Session["DestinationLocation"].ToString() +
            //    //"</ br> Distance: " + Session["Distance"].ToString() + "</ br> Duration:" + Session["Duration"].ToString() + "</ br> Rental: " + lblRental.Text + " $ </ br>Ride Cost: " + lblCostOfRide.Text + " $"; 

            using (MailMessage mail = new MailMessage())
            {
                mail.From = new MailAddress(emailFrom);
                mail.To.Add(emailTo);
                mail.Subject = subject;
                mail.Body = "<div style=\"font: 15px Calibri, arial;\">";
                mail.Body += "<table width=100%>";
                mail.Body += "<tr><td>Thank you for booking</td></tr>";
                mail.Body += "<tr><td>Booking Date: " + DateTime.Now.ToShortDateString() + "</td></tr> <tr><td> Source: </td></tr>";
                    //    //+ Session["SourceLocation"].ToString() + "</ br> Destination: " + Session["DestinationLocation"].ToString() +
                    //    //"</ br> Distance: " + Session["Distance"].ToString() + "</ br> Duration:" + Session["Duration"].ToString() + "</ br> Rental: " + lblRental.Text + " $ </ br>Ride Cost: " + lblCostOfRide.Text + " $"; ;
                mail.Body += "<tr><td>Regards,</td></tr>";
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
        private String strConnString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Session["SessionCount"] = Convert.ToInt32("2");
                this.BindData();
               // SendMail();
                

            }

        }

        private DataTable GetData(SqlCommand cmd)
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(strConnString);
            SqlDataAdapter sda = new SqlDataAdapter();
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            con.Open();
            sda.SelectCommand = cmd;
            sda.Fill(dt);
            return dt;
        }

        private void BindData()
        {

            string deptId = null;
            string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            if (Session["CustId"].ToString() != null)
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                
                        con.Open();
                        SqlCommand cmd1 = new SqlCommand("SELECT DeptId FROM dbo.EcsCustomer WHERE CustId = " + Session["CustId"].ToString(), con);

                        using (SqlDataReader reader = cmd1.ExecuteReader())
                        {

                            if (reader.Read())
                            {
                                deptId = reader["DeptId"].ToString();
                            }

                        }
                        if (deptId == "3")
                        {

                            using (SqlCommand cmd = new SqlCommand("SELECT BillNumber,CabName,RideStatus,EstimatedTime,TotalDistance,Rental$ FROM dbo.VRideStatus WHERE CustId='" + Session["CustId"].ToString() + "' Order by CustId"))
                            {
                                using (SqlDataAdapter sda = new SqlDataAdapter())
                                {
                                    cmd.Connection = con;
                                    sda.SelectCommand = cmd;
                                    using (DataTable dt = new DataTable())
                                    {
                                        sda.Fill(dt);
                                        GridView1.DataSource = dt;
                                        GridView1.DataBind();
                                        if (dt.Rows.Count == 0)
                                        {
                                            lblRes.Text = "You have not taken any ride yet";
                                        }
                                    }

                                }
                            }
                        }
                        else
                        {
                            lblRes.Text = "Details can not be updated a this time ..";
                        }
                    }               
                
            }
            else
            {
                lblRes.Text = "Details can not be displayed a this time ..";
            }

        }


        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }

        protected void AddNewCustomer(object sender, EventArgs e)
        {

        }

        protected void DeleteCustomer(object sender, EventArgs e)
        {
            LinkButton lnkRemove = (LinkButton)sender;
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "delete from  EcsCustomer where " +
            "CustId=@CustId;" +
             "select * from EcsCustomer where  " + "CustId=@CustId " + "Order by CustId";
            cmd.Parameters.Add("@CustId", SqlDbType.VarChar).Value = lnkRemove.CommandArgument;
            GridView1.DataSource = GetData(cmd);
            GridView1.DataBind();
        }


        protected void EditCustomer(object sender, GridViewEditEventArgs e)
        {

            GridView1.EditIndex = e.NewEditIndex;

            BindData();

        }

        protected void CancelEdit(object sender, GridViewCancelEditEventArgs e)
        {

            GridView1.EditIndex = -1;

            BindData();

        }

        protected void UpdateCustomer(object sender, GridViewUpdateEventArgs e)
        {

            string CustId = ((Label)GridView1.Rows[e.RowIndex]

                                .FindControl("lblCustId")).Text;

            string FirstName = ((TextBox)GridView1.Rows[e.RowIndex]

                                .FindControl("txtFirstName")).Text;

            string LastName = ((TextBox)GridView1.Rows[e.RowIndex]

                                .FindControl("txtLastName")).Text;

            string Address = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtAddress")).Text;
            string Email = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEmail")).Text;
            string MobileNo = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtMobileNo")).Text;




            SqlConnection con = new SqlConnection(strConnString);

            SqlCommand cmd = new SqlCommand();

            cmd.CommandType = CommandType.Text;

            cmd.CommandText = "update EcsCustomer set FirstName=@FirstName, LastName=@LastName, Address=@Address,Email=@Email,MobileNo=@MobileNo where CustId='" + Session["CustId"].ToString() + "'; " +

             "select * from EcsCustomer where CustId='" + CustId + "' Order by CustId";

            cmd.Parameters.Add("@CustId", SqlDbType.VarChar).Value = CustId;
            cmd.Parameters.Add("@FirstName", SqlDbType.VarChar).Value = FirstName;
            cmd.Parameters.Add("@LastName", SqlDbType.VarChar).Value = LastName;
            cmd.Parameters.Add("@Address", SqlDbType.VarChar).Value = Address;
            cmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = Email;
            cmd.Parameters.Add("@MobileNo", SqlDbType.VarChar).Value = MobileNo;


            GridView1.EditIndex = -1;
            GridView1.DataSource = GetData(cmd);
            GridView1.DataBind();

        }






    }
}