<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="MyProject1.ProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="MyCss/CssDetails.css" rel="stylesheet" />
	 <script src="SweetAlert/alert.js" type="text/javascript"></script>

    <script>

		function alertSuccess() {
            Swal.fire({
                position: 'top-end',
                icon: 'success',
                title: 'successfully saved to the cart',
              
                confirmButtonText: '<a href="Welcome.aspx" style="color:white !important ;" >Continue shopping</a>'
            })
		}

		function alertalreadyincart() {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
				text: 'You already have this item in your cart',
                confirmButtonText: '<a href="Welcome.aspx"  style="color:white !important;">Continue shopping</a>',


				

				footer: '<a href="Cart.aspx">Go to cart ?</a>'
            })
		}

        function OutOfStock() {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Sorry but it sold out',
                confirmButtonText: '<a href="Welcome.aspx"  style="color:white !important;">Continue shopping</a>',




                footer: '<a href="Cart.aspx">Go to cart ?</a>'
            })
        }
		
		function login() {

            Swal.fire({
                
                title: 'Oops...',
                text: 'You should have an account to add items to cart ',
               
                background: '#fff url(/Img/trees.png)',
                backdrop: `
							rgba(0,0,123,0.4)
							url("/Img/nyan-cat.gif")
							left top
							no-repeat `,
			
                  
                    icon: 'question',
                    iconHtml: '؟',
                confirmButtonText: '<a style="color:white !important;" href="Login.aspx?Page=1"  id="LoginButton" runat="server">Log in ?</a> ',
             
				

                    cancelButtonText: 'No Thanks',
                    showCancelButton: true,
				showCloseButton: true,
				footer: '<a href="SignUp.aspx" style="color:Black !important;">You dont have an existing account </a>'

				
			
            }
			)
              
               
		}
   

	
		
	
	
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        
	<br>  <p class="text-center">  Product Details </p>
<hr>
       	<label runat="server" id="labelclick">	</label>


    


  <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater1_ItemCommand">
		<ItemTemplate>
       



			 <body>
	
	<div class="container thishover">
		<div class=" card text-white bg-dark mb-3">
			<div class="container-fliud">
				<div class="wrapper row">
					<div class="preview col-md-6">
						
						<div class="preview-pic tab-content">
						  <div class="tab-pane active" id="pic-1"><img src='<%# Eval("ProductImageLink").ToString().Replace("\\", "/") %>' /></div>
						 
						</div>
						
					</div>
					<div class="details col-md-6">
						<h3 class="product-title"><%#Eval("ProductName")%> </h3>
						<div class="rating">
							<div class="stars">
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star"></span>
								<span class="fa fa-star"></span>
							</div>
							<span class="review-no">41 reviews</span>
						</div>
						<p class="product-description"><%#Eval("ProductDescription")%> </p>
						<h4 class="price">current price: <span><%#Eval("ProductPrice")%>$</span></h4>
						<p class="vote"><strong>91%</strong> of buyers enjoyed this product! <strong>(87 votes)</strong></p>
						<dl class="param param-feature">
  <dt>Category</dt>
  <dd> <%#Eval("ProductType")%> </dd>
</dl>  <!-- item-property-hor .// -->
  <!-- item-property-hor .// -->
<dl class="param param-feature">
  <dt>Delivery</dt>
  <dd>Russia, USA ,Morocco and Europe</dd>
</dl>  <!-- item-property-hor .// -->

					
						<div class="action">
							<asp:Button  id="Button1" class="add-to-cart btn btn-default "  runat="server" Text="Add To Cart" OnClick="Button1_Click" CommandArgument='<%#Eval("ID")%>'  style="border-color: rgb(234, 151, 151); color: rgb(234, 151, 151);" />
						
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

				</ItemTemplate>
    </asp:Repeater>
		<!--container.//-->
	

    <br />

<br>
  
			
	
    <br>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT * FROM [Product] WHERE ([ID] = @ID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="ThisId" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br>

<br><br><br>

</asp:Content>
