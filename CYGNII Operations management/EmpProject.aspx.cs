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

namespace CYGNII_Operations_management
{
    public partial class EmpProject : System.Web.UI.Page
    {
        DataAccessLayer dal = new DataAccessLayer();

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void BindGridview()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select * from tblEmployeeProject", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            gv.DataSource = ds;
            gv.DataBind();
        }
        protected void btndisplay_Click(object sender, EventArgs e)
        {
            BindGridview();
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            SqlParameter[] Param = new SqlParameter[]
                 {
                    new SqlParameter("@ProjectTitle",txtprojecttitle.Text.Trim()),
                    new SqlParameter("@Description",txtdescription.Text.Trim()),
                    new SqlParameter("@StartDate",txtstartdate.Text.Trim()),
                     new SqlParameter("@ClientID",txtclientid.Text.Trim()),
                     new SqlParameter("@EndDate",txtenddate.Text.Trim()),
                    //new SqlParameter("@Status",txtstatus.Text.Trim()),
                    new SqlParameter("@Status",ddlstatus.Text.Trim()),
                    new SqlParameter("@Language",txtlanguage.Text.Trim()),
                    new SqlParameter("@ReturnVal",SqlDbType.Int)
                };

            int Result = dal.ExecuteStoredProcedureRetnInt("sp_tblEmployeeProject", Param);
            if (Result == 1)
            {
                msglbl.Text = "<div class='alert alert-success'><p> Inserted successfully </p></div>";

            }
            else if (Result == 0)
            {
                msglbl.Text = "<div class='alert alert-danger'><p> oops!! Internal Server Error.</p></div>";
            }
        }

        protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv.PageIndex = e.NewPageIndex;
        }
    }
}