using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CYGNII_Operations_management.BusinessLogic;
using System.Configuration;
using System.Drawing;
using System.Web.Services.Description;
using Newtonsoft.Json.Linq;

namespace CYGNII_Operations_management
{
    public partial class RegisterEmp : System.Web.UI.Page
    {
        InputValidation ival = new InputValidation();
        DataAccessLayer Dal = new DataAccessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            string Message = "";

           
            if (ival.IsTextBoxEmpty(txtpassword.Text.Trim()))
            {
                Message += "* Please Enter Password<br>";
            }
            if (ival.IsTextBoxEmpty(txtRetypepassword.Text.Trim()))
            {
                Message += "* Please Enter first Name<br>";

            }
            if (Message.Length > 0)
            {
                LitErrorMsg.Text = "<div class='alert alert-danger'><p>" + Message + "</p></div>";
            }
            else
            {
                String VerificatioCode = "emp" + Session.SessionID; // pending work 
                SqlParameter[] Param = new SqlParameter[]
                { 
                    new SqlParameter("@UserType",ddlUserType.SelectedItem.ToString()),
                    new SqlParameter("@UserName",txtuserName.Text.Trim()),
                    new SqlParameter("@Password",txtpassword.Text.Trim()), 
                    new SqlParameter("@VerificationCode",VerificatioCode),
                    new SqlParameter("@ReturnVal", Convert.ToInt32(SqlDbType.Int))
                };

                int Result = Dal.ExecuteStoredProcedureRetnInt("sp_RegisterInsert", Param);
                if (Result == 1)
                {
                     ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Awesome !', ' Register successfully ', 'success');", true);
                }
                else if (Result == 0)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Awesome !', ' This account already exists with Cygnii.<br> Kindly try forgot Password Options.', 'error');", true);
                 }
            }
        }
    }
}
