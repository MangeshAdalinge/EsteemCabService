using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using DataAccessLayer;

namespace BusinessLogicLayer
{
   public class ClassAdmin
    {
       public ClassAdmin()
       { }

       //Fields
       public string p_DeptName, p_FName, p_LName, p_Address, p_EMail, p_DL,p_MobileNo;
       


       //Property
       public string DeptName 
       {
           get{ return p_DeptName;}
           set { p_DeptName = value; }

       }

       public string LName
       {
           get { return p_LName; }
           set { p_LName = value; }

       }

       public string FName
       {
           get { return p_FName; }
           set { p_FName = value; }

       }

       public string Address
       {
           get { return p_Address; }
           set { p_Address = value; }

       }

       public string EMail
       {
           get { return p_EMail; }
           set { p_EMail = value; }

       }

       public string MobileNo
       {
           get { return p_MobileNo; }
           set { p_MobileNo = value; }

       }

       public string DL
       {
           get { return p_DL; }
           set { p_DL = value; }

       }

       //Method
       public int InsertAdminDetails()
       {
           SqlParameter[] param = new SqlParameter[7];
           param[0] = new SqlParameter("@DeptName", DeptName);
           param[1] = new SqlParameter("@LName", LName);
           param[2] = new SqlParameter("@FName", FName);
           param[3] = new SqlParameter("@Address", Address);
           param[4] = new SqlParameter("@EMail", EMail);
           param[5] = new SqlParameter("@MobileNo", MobileNo);
           param[6] = new SqlParameter("@DL", DL);

           int res = SQLHelper.ExecuteNonquery(SQLHelper.connection, CommandType.StoredProcedure, "SP_Insert_EcsEmployee", param);
           return res;


       }
    }
}
