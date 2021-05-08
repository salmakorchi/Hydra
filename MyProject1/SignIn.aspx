<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="MyProject1.SignIn" %>
<html>
<head>
    <title></title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link href="MyCss/CssSignIn.css" rel="stylesheet" />
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"></head>
    <script src="SweetAlert/alert.js" type="text/javascript"></script>
    <script>
        function Email() {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Sorry this email already exist',
                confirmButtonText: '<a href="#"  style="color:white !important;">okay</a>',




            })
        }
    </script>
<body>
    <form id="form1" runat="server">
   <div class="container Loginbox">
      <div class="col-md-6 mx-auto text-center">
         <div class="header-title">
            <h1 class="wv-heading--title">
               Sign Up — it’s free!
            </h1>
        
         </div>
      </div>
      <div class="row">
         <div class="col-md-4 mx-auto">
            <div class="myform form ">
               <form action="" method="post" name="login">
                  <div class="form-group">
                     <input type="text" name="names"  class="form-control my-input" id="name" placeholder="Name" runat="server" /> 
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Name" ErrorMessage="Please enter your name " CssClass="Validator "
                         ></asp:RequiredFieldValidator>
                  </div>
                  <div class="form-group">
                     <input type="email" name="email"  class="form-control my-input" id="email" placeholder="Email" runat="server">
                       <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Wrong Email" CssClass="Validator"  ControlToValidate="email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ></asp:RegularExpressionValidator>
    <br />

                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="email" ErrorMessage="Please enter your Email" CssClass="Validator"></asp:RequiredFieldValidator>
                  </div>
                  
                   <div class="form-group">
                     <input type="Password" name="Password" id="Password"  class="form-control my-input" placeholder="Password" runat="server">
                     
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Password" ErrorMessage="Please enter your Password" CssClass="Validator"></asp:RequiredFieldValidator>
                  </div>
                   <div class="form-group">
                     <input type="Password"  name="Pc" id="PasswordC"  class="form-control my-input" placeholder="Password Confirmation" runat="server">
                       <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="make sure the password matches the confirmation" CssClass="Validator" ControlToCompare="PasswordC"  ControlToValidate="Password"> </asp:CompareValidator>
                  </div>
                  <div class="text-center ">
                     <asp:button  ID="submit" class=" btn btn-block send-button tx-tfm" runat="server" text="Create Your Free Account" OnClick="submit_Click" />


                  </div>
                  <div class="col-md-12 ">
                     <div class="login-or">
                        <hr class="hr-or">
                        <span class="span-or">or</span>
                     </div>
                  </div>
                  <div class="form-group">
                     <a class="btn btn-block g-button" href="#">
                     <i class="fa fa-google" ></i> Sign up with Google
                     </a>
                  </div>
                   <p class="small mt-3">Already have an account?<a href="Login.aspx" class="ps-hero__content__link">Log In </a>.
                  <p class="small mt-3">By signing up, you are indicating that you have read and agree to the <a href="#" class="ps-hero__content__link">Terms of Use</a> and <a href="#">Privacy Policy</a>.
                  </p>
               </form>
            </div>
         </div>
      </div>
   </div>
        </form>
</body></html>