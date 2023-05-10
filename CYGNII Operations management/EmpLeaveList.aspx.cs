using CYGNII_Operations_management.BusinessLogic;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CYGNII_Operations_management
{
    public partial class EmpLeaveList : System.Web.UI.Page
    {
        DataSet ds;
        DataAccessLayer dal = new DataAccessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindGridview();
        }
        private void BindGridview()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select * from EmployeeLeave", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            gv.DataSource = ds;
            gv.DataBind();
        }

        protected void selectfilename_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGridview();
        }

        protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv.PageIndex = e.NewPageIndex;
        }
    }
}