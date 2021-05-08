<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="MyProject1.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="SweetAlert/alert.js" type="text/javascript"></script>
    <script>
        function alertSuccess() {
            Swal.fire({
                position: 'top-end',
                icon: 'success',
                title: 'Your order was submitted',

                confirmButtonText: '<a href="Welcome.aspx" style="color:white !important ;" >Continue shopping</a>'
            })
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <body class="bg-light" data-gr-c-s-loaded="true">

    <div class="container">
      <div class="py-5 text-center">
        <h2>Checkout </h2>
      </div>

       <%-- cart--%>

      
        <div class="row">
        <div class="col-md-4 order-md-2 mb-4">
          <h4 class="d-flex justify-content-between align-items-center mb-3">
            <span class="text-muted">Your cart</span>
            <span class="badge badge-secondary badge-pill">3</span>
          </h4>
          <ul class="list-group mb-3">
              <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                  <ItemTemplate>
            <li class="list-group-item d-flex justify-content-between lh-condensed" >
              <div>
                <h6 class="my-0"><%#Eval("ProductName")%></h6>
         
              </div>
              <span class="text-muted"><%#Eval("ProductPrice")%></span>
            </li></ItemTemplate>
           </asp:Repeater>
            <li class="list-group-item d-flex justify-content-between bg-light">
              <div class="text-success">
                <h6 class="my-0">Promo code</h6>
                <small>EXAMPLECODE</small>
              </div>
              <span class="text-success">-$0</span>
            </li>
            <li class="list-group-item d-flex justify-content-between">
              <span>Total (USD)</span>
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            </li>
          </ul>

          
            <div class="input-group">
              <input type="text" class="form-control" placeholder="Promo code">
              <div class="input-group-append">
                <button type="submit" class="btn btn-secondary">Redeem</button>
              </div>
              <%--  end cart--%>
            </div>
          
        </div>
        <div class="col-md-8 order-md-1">
          <h4 class="mb-3">Billing address</h4>
          <form class="needs-validation was-validated" novalidate="">
            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="firstName">Name</label>
                <input type="text" class="form-control" id="firstName" placeholder="" value="" required="" runat="server" readonly="readonly" >
                <div class="invalid-feedback">
                  Valid Name is required.
                </div>
              </div>
              
            </div>

            

            <div class="mb-3">
              <label for="email">Email <span class="text-muted">(Optional)</span></label>
              <input type="email" class="form-control" id="email" placeholder="you@example.com" runat="server"  readonly="readonly">
              <div class="invalid-feedback">
                Please enter a valid email address for shipping updates.
              </div>
            </div>

            <div class="mb-3">
              <label for="address">Address</label>
              <input type="text" class="form-control" id="address" runat="server" placeholder="1234 Main St" required="">
              <div class="invalid-feedback">
                Please enter your shipping address.
              </div>
            </div>

            

            
            <hr class="mb-4">
            
            
            

            

            <div class="d-block my-3">
              <div class="custom-control custom-radio">
                <input id="credit" name="paymentMethod" type="radio" class="input"  runat="server"  checked="">
                <label class="" for="credit">Credit card</label>
              </div>
              <div class="custom-control custom-radio">
                <input id="debit" name="paymentMethod" type="radio" class="input" runat="server"  checked="">
                <label class="" for="debit">Debit card</label>
              </div>
              <div class="custom-control custom-radio ">
                <input id="paypal" name="paymentMethod" type="radio" class="nput"  runat="server"  checked="" >
                <label class="" for="paypal">Paypal</label>
              </div>
            </div>
                
             
               
            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="cc-name">Name on card</label>
                <input type="text" class="form-control" id="name" placeholder="" required="" runat="server">
                <small class="text-muted">Full name as displayed on card</small>
                <div class="invalid-feedback">
                  Name on card is required
                </div>
              </div>
              <div class="col-md-6 mb-3">
                <label for="cc-number">Credit card number</label>
                <input type="text" class="form-control" id="number" placeholder="" required="" runat="server">
                <div class="invalid-feedback">
                  Credit card number is required
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-3 mb-3">
                <label for="cc-expiration">Expiration</label>
                <input type="text" class="form-control" id="expiration" placeholder="" required="" runat="server">
                <div class="invalid-feedback">
                  Expiration date required
                </div>
              </div>
              <div class="col-md-3 mb-3">
                <label for="cc-expiration">CVV</label>
                <input type="text" class="form-control" id="cvv" placeholder="" required=""   runat="server">
                  <div clsecurity code required>
                  </div>
              </div>
            </div>
            <hr class="mb-4">
            <asp:Button class="btn btn-primary btn-lg btn-block" type="submit" runat="server" Text="Continue to checkout" OnClick="Unnamed1_Click"   />

          </form>
        </div>
      </div>

     

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->

    <script>
      // Example starter JavaScript for disabling form submissions if there are invalid fields
      (function() {
        'use strict';

        window.addEventListener('load', function() {
          // Fetch all the forms we want to apply custom Bootstrap validation styles to
          var forms = document.getElementsByClassName('needs-validation');

          // Loop over them and prevent submission
          var validation = Array.prototype.filter.call(forms, function(form) {
            form.addEventListener('submit', function(event) {
              if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
              }
              form.classList.add('was-validated');
            }, false);
          });
        }, false);
      })();
    </script>
   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>"  SelectCommand="SELECT Cart.ProductID, Cart.Quantity, Product.ProductName,  Product.ProductPrice FROM Cart INNER JOIN Product ON Cart.ProductID = Product.ID WHERE (Cart.UserID = @userid)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="" Name="userid" SessionField="UserID" />
                </SelectParameters>
            </asp:SqlDataSource>

</body>
</asp:Content>
