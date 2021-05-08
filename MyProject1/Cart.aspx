<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="MyProject1.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
	<title>Your Shopping Cart</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" "="">
	<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
	<link rel="stylesheet"  href="MyCss/CssCart.css"  >
	  <script src="https://use.fontawesome.com/c560c025cf.js"></script>
		 <script src="SweetAlert/alert.js" type="text/javascript"></script>
    <script>
	 function OutOfStock() {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Sorry but its more than we have now in stock',
                confirmButtonText: '<a href="Cart.aspx"  style="color:white !important;">okay</a>',




            })
        }
      </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%--   <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>--%>
	<main class="page">
	 	<section class="shopping-cart dark">
	 		<div class="container">
		        <div class="block-heading">
		          <h2>Shopping Cart</h2>
		          
		        </div>
		        <div class="content">
	 				<div class="row">
	 					<div class="col-md-12 col-lg-8">
                             <div>
							 </div>
                             <asp:Repeater runat="server" ID="repeater1"  DataSourceID="SqlDataSource1" OnItemCommand="repeater1_ItemCommand">
                                 <ItemTemplate>
	<div class="items">
				 				<div class="product">
				 					<div class="row">
					 					<div class="col-md-3" style="left: 19px;top: 31px;">
					 						<img class="img-fluid mx-auto d-block image" src='<%# Eval("ProductImageLink").ToString().Replace("\\", "/") %>'>
					 					</div>
					 					<div class="col-md-8">
					 						<div class="info">
						 						<div class="row">
							 						<div class="col-md-5 product-name">
							 							<div class="product-name">
								 							<a href="<%#"ProductDetails.aspx?ThisId="+ Eval("ProductID")%>"> <%#Eval("ProductName")%></a>
								 							<div class="product-info">
									 							<div> Description : <span class="value"> <%#Eval("ProductDescription")%> </span></div>
									 							<div> Category :  <span class="value"> <%#Eval("ProductType")%></span></div>
                                                                <%-- <asp:Label Text='<%#Eval("ProductID")%>'  runat="server" ID="ProducttID" />--%>
									 						</div>
									 					</div>
							 						</div>
							 						<div class="col-md-4 quantity">
							 							<label for="quantity">Quantity:</label>
														
                                                         <asp:Label Text='<%#Eval("ProductID")%>' runat="server" ID="ProductID" Visible="false" />
                                                        <div class="form-group">
                                                          
                                                                                                                     <asp:TextBox ID="Quantity"  runat="server" Text='<%# Eval("Quantity")%>' class="form-control quantity-input" ></asp:TextBox>
                                                            <asp:Label Text='<%# Eval("Quantity")%>' runat="server"  ID="First" Visible="false" />
													

                                                            <asp:Button ID="Button2" runat="server" CssClass="btn .btn-xs  btn-primary  "  style="margin-top: 19px;" BackColor="gray" BorderColor="gray" Text="Save" CommandName="Update" CommandArgument = '<%#DataBinder.Eval(Container.DataItem, "ProductID")%>' />
</div>
                                                       
							 						</div>
							 						<div class="col-md-3 price" style="margin-left: 0px;padding-right: 0px;padding-left: 0px;left: 45px;"  >
							 							<span><%#Eval("ProductPrice")%>$</span>
                                                         <asp:Button ID="Button1"  style="padding-left: 11px;" runat="server" Text="Remove" class="btn btn-primary btn-lg btn-block"  CommandName="Delete" CommandArgument = '<%#DataBinder.Eval(Container.DataItem, "ProductID")%>' />
							 						</div>
							 					</div>
							 				</div>
					 					</div>
					 				</div>
				 				</div>
				 			
				 			
				 			</div>
                                 </ItemTemplate>
                             </asp:Repeater>
	 					
			 			</div>
			 			<div class="col-md-12 col-lg-4">
			 				<div class="summary">
			 					<h3>
                                   
                                    Summary</h3>
			 					
			 					<div class="summary-item"><span class="text">Discount</span><span class="price">$0</span></div>
			 					<div class="summary-item"><span class="text">Shipping</span><span class="price">$0</span></div>
			 					<div class="summary-item mt-1" ><span class="text">Total</span><span class="price"  id="TotalPrice" runat="server" ></span></div>
								 			 					<asp:Button  runat="server"  ID="Checkout" class="btn btn-primary btn-lg btn-block mt-5" Text="Checkout" PostBackUrl="Checkout.aspx"  />

                                 <label id="selected"></label>
				 			</div>
			 			</div>
		 			</div> 
		 		</div>
	 		</div>
		    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>"  SelectCommand="SELECT Cart.ProductID, Cart.Quantity, Product.ProductName, Product.ProductDescription, Product.ProductPrice, Product.ProductImageLink, Product.ProductType ,Stock FROM Cart INNER JOIN Product ON Cart.ProductID = Product.ID WHERE (Cart.UserID = @userid)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="" Name="userid" SessionField="UserID" />
                </SelectParameters>
            </asp:SqlDataSource>
		</section>
	</main>
	
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>


	<%--<script type="text/javascript">
		function HandleIT() {

			var x = document.getElementById("quantity").value;
			document.getElementById("GetQuantity").innerHTML = x;
			alert(x);
			

			

			
           
        }
    </script>     --%>
        
    
</asp:Content>
