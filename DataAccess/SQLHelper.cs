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
using System.Data.Sql;

namespace DataAccessLayer
{
    public class SQLHelper
    {
    static SqlConnection con;
    static SqlCommand cmd;
    static SqlDataAdapter da;
    static DataSet ds;

    public SQLHelper()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static string connection = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;

    public static int ExecuteNonquery(string connectionString, CommandType commandType, string commandText, SqlParameter[] parameters)
    {
        try
        {
            con = new SqlConnection(connectionString);
            cmd = new SqlCommand(commandText, con);
            cmd.CommandType = commandType;

            foreach (SqlParameter p in parameters)
            {
                if (p.Value == null)
                {                   
                }
                cmd.Parameters.Add(p);               
            }
            con.Open();
            return cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {

            throw new ArgumentException(ex.Message);
        }
        finally
        {
            con.Close();
        }    
    }
    
    }
}
