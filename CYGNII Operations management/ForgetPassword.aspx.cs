using CYGNII_Operations_management.BusinessLogic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CYGNII_Operations_management
{
    public partial class ForgetPassword : System.Web.UI.Page
    {
        DataAccessLayer Dal = new DataAccessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnForgotpass_Click(object sender, EventArgs e)
        {
            try
            {
                string qry = "update tblRegister set Password='" + txtRetypepassword.Text + "'  where UserName='" + txtuserName.Text + "' AND UserType='" + ddlUserType.SelectedValue + "'";
                int retmsg = Dal.ExecuteSql(qry);
                LitErrorMsg.Text = "Password Changed Succesfully ";
            }
            catch (Exception ex)
            {
                LitErrorMsg.Text = ex.ToString();
            }
        }
    }
}