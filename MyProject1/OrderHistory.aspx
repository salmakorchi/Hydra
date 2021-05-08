<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="OrderHistory.aspx.cs" Inherits="MyProject1.OrderHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="MyCss/CssOrderHistory.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
      <body style="background-color:azure!important">
    <div class="container-fluid my-5 d-flex justify-content-center" style="background-color:azure !important">
    <div class="card card-1">
        <div class="card-header bg-white">
            <div class="media flex-sm-row flex-column-reverse justify-content-between ">
                <div class="col my-auto">
                    <h4 class="mb-0">Thanks for your Order,<label id="name" runat="server" class="change-color"></label> !</h4>
                </div>
                <div class="col-auto text-center my-auto pl-0 pt-sm-4"> <img class="img-fluid my-auto align-items-center mb-0 pt-3"  width="115" height="115">
                    <p class="mb-4 pt-0 Glasses"></p>
                </div>
            </div>
        </div>
        <div class="card-body">
            <div class="row justify-content-between mb-3">
                <div class="col-auto">
                    <h6 class="color-1 mb-0 change-color">Receipt</h6>
                </div>
                <div class="col-auto "> <small>Receipt Voucher : 1KAU9-84UIL</small> </div>
            </div>
           <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" >
               <ItemTemplate>
            <div class="row mt-4">
                <div class="col">
                    <div class="card card-2">
                        <div class="card-body">
                            <div class="media">
                                <div class="sq align-self-center "> <img class="img-fluid my-auto align-self-center mr-2 mr-md-4 pl-0 p-0 m-0" src='<%# Eval("ProductImageLink").ToString().Replace("\\", "/") %>'  width="135" height="135" /> </div>
                                <div class="media-body my-auto text-right">
                                    <div class="row my-auto flex-column flex-md-row">
                                        <div class="col-auto my-auto ">
                                            <h6 class="mb-0">  <%#Eval("ProductName")%></h6>
                                        </div>
                                        
                                        <div class="col my-auto "> <small><%#Eval("ProductType")%></small></div>
                                        <div class="col my-auto "> <small>Quantity: <%# Eval("Quantity")%> </small></div>
                                        <div class="col my-auto ">
                                            <h6 class="mb-0"><%#Eval("ProductPrice")%>$</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr class="my-3 ">
                            <div class="row ">
                                <div class="col-md-3 mb-3"> <small> Track Order <span><i class=" ml-2 fa fa-refresh" aria-hidden="true"></i></span></small> </div>
                                <div class="col mt-auto">
                                    <div class="progress">
                                        <div class="progress-bar progress-bar rounded" style="width: 18%" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <div class="media row justify-content-between ">
                                        <div class="col-auto text-right"><span> <small class="text-right mr-sm-2"></small> <i class="fa fa-circle active"></i> </span></div>
                                        <div class="flex-col"> <span> <small class="text-right mr-sm-2">Out for delivary</small><i class="fa fa-circle"></i></span></div>
                                        <div class="col-auto flex-col-auto">
                                            <smallclass="text-right mr-sm-2">Delivered</small><span> <i class="fa fa-circle"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </ItemTemplate>
           </asp:Repeater>    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="select OrderID,OrderItems.Quantity,ProductID,ProductName,ProductDescription,ProductPrice,ProductImageLink,ProductType,Seller from OrderItems inner join Orders on OrderID=Orders.ID inner join  Product on ProductID=Product.ID where Orders.UserID=@UserID 
">
                <SelectParameters>
                    <asp:SessionParameter Name="UserID" SessionField="UserID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <div class="row mt-4">
                <div class="col">
                    <div class="row justify-content-between">
                        <div class="col-auto">
                            <p class="mb-1 text-dark"><b>Order Details</b></p>
                        </div>
                        <div class="flex-sm-col text-right col">
                            <p class="mb-1"><b>Total</b></p>
                        </div>
                        <div class="flex-sm-col col-auto">
                            <p class="mb-1">&#8377;4,835</p>
                        </div>
                    </div>
                    <div class="row justify-content-between">
                        <div class="flex-sm-col text-right col">
                            <p class="mb-1"> <b>Discount</b></p>
                        </div>
                        <div class="flex-sm-col col-auto">
                            <p class="mb-1"></p>
                        </div>
                    </div>
                    <div class="row justify-content-between">
                        <div class="flex-sm-col text-right col">
                            <p class="mb-1"><b>GST 18%</b></p>
                        </div>
                        <div class="flex-sm-col col-auto">
                            <p class="mb-1"></p>
                        </div>
                    </div>
                    <div class="row justify-content-between">
                        <div class="flex-sm-col text-right col">
                            <p class="mb-1"><b>Delivery Charges</b></p>
                        </div>
                        <div class="flex-sm-col col-auto">
                            <p class="mb-1">Free</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row invoice ">
                <div class="col">
                    
                    <p class="mb-1"   > Invoice Number : 788152</p>
                    <p class="mb-1">Invoice Date : 22 Dec,2019</p>
                    <p class="mb-1">Recepits Voucher:18KU-62IIK</p>
                </div>
            </div>
        </div>
        <div class="card-footer">
            <div class="jumbotron-fluid">
                <div class="row justify-content-between ">
                    <div class="col-sm-auto col-auto my-auto" ><img class="img-fluid my-auto align-self-center " src="https://i.imgur.com/7q7gIzR.png" width="115" height="115"></div>
                    <div class="col-auto my-auto ">
                        <h2 class="mb-0 font-weight-bold">TOTAL PAID</h2>
                    </div>
                    <div class="col-auto my-auto ml-auto">
                        <h1 class="display-3  " id="TotalPrice" runat="server" style="color :black"></h1>
                    </div>
                </div>
                <div class="row mb-3 mt-3 mt-md-0">
                    
                </div>
            </div>
        </div>
    </div>
</div>
  </body>
</asp:Content>
