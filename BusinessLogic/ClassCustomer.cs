using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using DataAccessLayer;

namespace BusinessLogicLayer
{
    public class ClassCustomer
    {
        public ClassCustomer()
        { }

        //Fields
        public string p_FirstName, p_LastName, p_Address, p_Email,  p_Feedback, p_MobileNo,p_UserName,p_Password;

        //Property
        
          public string FirstName 
        {
            get { return p_FirstName; }
            set { p_FirstName = value; }
        }

        public string LastName
        {
            get { return p_LastName; }
            set { p_LastName = value; }
        }

        public string Address
        {
            get { return p_Address; }
            set { p_Address = value; }
        }

        public string Email
        {
            get { return p_Email; }
            set { p_Email = value; }
        }

        public string MobileNo
        {
            get { return p_MobileNo; }
            set { p_MobileNo = value; }
        }

        public string Feedback
        {
            get { return p_Feedback; }
            set { p_Feedback = value; }
        }

        public string UserName
        {
            get { return p_UserName; }
            set { p_UserName = value; }
        }

        public string Password
        {
            get { return p_Password; }
            set { p_Password = value; }
        }
        

        

        //Method
        public int InsertCustomerDetails()
        {
            SqlParameter[] param = new SqlParameter[8];
            param[0] = new SqlParameter("@FirstName", FirstName);
            param[1] = new SqlParameter("@LastName", LastName);
            param[2] = new SqlParameter("@Address", Address);
            param[3] = new SqlParameter("@Email", Email);
            param[4] = new SqlParameter("@MobileNo", MobileNo);
            param[5] = new SqlParameter("@Feedback", Feedback);
            param[6] = new SqlParameter("@UserName", UserName);
            param[7] = new SqlParameter("@Password", Password);           

            int res = SQLHelper.ExecuteNonquery(SQLHelper.connection, CommandType.StoredProcedure, "Sp_EcsInsertCustomer", param);
           
            return res;


        }
    }
}
