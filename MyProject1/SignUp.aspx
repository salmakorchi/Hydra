<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="MyProject1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>
    <link href="MyCss\CssSignUp.css" rel="stylesheet" />
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <meta name="google-signin-client_id" content="154840657119-2d2fh3iu791fijekvkti1r6ab76th4i6.apps.googleusercontent.com">
    <script>
        function onSignIn(googleUser) {
            var profile = googleUser.getBasicProfile();
            console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
            console.log('Name: ' + profile.getName());
            console.log('Image URL: ' + profile.getImageUrl());
            console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
          
           
        }
    </script>
    
</head>
<body>
    <form id="form1" runat="server">
        <section>
            <div class="container ">
                <div class="inner2">
                    <h3> Sign up </h3>
                    <asp:TextBox ID="Name" placeholder="Name" runat="server" autocomplete="off"  ></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Name" ErrorMessage="Please enter your name " CssClass="Validator"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="TxtEmail" placeholder="Email" runat="server" autocomplete="off" ></asp:TextBox> <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Wrong Email" CssClass="Validator"  ControlToValidate="TxtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ></asp:RegularExpressionValidator><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtEmail" ErrorMessage="Please enter your Email" CssClass="Validator"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="TxtPassword" runat="server" placeholder="Password" TextMode="Password" autocomplete="off" ></asp:TextBox><asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="make sure the password matches the confirmation" CssClass="Validator" ControlToCompare="TxtCops"  ControlToValidate="TxtPassword"> </asp:CompareValidator><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtPassword" ErrorMessage="Please enter your Password" CssClass="Validator"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="TxtCops" runat="server" TextMode="Password" placeholder="Confirm Password" autocomplete="off"  ></asp:TextBox>

                    <br />
                  
                    <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btnSignup" OnClick="Button1_Click" />
                      <asp:label runat="server" ID="labellogin" CssClass="labellogin" text="Already have an account" ></asp:label> 
              <asp:LinkButton Text="Log in " runat="server" CssClass="linklogin" id="login" OnClick="login_Click" CausesValidation="False" ></asp:LinkButton>
                </div>
                <div class="inner1">
                    <span >Sign in with </span>
                    <br />
                    <asp:Button ID="facebook" CssClass="btns"  runat="server" Text="Facebook" CausesValidation="False" />
                     <br />
                    <asp:Button ID="twitter" CssClass="btns"  runat="server" Text="Twitter" CausesValidation="False" />
                     <br />
                  
                    <div class="g-signin2" data-onsuccess="onSignIn">
  <asp:Button ID="google" CssClass="btns" runat="server"  Text="Google" CausesValidation="False" />
                    </div>
                     <br />
                    
                </div>
              
               </div>
        </section>
    </form>
</body>
</html>

