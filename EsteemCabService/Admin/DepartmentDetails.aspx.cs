using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicLayer;

namespace EsteemCabService
{
    public partial class DepartmentDetails : System.Web.UI.Page
    {

        ClassDepartment ObjDept = new ClassDepartment();
        protected void BtnSaveDeptDetails_Click(object sender, EventArgs e)
        {
            ObjDept.p_DeptName = Convert.ToString(txtDeptName.Text);
            ObjDept.p_DeptType = Convert.ToString(txtDeptType.Text);

            int result = ObjDept.insertDepartmentDetails();

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