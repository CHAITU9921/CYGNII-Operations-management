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
    public partial class EmployeeDetails : System.Web.UI.Page
    {
        DataAccessLayer dal = new DataAccessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void Cleartxt()
        {
            txtempid.Text = "";
            txtEmpName.Text = "";
            txtDOfJoin.Text = DateTime.Now.ToShortDateString(); ;
            rblistgender.SelectedIndex = 0;
            txtDOfBirth.Text = DateTime.Now.ToShortDateString();
            txtEmailId.Text = "";
            txtPhoneNo.Text = "";
            txtPan.Text = "";

        }

        protected void save_Click(object sender, EventArgs e)
        { 
                     SqlParameter[] Param = new SqlParameter[]
                     {
                    new SqlParameter("@EmpId",txtempid.Text.Trim()),
                    new SqlParameter("@EmpName",txtEmpName.Text.Trim()),
                    new SqlParameter("@DOJ",txtDOfJoin.Text.Trim()),
                     new SqlParameter("@Gender",rblistgender.Text.Trim()),
                     new SqlParameter("@DOB",txtDOfBirth.Text.Trim()),
                    new SqlParameter("@EmailID",txtEmailId.Text.Trim()),
                    new SqlParameter("@Phone_NO",txtPhoneNo.Text.Trim()),
                    new SqlParameter("@PAN_NO",txtPan.Text.Trim()),
                     new SqlParameter("@ReturnVal",SqlDbType.Int)
                    };
 
            int Result = dal.ExecuteStoredProcedureRetnInt("sp_EmployeeDetails", Param);
            if (Result == 1)
            {
                msglbl.Text = "<div class='alert alert-success'><p> Inserted successfully </p></div>";
               
            }
            else if (Result == 0)
            {
                msglbl.Text = "<div class='alert alert-danger'><p> oops!! Internal Server Error.</p></div>";
            }
            

        }
        protected void clear_Click(object sender, EventArgs e)
        {
            Cleartxt();
        }
        protected void Update_Click(object sender, EventArgs e)
        {
            try
            {
                DateTime DOfBirth = DateTime.ParseExact(txtDOfBirth.Text,"dd-MM-yyyy",System.Globalization.CultureInfo.InvariantCulture);
                string qry = "update EmployeeDetails set EmpName='" + txtEmpName.Text + "',DoJ='" + txtDOfJoin.Text + "' , " +
                " Gender='" + rblistgender.SelectedValue.ToString() + "'  , DOB='" + DOfBirth.ToString() + "', EmailID='" + txtEmailId.Text + "'" +
                ",Phone_No='" + txtPhoneNo.Text + "', PAN_No='" + txtPan.Text + "' where EmpId='" + txtempid.Text + "'";

                int retmsg = dal.ExecuteSql(qry);
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('updated ','" + retmsg + "',  'info');", true);
                msglbl.Text = retmsg.ToString();
                Cleartxt();
            }
            catch (Exception ex)
            {
                msglbl.Text = ex.ToString();
            }
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            try
            {
                string qry = "delete from EmployeeDetails where EmpId='" + Int64.Parse(txtempid.Text) + "'";
                int retmsg = dal.ExecuteSql(qry);
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Good job!', '" + retmsg + "', 'error');", true);
                msglbl.Text = retmsg.ToString();
                Cleartxt();
            }
            catch (Exception ex)
            {
                msglbl.Text = ex.ToString();
            }
        }
    }
}