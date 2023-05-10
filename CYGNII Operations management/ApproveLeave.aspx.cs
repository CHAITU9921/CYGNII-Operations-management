using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CYGNII_Operations_management.BusinessLogic;
using System.Web.Services.Description;
using Microsoft.Ajax.Utilities;

namespace CYGNII_Operations_management
{
    public partial class ApproveLeave : System.Web.UI.Page
    {
        DataSet ds;
        DataAccessLayer dal = new DataAccessLayer();
        string str;
        Var usertype = loginUserType;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString);
        private static Var loginUserType;

        protected void Page_Load(object sender, EventArgs e)
        {
            BindGridview();
        }

        protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv.PageIndex = e.NewPageIndex;
        }
        private void BindGridview()
        {

            SqlCommand cmd = new SqlCommand("select * from EmployeeLeave", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            gv.DataSource = ds;
            gv.DataBind();
        }

        protected void gv_SelectedIndexChanged(object sender, EventArgs e)
        {

            

            if (ddlstatus.SelectedItem.Text == "Accept")
            {
                str = "update EmployeeLeave set AdminApprover='yes' where id=" + long.Parse(gv.SelectedRow.Cells[1].Text) + "";
            }
            if(ddlstatus.SelectedItem.Text == "Reject")
            {
                str = "update EmployeeLeave set AdminApprover='No' where id=" + long.Parse(gv.SelectedRow.Cells[1].Text) + "";

            }
            con.Open();
            SqlCommand cmd = new SqlCommand(str, con);
            cmd.ExecuteNonQuery();
            lblMessage.Text = ("id:" + (gv.SelectedRow.Cells[1].Text) + " is approved successfully");
            con.Close();
            BindGridview();


           
        }

        protected void btnAccept_Click(object sender, EventArgs e)
        {

        }

        protected void gv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }
    }


}
