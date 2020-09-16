using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace assignment_2
{
    public partial class adminpage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if ((string)Session["Login"] == "true")
            {
                Login_panel.Visible = false;
                Login_true.Visible = true;
            }
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            if(username.Text == "admin" && password.Text == "admin")
            {
                Session["Login"] = "true";
                Login_panel.Visible = false;
                Login_true.Visible = true;
            }
            else
            {
                Login_false.Visible = true;
            }
        }

        protected void Upload_Click(object sender, EventArgs e)
        {

        }
    }
}