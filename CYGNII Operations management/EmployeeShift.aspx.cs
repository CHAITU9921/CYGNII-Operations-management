using CYGNII_Operations_management.BusinessLogic;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CYGNII_Operations_management
{
    public partial class EmployeeShift : System.Web.UI.Page
    {
        DataAccessLayer dal = new DataAccessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void save_Click(object sender, EventArgs e)
        {
            SqlParameter[] Param = new SqlParameter[]
                                 {
                     new SqlParameter("@ShiftCategory",txtShiftCategory.Text.Trim()),
                    new SqlParameter("@TotalTime",txtTotalTime.Text.Trim()),
                     new SqlParameter("@StartTime",txtStartTime.Text.Trim()),
                     new SqlParameter("@ExitTime",txtExitTime.Text.Trim()),
                     new SqlParameter("@ReturnVal",SqlDbType.Int)
                                };

            int Result = dal.ExecuteStoredProcedureRetnInt("sp_tblShift", Param);
            if (Result == 1)
            {
                msglbl.Text = "<div class='alert alert-success'><p> Inserted successfully </p></div>";

            }
            else if (Result == 0)
            {
                msglbl.Text = "<div class='alert alert-danger'><p> oops!! Internal Server Error.</p></div>";
            }
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            try
            {
                string qry = "update tblShift set  TotalTime='" + txtTotalTime.Text + "'  , StartTime='" + txtStartTime.Text + "', ExitTime='" + txtExitTime.Text + "' where ShiftCategory='" + txtShiftCategory.Text + "' ";

                int retmsg = dal.ExecuteSql(qry);
                if (retmsg == 1)
                {
                    msglbl.Text = "<div class='alert alert-success'><p> Updated successfully </p></div>";

                }
                else
                {
                    msglbl.Text = "<div class='alert alert-danger'><p> oops!! Internal Server Error.</p></div>";
                }
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('updated ','" + msglbl.Text + "',  'info');", true);
                
                Cleartxt();
            }
            catch (Exception ex)
            {
                msglbl.Text = ex.ToString();
            }
        }
        public void Cleartxt()
        {
            txtshiftid.Text = "";
            txtShiftCategory.Text = "";
            txtTotalTime.Text = "";
            txtStartTime.Text = "";
            txtExitTime.Text = "";
        }
    }
}