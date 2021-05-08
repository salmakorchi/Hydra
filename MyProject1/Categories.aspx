<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="MyProject1.Categories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<asp:SqlDataSource runat="server"></asp:SqlDataSource>



    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   
             <section>
        <div class="container">
            <div class="text-muted mt-5 mb-5 text-center display-4">Categories</div>
            <hr/>
            <div class="row">
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
           
                <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3 p-2">
<a href="<%#"ProductWithCategory.aspx?Cat="+ Eval("Label")%>"><span>
                    <div class="card p-3 shadow text-center border-0"> 
                        
                        <div class="card-body" >
                            <img src='<%# Eval("ImageLink").ToString().Replace("\\", "/") %>'>                            <hr/>
                            <h2 class="card-title display-1" style="font-size:3.0vmin;" ><i ><a href="<%#"ProductWithCategory.aspx?Cat="+ Eval("Label")%>" style=" color:black !important"><%# Eval("Label")%></a></i> </h2>
                        </div>
                  </div></span></a>
                </div>
                </ItemTemplate>
    </asp:Repeater>
            </div>
        </div>
    </section>

       
                <div class="text-muted mt-5 mb-5 text-center">Design by <i class="fa fa-facebook text-primary" aria-hidden="true"> Korchi salma </i> <i class="fa fa-instagram text-danger" aria-hidden="true"> @salma.exe</i>  </div>

    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT * FROM [Type]"></asp:SqlDataSource>
</asp:Content>
