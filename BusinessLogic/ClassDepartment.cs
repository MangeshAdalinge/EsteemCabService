using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using DataAccessLayer;

namespace BusinessLogicLayer
{
    public class ClassDepartment
    {
        public ClassDepartment()
        { }

        //Fields
        public string p_DeptName,p_DeptType;

        //Properties
        public string DeptName 
        {
            get { return p_DeptName; }
            set { p_DeptName = value; }
        }
        public string DeptType
        {
            get { return p_DeptType; }
            set { p_DeptType = value; }
        }


        //Method
        public int insertDepartmentDetails()
        {
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@DeptName", DeptName);
            param[1] = new SqlParameter("@DeptType", DeptType);

            int res = SQLHelper.ExecuteNonquery(SQLHelper.connection, CommandType.StoredProcedure, "SP_Insert_EcsDepartment", param);
            return res;
            
        }

    }
}
