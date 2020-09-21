using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Newtonsoft.Json.Linq;

namespace assignment_2
{
    
    public class element_content
    {
        public element_content(string t, string i, string c)
        {
            this.title = t;
            this.imgurl = i;
            this.content = c;
        }
        public string title { get; set; }
        public string imgurl { get; set; }
        public string content { get; set; }

    }

    public partial class adminpage : System.Web.UI.Page
    {
        public element_content[] content = new element_content[]
                {
                    new element_content("","","March 13th, 2020: World of Coffee & Warsaw World Coffee Championships Postponed to October 15-17, 2020"),
                    new element_content("","","Learn about how to steam milk for latte art! French press is a perfect tool for frothing milk. First, you need to heat up the milk and then pour it into the french press. Finally, vigorously start to move the press' knob up and down, until the foam is formed..."),
                    new element_content("","static/img/beans2.jpg","")
                };

        protected void Page_Load(object sender, EventArgs e)
        {
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
            if(FileUploadControl.HasFile && FileUploadControl.FileName.Contains(".json"))
            {
                string filename = Path.GetFileName(FileUploadControl.FileName);
                FileUploadControl.SaveAs(Server.MapPath("~/") + filename);

                string text = File.ReadAllText(Server.MapPath("~/")+filename);


                //string teststring = @"{""news"":[{""title"":""title1"",""imgurl"":""img1"" ,""content"":""content1""}, {""title"":""title2"",""imgurl"":""img2"" ,""content"":""content2""}, {""title"":""title3"",""imgurl"":""img3"" ,""content"":""content3""}]}";

                JObject json_news = JObject.Parse(text);

               /* element_content[] content = new element_content[]
                {
                    new element_content(),
                    new element_content(),
                    new element_content()
                }; */

                for (int i = 0; i < 3; i++)
                {
                    content[i].title = json_news.SelectToken("news[" + i + "].title").ToString();
                    content[i].imgurl = json_news.SelectToken("news[" + i + "].imgurl").ToString();
                    content[i].content = json_news.SelectToken("news[" + i + "].content").ToString(); 
                }

                Session["content"] = content;

                ValidFile.Text = "Upload was successful!";
            }
            else
            {
                ValidFile.Text = "Invalid file format - please upload a JSON-File.";
            }
        }

        protected void To_Coffeepage(object sender, EventArgs e)
        {
            Response.Redirect("~/Coffee.aspx", true);
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session["Login"] = "false";
            Response.Redirect(Request.RawUrl);
        }
    }
}