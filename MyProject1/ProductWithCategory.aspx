<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ProductWithCategory.aspx.cs" Inherits="MyProject1.ProductWithCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <div class="container py-5">
    <div class="row text-center text-white mb-5">
        <div class="col-lg-7 mx-auto">
            <h1 class="display-4">Product List</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-8 mx-auto">
            <!-- List group-->
            <ul class="list-group shadow">
                <!-- list group item-->
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                <li class="list-group-item">
                    <!-- Custom content-->
     

                    <div class="media align-items-lg-center flex-column flex-lg-row p-3">
                        <div class="media-body order-2 order-lg-1">
                            <h5 class="mt-0 font-weight-bold mb-2">  <%#Eval("ProductName")%></h5>
                            <p class="font-italic text-muted mb-0 small"><%#Eval("ProductDescription")%> </p>
                            <div class="d-flex align-items-center justify-content-between mt-1">
                                <h6 class="font-weight-bold my-2"><%#Eval("ProductPrice")%>$</h6>
                                <ul class="list-inline small">
                                    <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
                                    <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
                                    <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
                                    <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
                                    <li class="list-inline-item m-0"><i class="fa fa-star-o text-gray"></i></li>
                                </ul>
                            </div>
                        </div><img src='<%# Eval("ProductImageLink").ToString().Replace("\\", "/") %>'  alt="Generic placeholder image" width="200" class="ml-lg-5 order-1 order-lg-2">
                            <a href="<%#"ProductDetails.aspx?ThisId="+ Eval("ID")%>" style=" margin-right: 16px;" class="btn btn-primary text-white">See Details </a>
                    </div> <!-- End -->
                </li> <!-- End -->
                <!-- list group item--></ItemTemplate>

                </asp:Repeater>
            </ul> <!-- End --><asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT * FROM [Product] WHERE ([ProductType] = @ProductType)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ProductType" QueryStringField="Cat" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</div>
</asp:Content>
