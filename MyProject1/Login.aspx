<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MyProject1.Accueil" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <link href="MyCss/CssLogin.css" rel="stylesheet" />
           <script src="SweetAlert/alert.js" type="text/javascript"></script>
    <script>
        function Email() {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Sorry this email does not exist try again',
                confirmButtonText: '<a href="#"  style="color:white !important;">okay</a>',




            })
        }
    </script>
<title> Log in</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="Loginbox">
            <h2>Welcome back</h2>
            <img src="Img\user1.png" alt="User Picture" height="100" width="100" class="user" />
           
            <asp:Label ID="Lblmail" runat="server"  CssClass="Lblmail">
                <span Class="contentmail">Email</span></asp:Label>
          
            <asp:RegularExpressionValidator CssClass="validator" ID="RegularExpressionValidator1" runat="server" ErrorMessage="wrong Email" ControlToValidate="txtmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

          
            <asp:TextBox ID="txtmail" autocomplete="off" runat="server" CssClass="Txtmail"></asp:TextBox>
            <br />

        <br />
            <asp:Label ID="LblPassword" runat="server" CssClass="LblPassword"
                >
                <span
                    class="contentpassword">Password</span>
            </asp:Label>
            <asp:TextBox ID="txtpassword" TextMode="Password" autocomplete="off"  runat="server" CssClass="TxtPassword"></asp:TextBox>
             
            <asp:Button ID="btnlogin" runat="server" Text="Log in" OnClick="btnlogin_Click" CssClass="BtnLogin" />
             <asp:Label ID="Text" runat="server" Font-Size="Smaller" Visible="False" BackColor="#FFCCFF"></asp:Label>
         <div>
            <asp:LinkButton Text="Forgot password?" runat="server" CssClass="LinkForgot" ></asp:LinkButton>
             </div>
                
         
                <asp:label runat="server" ID="labelsign" CssClass="labelsign" text="Need an Account ?" ></asp:label> 
              <asp:LinkButton Text="Sign up" runat="server" CssClass="linksignup" id="signup" PostBackUrl="~/SignIn.aspx" >

            </asp:LinkButton>



        </div>
    </form>
</body>
</html>
