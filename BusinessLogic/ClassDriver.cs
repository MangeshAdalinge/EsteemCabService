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
    public class ClassDriver
    {

        public ClassDriver()
        { }

        //Fields
        public string p_Type, p_Name, p_Color, p_City, p_State, p_Country, p_NumberPlate;
        public float p_Rental, p_Latitude, p_Longitude, p_DriverId;

        //Properties
        public string NumberPlate
        {
            get { return p_NumberPlate; }
            set { p_NumberPlate = value; }
        }
        public float DriverId
        {
            get { return p_DriverId; }
            set { p_DriverId = value; }
        }
        public string Type 
        {
            get { return p_Type; }
            set { p_Type = value; }
        }

        public string Name
        {
            get { return p_Name; }
            set { p_Name = value; }
        }

        public string Color
        {
            get { return p_Color; }
            set { p_Color = value; }
        }

        public float Rental
        {
            get { return p_Rental; }
            set { p_Rental = value; }
        }

        public float Latitude
        {
            get { return p_Latitude; }
            set { p_Latitude = value; }
        }

        public float Longitude
        {
            get { return p_Longitude; }
            set { p_Longitude = value; }
        }

        public string City
        {
            get { return p_City; }
            set { p_City = value; }
        }

        public string State
        {
            get { return p_State; }
            set { p_State = value; }
        }

        public string Country
        {
            get { return p_Country; }
            set { p_Country = value; }
        }

        //Method
        public int InsertDriverDetails()
        {
            SqlParameter[] param = new SqlParameter[11];
            param[0] = new SqlParameter("@Type", Type);
            param[1] = new SqlParameter("@Name", Name);
            param[2] = new SqlParameter("@Color", Color);
            param[3] = new SqlParameter("@Rental", Rental);
            param[4] = new SqlParameter("@Latitude", Latitude);
            param[5] = new SqlParameter("@Longitude", Longitude);
            param[6] = new SqlParameter("@City", City);
            param[7] = new SqlParameter("@State", State);
            param[8] = new SqlParameter("@Country", Country);
            param[9] = new SqlParameter("@DriverId", DriverId);
            param[10] = new SqlParameter("@NumberPlate", NumberPlate);

            int res = SQLHelper.ExecuteNonquery(SQLHelper.connection, CommandType.StoredProcedure,"SP_Insert_EcsCabDetails", param);
            return res;


        }
    }
}
