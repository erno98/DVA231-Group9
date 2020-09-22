﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Newtonsoft.Json.Linq;

namespace assignment_2
{
    //data-structure for storing the information about the content in one element (title, image, content)
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
        //Create an Array for 3 element, which initial content
        public element_content[] content = new element_content[]
                {   
                    // Constructor(title, imageurl, content)
                    new element_content("","","March 13th, 2020: World of Coffee & Warsaw World Coffee Championships Postponed to October 15-17, 2020"),
                    new element_content("","","Learn about how to steam milk for latte art! French press is a perfect tool for frothing milk. First, you need to heat up the milk and then pour it into the french press. Finally, vigorously start to move the press' knob up and down, until the foam is formed..."),
                    new element_content("","static/img/beans2.jpg","")
                };

        protected void Page_Load(object sender, EventArgs e)
        {
            //if the Login was sucessful, show the Upload-Panel and hide the Login-Panel
            if ((string)Session["login"] == "true")
            {
                //Just show the "login-sucessful" text when u Login and not when u visit the admin-page while u login again
                if((string)Session["first_login"] == "true")
                {
                    Session["first_login"] = "false";
                    First_login.Visible = true;
                }
                else
                {
                    First_login.Visible = false;
                }
                Login_true.Visible = true;
                Login_panel.Visible = false;   
            }
        }

        //Method which is called after try to Login
        protected void Login_Click(object sender, EventArgs e)
        {
            //if username and password are correct, change Session-Login variable and show the Upload-Panel and hide the Login-Panel
            if (username.Text == "admin" && password.Text == "admin")
            {
                Session["login"] = "true";
                Session["first_login"] = "true";
                Login_panel.Visible = false;
                Login_true.Visible = true;
            }
            //else show Login wasnt sucessfull Panel
            else
            {
                Login_false.Visible = true;
            }
        }

        //Method which is called after click the upload-button
        protected void Upload_Click(object sender, EventArgs e)
        {
            //check if the File which was uploaded contains .json (Valid-File check) 
            if(FileUploadControl.HasFile && FileUploadControl.FileName.Contains(".json"))
            {
                //If the File is a json-File Store the File on the Server for processing
                string filename = Path.GetFileName(FileUploadControl.FileName);
                FileUploadControl.SaveAs(Server.MapPath("~/") + filename);

                //Read the json-Content as string
                string text = File.ReadAllText(Server.MapPath("~/")+filename);

                //Parse the string-content to a specific-json object
                JObject json_news = JObject.Parse(text);

                //for every element (3) pass the information to the data-structure
                for (int i = 0; i < 3; i++)
                {
                    content[i].title = json_news.SelectToken("news[" + i + "].title").ToString();
                    content[i].imgurl = json_news.SelectToken("news[" + i + "].imgurl").ToString();
                    content[i].content = json_news.SelectToken("news[" + i + "].content").ToString(); 
                }

                //assign the data-structure to the Session-Array
                Session["content"] = content;

                //tell the admin that the uplaod was successful
                ValidFile.Text = "Upload was successful!";
            }
            //not a json-file so deny it
            else
            {
                ValidFile.Text = "Invalid file format - please upload a JSON-File.";
            }
        }
        //Redirect to Coffeepage
        protected void To_Coffeepage(object sender, EventArgs e)
        {
            Response.Redirect("~/Coffee.aspx", true);
        }
        //Method for Logout, Redirect for Page_Load method
        protected void Logout_Click(object sender, EventArgs e)
        {
            Session["Login"] = "false";
            Response.Redirect(Request.RawUrl);
        }
    }
}