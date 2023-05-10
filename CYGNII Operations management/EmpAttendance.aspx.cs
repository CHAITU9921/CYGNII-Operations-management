using CYGNII_Operations_management.BusinessLogic;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace CYGNII_Operations_management
{
    public partial class EmpAttendance : System.Web.UI.Page
    {
        string EmployeeName = " ";
        string Cygnii_Emp_Code = " ";
        int CW = 0;
        string Customer = " ";
        string Attendance_Status = " ";
        string Dates = "";
        string Intime = " ";
        string Outtime = " ";
        DataAccessLayer dal = new DataAccessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            EmployeeName = Login.Name.ToString();
            checkAttendance();

        }

        public void checkAttendance()
        {
            try
            {
                Dates = DateTime.Now.ToString("M/d/yyyy");
                string qry = "select Intime from tblAttendance   where EmployeeName='" + EmployeeName + "' and Dates='" + Dates + "' ";
               string retresult = dal.chkAlreadyExist(qry);
                if (retresult == "Record already exist")
                {
                    btntimein.Enabled = false;
                }
                else
                {
                    btntimein.Enabled = true;
                }
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = ex.ToString();

            }
        }

        protected void btntimein_Click(object sender, EventArgs e)
        {
            Intime = DateTime.Now.ToString("HH:mm:ss tt");
            Dates = DateTime.Now.ToString("M/d/yyyy");
            SqlParameter[] Param = new SqlParameter[]
            {
           new SqlParameter("@EmployeeName",EmployeeName),
           new SqlParameter("@Cygnii_Emp_Code", Cygnii_Emp_Code),
           new SqlParameter("@CW",CW),
           new SqlParameter("@Customer",txtCustomer.Text.Trim()),
           new SqlParameter("@Attendance_Status",ddlAttendanceStatus.Text.Trim()),
           new SqlParameter("@Dates", Dates.ToString()),
           new SqlParameter("@Intime", Intime.ToString()),
           new SqlParameter("@Outtime",Outtime.ToString()),
           new SqlParameter("@ReturnVal",SqlDbType.Int)
            };
            int Result = dal.ExecuteStoredProcedureRetnInt("sp_Attendance", Param);
            if (Result == 1)
            {
                lblSuccessMessage.Text = $"<div class='alert alert-success'><p> Thank you for checking in. Your attendance has been recorded for {Dates} at {Intime} </p></div>";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Invalid UserId Or Password !', '  Kindly try forgot Password Options ', 'error');", true);

            }
            else if (Result == 0)
            {
                lblErrorMessage.Text = "<div class='alert alert-danger'><p> oops!! Internal Server Error.</p></div>";
            }
        }

        protected void btntimeout_Click(object sender, EventArgs e)
        {
            Outtime = DateTime.Now.ToString("HH:mm:ss tt");
            Dates = DateTime.Now.ToString("M/d/yyyy");
            try
            {
                string qry = "update tblAttendance set Outtime='" + Outtime + "' where EmployeeName='" + EmployeeName + "' and Dates='" + Dates + "' ";
                int retmsg = dal.ExecuteSql(qry);
                if (retmsg == 1)
                {
                    lblSuccessMessage.Text = $"<div class='alert alert-success'><p>Thank you for checking out.  Your attendance has been recorded for {Dates} at {Outtime}   </p></div>";
                }
                else
                {
                    lblErrorMessage.Text = "<div class='alert alert-danger'><p> oops!! Internal Server Error.</p></div>";
                }
                //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('updated ','" + retmsg + "',  'info');", true);
                //msglbl.Text = retmsg.ToString();

            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = ex.ToString();
            }
        }

        protected void ddlAttendanceStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlAttendanceStatus.SelectedItem.ToString() == "Present in office")
            {
                txtCustomer.Visible = false;
                lblCustomer.Visible = false;
            }
            else
            {
                txtCustomer.Visible = true;
                lblCustomer.Visible = true;
            }
        }
    }
}