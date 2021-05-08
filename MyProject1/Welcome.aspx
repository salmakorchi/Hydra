 <%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="MyProject1.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="MyCss/CssWelcome.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- SlideShow --%>
    
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="Img/Slideshow/FirstPicture.jpg" alt="First slide">
         <div class="carousel-caption d-none d-md-block">
    <h5>New Arrivals</h5>
    <p>The laptops of your dreams </p>
  </div>
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="Img/Slideshow/SecondPicture.jpg" alt="Second slide">
              <div class="carousel-caption d-none d-md-block">
    <h5 style="color:black">You need new Earbuds ?</h5>
    <p style="color:black">Everything you need is in here  </p>
    </div>
         </div>

    <div class="carousel-item">
      <img class="d-block w-100" src="Img/Slideshow/ThirdPicture.jpg" alt="Third slide">
         <div class="carousel-caption d-none d-md-block">
        <h5 style="color:black">Or You like headphones more  ?</h5>
    <p style="color:black">don't worry we got you  </p>
    </div>
         </div>

  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev" >
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>

</div>

    <%-- content --%>
      <section class="features3 cid-qz32dUh7Dj" id="features3-91" data-rv-view="3307">
    
    
          <section class="about-us py-5 " id="about-us" >
    <div class="container mt-5">
	<div class="row">
		<div class="col-md-6">
		    <h1 class='text-success' style="color:rosybrown!important;">Welcome!</h1>
		    <h2>Know More About Us</h2>
		    <hr>
            <p>
Welcome to Hydra, your number one source for all things. We're dedicated to providing you the best of Electronics , with a focus on dependability. customer service.


We're working to turn our passion for Electronics  into a booming online store. We hope you enjoy our products as much as we enjoy offering them to you.


Sincerely,

Salma

</p>
		    <button type="button" class="btn btn-success " style="background-color:rgb(235, 200, 200); border-color:rgb(235, 200, 200);">Let's Know More</button>

		</div>
		<div class="col-md-6">
		    
		</div>
	</div>
</div>
</section>
    
    <div class="container-fluid">
        <div class="row  justify-content-center pad ">
            <div class="card p-3 col-12 col-md-6 col-xl-3 col-lg-3 border-0">
                <div class="mx-4">
                    <div class="card-img pb-4">
                        <img src="Img/HydraIcons/airplane.png" alt="" />
                    </div>
                    <div class="card-box">
                        <h4 class="card-title mbr-fonts-style display-5" >
                            Just Arrived
                        </h4>
                        <p class="mbr-text mbr-fonts-style display-7" id="New" runat="server">
                        </p>
                    </div>
                </div>
            </div>

            <div class="card p-3 col-12 col-md-6 col-xl-3 col-lg-3 border-0">
                <div class="mx-4">
                    <div class="card-img pb-4">
                        <img src="Img/HydraIcons/balloons.png" width="24" height="24" />
                    </div>
                    <div class="card-box">
                        <h4 class="card-title mbr-fonts-style display-5">
                            We Love
                        </h4>
                        <p class="mbr-text mbr-fonts-style display-7">
                           Lorem ipsum dolor sit amet, consectetur adipisicing elit. Modi assumenda consequatur nam harum impedit rem, nesciunt illo ullam, officia, vero atque.  
                        </p>
                    </div>
                </div>
            </div>

            <div class="card p-3 col-12 col-md-6 col-xl-3 col-lg-3 border-0">
                <div class="mx-4">
                    <div class="card-img pb-4">
                        <img src="Img/HydraIcons/reward.png" width="24" height="24" />
                    </div>
                    <div class="card-box">
                        <h4 class="card-title mbr-fonts-style display-5">
                            Best Sellers
                        </h4>
                        <p class="mbr-text mbr-fonts-style display-7" id="sellers" runat="server">
                             
                        </p>
                    </div>
                </div>
            </div>

            <div class="card p-3 col-12 col-md-6 col-xl-3 col-lg-3 border-0" style="border-radius:0!important">
                <div class="mx-4">
                    <div class="card-img pb-4">
                        <img src="Img/HydraIcons/Discount.png" width="24" height="24"/>
                    </div>
                    <div class="card-box">
                        <h4 class="card-title mbr-fonts-style display-5">
                            Discounts
                        </h4>
                        <p class="mbr-text mbr-fonts-style display-7">
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Modi assumenda consequatur nam harum impedit rem, nesciunt illo ullam, officia, vero atque.  
                        </p>
                    </div>
                </div>
            </div>

            

            
        </div>
    </div>
</section>
   
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
     
        <ItemTemplate>

             <div class="card  d-inline-block  mt-4  "style="width: 30rem ; margin:0px 9px" ; >

      <!--Card image 1-->
      <div class="view">
        <img src='<%# Eval("ProductImageLink").ToString().Replace("\\", "/") %>' class="card-img-top"
          alt="photo">
        <a href="#">
          <div class="mask rgba-white-slight"></div>
        </a>
      </div>

      <!--Card content 1-->
      <div class="card-body">
        <!--Title 1-->
        <h4 class="card-title">   <%#Eval("ProductName")%></h4>
        <!--Text 1-->
        <p class="card-text">  <%#Eval("ProductPrice")%>$ </p>
        <a href="<%#"ProductDetails.aspx?ThisId="+ Eval("ID")%>" class="btn btn-primary text-white">See Details </a>
      </div>

    </div>
        </ItemTemplate>
    </asp:Repeater>



   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT * FROM [Product] where Display='True'"></asp:SqlDataSource>



   
</asp:Content>

