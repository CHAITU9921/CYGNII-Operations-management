using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CYGNII_Operations_management.BusinessLogic;
using System.Net.Mail;
using System.Text;

namespace CYGNII_Operations_management
{
    public partial class EmpLeave : System.Web.UI.Page
    {
        DataAccessLayer dal = new DataAccessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void Cleartxt()
        {
            //txtdesignation.Text = "";
            txtempname.Text = "";
            ddlLeavetype.SelectedIndex = 0;
            txtcomment.Text = "";
            txtfromdate.Text = DateTime.Now.ToShortDateString();
            txttodate.Text = DateTime.Now.ToShortDateString();
        }
        protected void btnApplyLeave_Click(object sender, EventArgs e)
        {
            SqlParameter[] Param = new SqlParameter[]
                  {
                    new SqlParameter("@Designation",""),
                    new SqlParameter("@EmpName",txtempname.Text.Trim()),
                    new SqlParameter("@LeaveType",ddlLeavetype.Text.Trim()),
                     new SqlParameter("@Comment",txtcomment.Text.Trim()),
                     new SqlParameter("@FromDate",txtfromdate.Text.Trim()),
                    new SqlParameter("@ToDate",txttodate.Text.Trim()),
                     new SqlParameter("@ReturnVal",SqlDbType.Int)
                 };

            int Result = dal.ExecuteStoredProcedureRetnInt("sp_EmployeeLeave", Param);
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

        void SentNotification(string Email)
        {
            try
            {
                if (Email != "")
                {
                    MailMessage mailMsg = new MailMessage("fromAddress", Email);
                    //Add Mail Subject
                    mailMsg.Subject = "";
                    mailMsg.SubjectEncoding = Encoding.UTF8;
                    ///add mail body
                    mailMsg.Body = "";
                    mailMsg.BodyEncoding = Encoding.UTF8;
                    mailMsg.IsBodyHtml = true;
                    System.Net.Mail.SmtpClient client = new SmtpClient();
                    client.Credentials = new System.Net.NetworkCredential("FromAddress", "Password");
                    client.Port = 587;//gmail port no
                    client.Host = "smtp.outlook.com";
                    client.EnableSsl = true;
                    client.Send(mailMsg);
                }
                // lblError.Text = "Mail Has Been Sent Successfully";
            }
            catch (System.Net.Mail.SmtpException ex)
            {
                msglbl .Text="Mail Error : " + ex.Message;
            }
            catch (System.NullReferenceException ex)
            {
                msglbl.Text= ex.Message;
            }
        }
        }
    }