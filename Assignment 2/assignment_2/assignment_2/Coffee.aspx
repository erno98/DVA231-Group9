<%@ Page Language="C#" Inherits="assignment_2.Coffee" CodeBehind="Coffee.aspx.cs"%>
<!DOCTYPE html>

<html runat="server">

    <head runat="server">        
        <meta charset="UTF-8">
        <!-- Font awesome icons -->
        <script src="https://kit.fontawesome.com/76e1a337f9.js" crossorigin="anonymous"></script>

        <!-- jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <script src="http://malsup.github.com/jquery.cycle2.js"></script>

        <link rel="stylesheet" href="static/css/styles.css">
        <script src="static/js/script.js"></script>
        
        <script runat="server">
            protected void AdminButton_Click(object sender, EventArgs e)
            {
                Response.Redirect("~/adminpage.aspx", true);
            }
        </script>

        </head>
    
    <body runat="server">
        
        <!-- Content section -->
        <div id="content" runat="server">

            <!-- Grid section -->
            <div class="grid-container" runat="server">

                <!-- Header section -->
                <div class="grid-header">
                    <div class="grid-navbar">
                        <div class="grid-logo">
                            <img class="logo" src="static/img/logo.png">
                        </div>
                        <!-- Upper navbar section -->
                        <div class="grid-uppernavbar">
                            <ul id="navbar-upper" class="navbar">
                                <li><a href="">About coffee</a></li>
                                <li><a href="">How to</a></li>
                                <li><a href="">Cafés</a></li>
                                <li><a href="">Beans</a></li>
                                <li><a href="">Roasting</a></li>
                                <li><a href="">Gallery</a></li>
                                <li><a href="">Follow us</a></li>

                                <!-- Searchbar -->
                                <li class="search-container">
                                    <input id="input-search" type="search" placeholder="Search">
                                    <i id="search-icon" class="fas fa-search"></i>
                                    <i id="share-icon" class="fas fa-share-alt"></i>
                                </li> 
                                <!-- End of searchbar -->
                            </ul>
                        </div>
                        <!-- End of upper navbar -->

                        <div id="search-results-wrapper" style="display: none;">
                            <i class="fas fa-times" id="close-search-results"></i>
                            <ul id="search-results">
                                <p>No results found</p>
                            </ul>
                        </div>

                        <!-- Lower navbar section -->
                        <div class="grid-lowernavbar">
                            <ul id="navbar-lower" class="navbar">
                                <li><a href="">Coffee countries</a></li>
                                <li><a href="">Flavours</a></li>
                                <li><a href="">Coffee news</a></li>
                                <li><a href="">Coffe Festival 2021</a></li>
                                <li><a href="">Brewing</a></li>
                                <li><a href="">Tools</a></li>
                                <li><a href="">Shop</a></li>
                                <li><a href="">Contact</a></li>
                            </ul>
                        </div>
                        <!-- End of lower navbar -->

                    </div>
                 </div> 
                 <!-- End of header -->

                <div class="grid-first-pic cell img-holder cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-speed="1000" data-cycle-pause-on-hover="true">
                    <img class="fit-img" src="static/img/coffee_content1.jpg">
                    <img class="fit-img" src="static/img/coffee_content2.jpg">
                    <img class="fit-img" src="static/img/coffee_content3.jpg"> 

                    <div class="img-text img-text-header">
                        <div class="img-title-box">
                            From fruit to espresso
                        </div>
                        <div class="img-description-box">
                            Our journalist finds the way through a Ethiopian plantation
                        </div>                  
                    </div>

                </div>

                <div class="grid-row3-pic1 cell news-cell">
                    <asp:Literal runat="server" ID="title1"></asp:Literal>
                   <!-- <p class="bottom-border">Coffee news</p> -->
                        <ul class="news-content">
                            <li><a href="">July 28th, 2020: 2020 World Coffee Championships Canceled Due to COVID-19 Travel Restrictions</a></li>
                            <li><a href="">June 1st, 2020: Announcing All-Stars Online and All-Stars x Barista Guild</a></li>
                            <li><a href="">April 21st, 2020: Call for Stories for the World Coffee Championships (WCC) Podcast</a></li>
                           <!-- <li><a href="">March 13th, 2020: World of Coffee & Warsaw World Coffee Championships Postponed to October 15-17, 2020</a></li> -->
                            <!-- asp Literal as variable content -->
                            <li><asp:Literal Text="" runat="server" ID="content1"></asp:Literal></li>
                        </ul>
                    <div class="news-footer">
                        <p>Coffee schedule</p>
                        <p>Upcoming events</p>
                    </div>

                </div>

                <div class="grid-row3-pic2 cell img-holder">
                   <!-- <img class="fit-img" src="static/img/latte_art.jpg"> -->
                    <asp:Image runat="server" ID="image2" ImageUrl="/" CssClass="fit-img" />
                    <div class="img-text">
                       <!-- <div class="img-title-box">
                            Learn about latte art
                        </div> -->
                        <asp:Literal runat="server" ID="title2"></asp:Literal>
                        <div class="img-description-box hover-extend">
                            Barista's guide on perfect milk swan using home tools
                        </div>               
                    </div>
                    <div class="img-description-hidden" style="display:none;">
                        <p>Barista's guide on perfect milk swan using home tools</p>
                       <!-- <p class="extended-description">
                            Learn about how to steam milk for latte art! French press is a perfect tool for frothing milk.
                            First, you need to heat up the milk and then pour it into the french press. Finally, vigorously 
                            start to move the press' knob up and down, until the foam is formed... </p> -->
                        <asp:Literal runat="server" ID="content2" Text=""></asp:Literal>
                        <button class="read-more-btn">Read more</button>
                    </div>   
                </div>

                <div class="grid-row3-pic3 cell img-holder">
                   <!-- <img class="fit-img" src="static/img/beans2.jpg"> -->
                    <asp:Image runat="server" ID="image3" ImageUrl="/" CssClass="fit-img" />
                    <div class="img-text-fill-right">
                        <asp:Literal runat="server" ID="title3" Text=""></asp:Literal>
                       <!-- <h2>A coffee bean is a seed of the Coffea plant and the source for coffee.</h2>
                        <p>The two most economically important varieties of coffee plant are 
                            the <b>Arabica</b> and the <b>Robusta</b></p>

                        <p>Arabica beans consist of <b>0.8–1.4%</b> caffeine and Robusta beans 
                            consist of <b>1.7–4%</b> caffeine</p> -->
                        <asp:Literal runat="server" ID="content3"></asp:Literal>
                    </div>

                </div>

                <div class="grid-row3-pic4 cell"></div>

                <div class="grid-row4-pic1 cell img-holder video-wrapper">
                    <!-- <img class="fit-img" src="static/img/coffee1.jpg"> -->
                    <iframe src="https://www.youtube.com/embed/v_qHWgmsPrw" 
                        frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
                        allowfullscreen>
                    </iframe>
                </div>
                
                <div class="grid-row4-pic2 cell img-holder">
                    <img class="fit-img" src="static/img/coffee3.jpg">
                    <div class="img-text">
                        <div class="img-title-box">
                            To milk or not to milk
                        </div>
                        <div class="img-description-box">
                            Best coffee recipes including for milk lovers
                        </div>                  
                    </div>
                </div>

                <div class="grid-row4-pic3 cell img-holder">
                    <img class="fit-img" src="static/img/coffee4.jpg">
                    <div class="img-text">
                        <div class="img-title-box">
                            Takeaway?
                        </div>
                        <div class="img-description-box">
                            Find nearest cafés
                        </div>                  
                    </div>
                </div>
                    
                <!-- Footer section -->
                <div class="grid-footer" runat="server">
                    <div class="grid-navbar" runat="server">
                        <div class="grid-logofooter">
                            <img class="logo" src="static/img/logo.png">
                        </div>
                        
                        <div class="grid-footerbutton">
                            <button type="button" class="cell" id="more-stories-button">More Stories</button> 
                        </div>
                        
                        <div class="grid-footernavbar" runat="server" >
                            <nav class="footer" runat="server">
                                    <a href="">Coffee Contacts</a>
                                    <a href="">Imprint</a>
                                    <a href="">Privacy</a>
                                    <a href="">Coffee Chief</a>
                                    <a href="">Contacts</a>
                                    <form runat="server">
                                        <asp:Button ID="AdminButton" runat="server" Text="Login as admin" OnClick="AdminButton_Click" />
                                    </form>
                            </nav>
                        </div>
                    </div>
                </div>
                <!-- End of footer -->
            </div>
            <!-- End of grid -->
        </div>
        <!-- End of container -->
    </body>
</html>





