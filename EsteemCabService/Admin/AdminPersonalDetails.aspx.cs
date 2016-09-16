using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicLayer;

namespace EsteemCabService.Admin
{
    public partial class AdminPersonalDetails : System.Web.UI.Page
    {
        ClassAdmin objAdmin = new ClassAdmin();
        protected void btnSave_Click(object sender, EventArgs e)
        {

            objAdmin.p_DeptName = Convert.ToString(txtDeptName.Text);
            objAdmin.p_FName = Convert.ToString(txtFName.Text);
            objAdmin.p_LName = Convert.ToString(txtLName.Text);
            objAdmin.p_Address = Convert.ToString(txtAddress.Text);
            objAdmin.p_EMail = Convert.ToString(txtEMail.Text);
            objAdmin.p_MobileNo = Convert.ToString(txtMobileNo.Text);
            objAdmin.p_DL = Convert.ToString(txtDlNo.Text);



            int result = objAdmin.InsertAdminDetails();

            if (result > 0)
            {
                lblRes.Text = "Succefully added";
            }
            else
            {
                lblRes.Text = "not added";
            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}