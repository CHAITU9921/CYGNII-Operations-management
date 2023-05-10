using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Data;
using CYGNII_Operations_management.BusinessLogic;
using System.Configuration;

namespace CYGNII_Operations_management
{
    public partial class AEmployeeDetailsList : System.Web.UI.Page
    {
         
        DataAccessLayer dal = new DataAccessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindGridview();
        }
        private void BindGridview()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select  EmpId,EmpName,DOJ,Gender,DOB,EmailID,Phone_NO,PAN_NO  from tblEmployeeDetails", con);
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