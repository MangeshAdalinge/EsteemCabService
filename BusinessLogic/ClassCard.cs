using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using DataAccessLayer;
using System.Data;

namespace BusinessLogicLayer
{
    public class ClassCard
    {
        public ClassCard()
        { }

        //Fields
        public string p_CustId, p_CardHolderName, p_CardNumber;

        //Propety
        public string CustId 
        {
            get { return p_CustId; }
            set { p_CustId = value; }
        }

        public string CardHolderName
        {
            get { return p_CardHolderName; }
            set { p_CardHolderName = value; }
        }

        public string CardNumber
        {
            get { return p_CardNumber; }
            set { p_CardNumber = value; }
        }

        //Method
        public int InsertCustomerCarddetails()
        {
            SqlParameter[] param = new SqlParameter[3];
            param[0] = new SqlParameter("@CustId", CustId);
            param[1] = new SqlParameter("@CardHolderName", CardHolderName);
            param[2] = new SqlParameter("@CardNumber", CardNumber);

            int res = SQLHelper.ExecuteNonquery(SQLHelper.connection, CommandType.StoredProcedure, "Sp_EcsInsertCustomerCard", param);
            return res;


        }
    }
}
