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
    public partial class Login : System.Web.UI.Page
    {
        public static string Name { get; set; } 

        string FileName;
         InputValidation ival = new InputValidation();
        DataAccessLayer Dal = new DataAccessLayer();
        public static string loginUserID, loginUserType, loginUserName, loginUserPassword; // create shared variable to access all forms
        public static class UserRole
        {
            public static string Role { get; set; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["UserName"] != null && Request.Cookies["Password"] != null)
                {
                    txtuserName.Text = Request.Cookies["UserName"].Value;
                    txtpassword.Attributes["value"] = Request.Cookies["Password"].Value;
                }
            }
        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            try
            {
                string str = "";
                //if(ddlUserType.SelectedIndex == 0)
                //{
                //    str += "Values is a required";
                //}
                //if (ddlUserType.SelectedValue != null && ddlUserType.SelectedValue != "" && ddlUserType.SelectedValue != "Select User type")
                //{
                //    str += "Values is required";
                //}
                if (ival.IsTextBoxEmpty(txtuserName.Text.Trim()))
                {
                    str += "Please enter userid Address</br>";

                }

                if (ival.IsTextBoxEmpty(txtpassword.Text.Trim()))
                {
                    str += "<Div Class='Error'>" + "Please enter password" + "</Div>";

                }
                else
                {
                    SqlParameter[] Parameter = new SqlParameter[]
                    {
                        new SqlParameter("@Usertype",ddlUserType.SelectedValue),
                        new SqlParameter("@UserName",txtuserName.Text.Trim()),
                        new SqlParameter("@password",txtpassword.Text.Trim()),
                        new SqlParameter("@ReturnVal", Convert.ToInt32(SqlDbType.Int))
                    };
                    int res = Dal.ExecuteStoredProcedureRetnInt("sp_CheckLogin", Parameter);

                    
                    if (CbRemberme.Checked)
                    {
                        Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(30);
                        Response.Cookies["Password"].Expires = DateTime.Now.AddDays(30);
                    }
                    else
                    {
                        Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);

                    }
                    Response.Cookies["UserName"].Value = txtuserName.Text.Trim();
                    Response.Cookies["Password"].Value = txtpassword.Text.Trim();

                    if (res != 0)
                    {
                        string username = Name = txtuserName.Text;

                        Session["Id"] = res.ToString();
                        Session["UserType"] = "EMPLOYEE";

                        if (ddlUserType.SelectedValue == "Admin")
                        {
                            Response.Redirect("AdminHome.aspx", false);
                        }

                        if (ddlUserType.SelectedValue == "Employee")
                        {
                            Response.Redirect("EmpAttendance.aspx", false);
                        }
                    }

                    else
                    {
                         ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Invalid UserId Or Password !', '  Kindly try forgot Password Options ', 'error');", true);

                    }

                }

            }
            catch (Exception ex)
            {
                LitErrorMsg.Text = ex.Message;
            }

        }
    }
}
