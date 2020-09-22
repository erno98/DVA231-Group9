using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace assignment_2
{
    public partial class Coffee : System.Web.UI.Page
    {
        //initial-content for the case that no .json-file was uploaded
        public element_content[] pagecontent = new element_content[]
        {
               new element_content("","","March 13th, 2020: World of Coffee & Warsaw World Coffee Championships Postponed to October 15-17, 2020"),
               new element_content("","","Learn about how to steam milk for latte art! French press is a perfect tool for frothing milk. First, you need to heat up the milk and then pour it into the french press. Finally, vigorously start to move the press' knob up and down, until the foam is formed..."),
               new element_content("","static/img/beans2.jpg","")
        };
        //if there is content uploaded by a .json-file use it for the content, else use initial data
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["content"] == null)
            {
                variable_content1.Text = pagecontent[0].content;
                variable_content2.Text = pagecontent[1].content;
                variable_content3.ImageUrl = pagecontent[2].imgurl;
            }
            else
            {
                pagecontent = Session["content"] as element_content[];
                variable_content1.Text = pagecontent[0].content;
                variable_content2.Text = pagecontent[1].content;
                variable_content3.ImageUrl = pagecontent[2].imgurl;
            }
            
        }
    }
}