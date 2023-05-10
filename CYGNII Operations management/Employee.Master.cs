using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CYGNII_Operations_management
{
    public partial class Employee : System.Web.UI.MasterPage
    {
        public string EmpName = Login.Name.ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
           name1.Text=name2.Text= name.Text = EmpName;
        }
    }
}