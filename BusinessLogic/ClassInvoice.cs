using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using DataAccessLayer;
using System.Data;

namespace BusinessLogicLayer
{
    public class ClassInvoice
    {
        public ClassInvoice()
        { }

        //Fields
        public string p_CustId, p_EmpId, p_BookingId, p_CabId, p_CardId, p_BusinessDate, p_BookingTime, p_StartLocation, p_DestinationLocation, p_TotalDistance, p_EstimatedTime, p_RideStatus;

        //Property
        public string CustId { get { return p_CustId; } set { p_CustId = value; } }
        public string EmpId { get { return p_EmpId; } set { p_EmpId = value; } }
        public string BookingId { get { return p_BookingId; } set { p_BookingId = value; } }
        public string CabId { get { return p_CabId; } set { p_CabId = value; } }
        public string CardId { get { return p_CardId; } set { p_CardId = value; } }
        public string BusinessDate { get { return p_BusinessDate; } set { p_BusinessDate = value; } }
        public string BookingTime { get { return p_BookingTime; } set { p_BookingTime = value; } }
        public string StartLocation { get { return p_StartLocation; } set { p_StartLocation = value; } }
        public string DestinationLocation { get { return p_DestinationLocation; } set { p_DestinationLocation = value; } }
        public string TotalDistance { get { return p_TotalDistance; } set { p_TotalDistance = value; } }
        public string EstimatedTime { get { return p_EstimatedTime; } set { p_EstimatedTime = value; } }
        public string RideStatus { get { return p_RideStatus; } set { p_RideStatus = value; } }


        //Method
        public int InsertInvoice()
        {
            SqlParameter[] param = new SqlParameter[9];
            param[0] = new SqlParameter("@CustId", CustId);
            param[1] = new SqlParameter("@EmpId", EmpId);
            //param[3] = new SqlParameter("@BookingId", BookingId);
            param[2] = new SqlParameter("@CabId", CabId);
           // param[4] = new SqlParameter("@CardId", CardId);
            param[3] = new SqlParameter("@BusinessDate", BusinessDate);
            param[4] = new SqlParameter("@BookingTime", BookingTime);
            param[5] = new SqlParameter("@StartLocation", StartLocation);
            param[6] = new SqlParameter("@DestinationLocation", DestinationLocation);
            param[7] = new SqlParameter("@TotalDistance", TotalDistance);
            param[8] = new SqlParameter("@EstimatedTime", EstimatedTime);



            int res = SQLHelper.ExecuteNonquery(SQLHelper.connection, CommandType.StoredProcedure, "Sp_EcsInsertInvoice", param);
            return res;

        }
    }
}
