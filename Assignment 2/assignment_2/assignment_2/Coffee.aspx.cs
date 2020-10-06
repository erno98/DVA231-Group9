using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace assignment_2
{
    public partial class Coffee : System.Web.UI.Page
    {
        //initial-content for the case that no .json-file was uploaded
        public element_content[] pagecontent = new element_content[]
        {
               new element_content("","",""),
               new element_content("","",""),
               new element_content("","","")
        };
        //if there is content uploaded by a .json-file use it for the content, else use initial data
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionString = @"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = ""C:\Users\lukas\OneDrive\Desktop\Assignment2\DVA231-Group9\Assignment 2\assignment_2\assignment_2\App_Data\DB.mdf""; Integrated Security = True";

            string query = "Select * FROM news WHERE active = 1";

            SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();

            SqlCommand command = new SqlCommand(query, conn);

            SqlDataReader reader = command.ExecuteReader();

            int counter = 0;

            while(reader.Read())
            {
                pagecontent[counter].title = reader.GetValue(0).ToString();
                pagecontent[counter].imgurl = reader.GetValue(1).ToString();
                pagecontent[counter].content = reader.GetValue(2).ToString();
                counter++;
            }

            conn.Close();

            title1.Text = "<p class='bottom-border'>" + pagecontent[0].title + "</p>";
            content1.Text = "<li><a>" + pagecontent[0].content + "</a></li>";

            title2.Text = "<div class='img-title-box'>" + pagecontent[1].title + "</div>";
            image2.ImageUrl = pagecontent[1].imgurl;
            content2.Text = "<p class='extended - description'>" + pagecontent[1].content + "</p>";

            title3.Text = "<h2>" + pagecontent[2].title + "</h2>";
            image3.ImageUrl = pagecontent[2].imgurl;
            content3.Text = "<p>" + pagecontent[2].content + "</p>";

        }

        [System.Web.Services.WebMethod]
        public static Dictionary<int, string> GetData(string query)
        // function to get top 5 results from a input query
        {
            string connectionString = @"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = ""C:\Users\lukas\OneDrive\Desktop\Assignment2\DVA231-Group9\Assignment 2\assignment_2\assignment_2\App_Data\DB.mdf""; Integrated Security = True";

            string search_query = "SELECT id,title FROM news WHERE title LIKE " + "'%" + query + "%'" + " LIMIT 5";

            SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();

            SqlCommand command = new SqlCommand(search_query, conn);

            SqlDataReader reader = command.ExecuteReader();

            var d = new Dictionary<int, string>
            {
                { 1, "" }, { 2, ""}, {3, ""}, { 4, ""}, {5, ""}
            };

            while(reader.Read())
            {
                d[(int)reader.GetValue(0)] = reader.GetValue(1).ToString();
            }

            conn.Close();

            return d;
        }
        

    }
}