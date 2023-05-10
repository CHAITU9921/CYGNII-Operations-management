using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CYGNII_Operations_management.BusinessLogic;

namespace CYGNII_Operations_management
{
    public partial class empAttend : System.Web.UI.Page
    {
        DataAccessLayer dal = new DataAccessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void Cleartxt()
        {
            txtEmpName.Text = "";
            txtcygniiEmployeecode.Text = "";
            txtCW.Text = "";
            ddlAttendanceStatus.Text = "";
            txtIntime.Text = "";
            txtOuttime.Text = "";

        }
        protected void save_Click(object sender, EventArgs e)
        {
            SqlParameter[] Param = new SqlParameter[]
                    {
                    new SqlParameter("@EmployeeName",txtEmpName.Text.Trim()),
                    new SqlParameter("@Cygnii_Emp_Code",txtcygniiEmployeecode.Text.Trim()),
                    new SqlParameter("@CW",txtCW.Text.Trim()),
                     new SqlParameter("@Customer",txtCustomer.Text.Trim()),
                     new SqlParameter("@Attendance_Status",ddlAttendanceStatus.Text.Trim()),
                    new SqlParameter("@Intime",txtIntime.Text.Trim()),
                    new SqlParameter("@Outtime",txtOuttime.Text.Trim()),
                     new SqlParameter("@ReturnVal",SqlDbType.Int)
                   };

            int Result = dal.ExecuteStoredProcedureRetnInt("sp_tblAttendance", Param);
            if (Result == 1)
            {
                Response.Write("<script>alert('inserted successfully')</script>");
                msglbl.Text = "<div class='alert alert-success'><p> Inserted successfully </p></div>";

            }
            else if (Result == 0)
            {
                Response.Write("<script>alert('oops!! Internal Server Error.')</script>");
               // msglbl.Text = "<div class='alert alert-danger'><p> oops!! Internal Server Error.</p></div>";
            }
        }

        //protected void Update_Click(object sender, EventArgs e)
        //{
        //    //try
        //    //{
        //    //    string qry = "update tblAttendance set EmployeeName='" + txtEmpName.Text + "', " +
        //    //   " CW='" + txtCW.Text + "'  , Customer='" + txtCustomer.Text + "', Attendance_Status='" + ddlAttendanceStatus.SelectedItem.ToString() + "'" +
        //    //   ",Intime='" + txtIntime.Text + "', Outtime='" + txtOuttime.Text + "' where Cygnii_Emp_Code='" + txtcygniiEmployeecode.Text + "' ";

        //    //    int retmsg = dal.ExecuteSql(qry);
        //    //    if (retmsg == 1)
        //    //    {
        //    //        msglbl.Text = "<div class='alert alert-success'><p> Updated successfully </p></div>";

        //    //    }
        //    //    else
        //    //    {
        //    //        msglbl.Text = "<div class='alert alert-danger'><p> oops!! Internal Server Error.</p></div>";
        //    //    }
        //    //    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('updated ','" + retmsg + "',  'info');", true);
        //    //    msglbl.Text = retmsg.ToString();
        //    //    Cleartxt();
        //    //}
        //    //catch (Exception ex)
        //    //{
        //    //    msglbl.Text = ex.ToString();
        //    //}
        //}
    }
}