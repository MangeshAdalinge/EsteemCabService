using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using DataAccessLayer;
using System.Data;

namespace BusinessLogicLayer
{
    public class ClassBookingDetails
    {
        public ClassBookingDetails()
        { }
        
        //Fields
        public string p_BusinessDate, p_BookingTime, p_StartLocation, p_DestinationLocation, p_TotalDistance, p_EstimatedTime, p_RideStatus;

        //Property
        public string BusinessDate { get { return p_BusinessDate; } set { p_BusinessDate = value; } }
        public string BookingTime { get { return p_BookingTime; } set { p_BookingTime = value; } }
        public string StartLocation { get { return p_StartLocation; } set { p_StartLocation = value; } }
        public string DestinationLocation { get { return p_DestinationLocation; } set { p_DestinationLocation = value; } }
        public string TotalDistance { get { return p_TotalDistance; } set { p_TotalDistance = value; } }
        public string EstimatedTime { get { return p_EstimatedTime; } set { p_EstimatedTime = value; } }
        public string RideStatus { get { return p_RideStatus; } set { p_RideStatus = value; } }


        //Method
        public int InsertBookingDetails()
        {
            SqlParameter[] param = new SqlParameter[7];
            param[0] = new SqlParameter("@BusinessDate", BusinessDate);
            param[1] = new SqlParameter("@BookingTime", BookingTime);
            param[2] = new SqlParameter("@StartLocation", StartLocation);
            param[3] = new SqlParameter("@DestinationLocation", DestinationLocation);
            param[4] = new SqlParameter("@TotalDistance", TotalDistance);
            param[5] = new SqlParameter("@EstimatedTime", EstimatedTime);
            param[6] = new SqlParameter("@RideStatus", RideStatus);
            

            int res = SQLHelper.ExecuteNonquery(SQLHelper.connection, CommandType.StoredProcedure, "Sp_EcsInsertBookingDetails", param);
            return res;

        }

    }
}
