<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="True" CodeBehind="AddProducts.aspx.cs" Inherits="MyProject1.AddProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }

    </script>
    <style>
        .col-12 {
            background-color: rgb(255, 255, 255);
        }
        .ImageField{
            width:25%;
            height:100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container-fluid">

        <%-- row --%>
        <div class="row">
            <%--  medium column 1--%>
            <div class="col-md-5">
                <%--card 1--%>
                <div class="card">
                    <div class="card-body">
                        <%--card row 1--%>
                        <div class="row">

                            <%--card Column--%>
                            <div class="col">
                                <h4>Product Details </h4>
                            </div>



                        </div>

                        <%--end card row 1--%>

                        <%--card row 2--%>
                        <div class="row">
                            <%--card column--%>
                            <div class="col">
                                <img src="Img/HydraIcons/BlackWithText.png" id="imgview" class=" img-thumbnail  w-25 h-100" />
                            </div>
                        </div>
                        <%--end card  row 2--%>

                        <%--card row 3--%>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:FileUpload class="form-control" ID="FileUpload1" runat="server" onchange="readURL(this)" />

                            </div>
                        </div>
                        <%--end card  row 3--%>

                        <%--card row 4--%>
                        <div class="row">
                            <div class="col-md-8">
                                <label>Product Name</label>

                                <div class="form-group">
                                    <asp:TextBox runat="server" CssClass="form-control" ID="TextBox1" placeholder="Product Name " />
                                </div>

                            </div>
                        </div>


                        <%--end card  row 4--%>

                        <%--card row 5--%>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Category</label>
                                <div class="form-group">
                                    <%--dropdown Category--%>
                                    <asp:DropDownList ID="DropDownList1" class="form-control" runat="server" >
                                    </asp:DropDownList>

                                </div>
                            </div>
                        </div>
                        <%--end card  row 5--%>

                        <%--card row 6--%>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Seller </label>
                                <div class="form-group">
                                    <asp:DropDownList ID="DropDownList2" class="form-control" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                        </div>

                        <%--end card  row 6--%>

                        <%--card row 7--%>

                        <div class="row">
                            <div class="col-md-4">
                                <label>
                                    Price
                                </label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox2" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <%--end card  row 7 --%>

                        <%--card row 8--%>


                        <div class="row">
                            <div class="col-md-4">
                                <label>Stock</label>
                                <div class="form-group">

                                    <asp:TextBox ID="TextBox3" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <%--end card  row 8 --%>

                        <%--card row 9--%>

                        <div class="row">
                            <div class="col-12">
                                <label>Description </label>
                                <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder=" Description" TextMode="MultiLine" Rows="2"></asp:TextBox>
                            </div>
                        </div>
                        <%--end card  row 9 --%>

                        <%--card row 10--%>
                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="Button1" class="btn btn-lg btn-block btn-success " runat="server" Text="Add" OnClick="Button1_Click" />
                            </div>

                        </div>
                    </div>
                    <%--gohome button--%>
                    <a href="Welcome.aspx"><< Back to Home</a><br>


                    <br>
                </div>

                <%--GridView--%>
            </div>


            <%--card 2--%>
         

            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                               
                           <h4>Product List</h4>
                      
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT * FROM [Product]" DeleteCommand="DELETE FROM [Product] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Product] ([ProductName], [ProductDescription], [ProductPrice], [ProductImageLink], [ProductType], [Seller], [Stock]) VALUES (@ProductName, @ProductDescription, @ProductPrice, @ProductImageLink, @ProductType, @Seller, @Stock)" UpdateCommand="UPDATE [Product] SET [ProductName] = @ProductName, [ProductDescription] = @ProductDescription, [ProductPrice] = @ProductPrice, [ProductImageLink] = @ProductImageLink, [ProductType] = @ProductType, [Seller] = @Seller, [Stock] = @Stock WHERE [ID] = @ID">
                                <DeleteParameters>
                                    <asp:Parameter Name="ID" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="ProductName" Type="String" />
                                    <asp:Parameter Name="ProductDescription" Type="String" />
                                    <asp:Parameter Name="ProductPrice" Type="Int32" />
                                    <asp:Parameter Name="ProductImageLink" Type="String" />
                                    <asp:Parameter Name="ProductType" Type="String" />
                                    <asp:Parameter Name="Seller" Type="String" />
                                    <asp:Parameter Name="Stock" Type="Int64" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="ProductName" Type="String" />
                                    <asp:Parameter Name="ProductDescription" Type="String" />
                                    <asp:Parameter Name="ProductPrice" Type="Int32" />
                                    <asp:Parameter Name="ProductImageLink" Type="String" />
                                    <asp:Parameter Name="ProductType" Type="String" />
                                    <asp:Parameter Name="Seller" Type="String" />
                                    <asp:Parameter Name="Stock" Type="Int64" />
                                    <asp:Parameter Name="ID" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
                                    <Columns>
                                        <asp:ImageField DataImageUrlField="ProductImageLink" HeaderText="Image" ItemStyle-Width="50px" ControlStyle-Width="100" ControlStyle-Height = "100" >
                                            <ControlStyle Font-Size="Small" />
                                            <ItemStyle Font-Size="XX-Small" Font-Strikeout="False"  HorizontalAlign="Center" Width="90px" Wrap="False" CssClass="img-thumbnail  w-25 h-100" />
                                        </asp:ImageField>
                                        <asp:BoundField DataField="ProductName" HeaderText="Name" SortExpression="ProductName" />
                                        <asp:BoundField DataField="ProductDescription" HeaderText="Description" SortExpression="ProductDescription" />
                                        <asp:BoundField DataField="ProductPrice" HeaderText="Price" SortExpression="ProductPrice" />
                                        <asp:BoundField DataField="ProductType" HeaderText="Category" SortExpression="ProductType" />
                                        <asp:BoundField DataField="Seller" HeaderText="Seller" SortExpression="Seller" />
                                        <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock" />
                                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>






</asp:Content>
