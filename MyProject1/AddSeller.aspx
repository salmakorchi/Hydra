<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AddSeller.aspx.cs" Inherits="MyProject1.AddItem" %>
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div class="container-fluid">
      <div class="row">
          <div class="col-md-5">
                &nbsp;<%--card 1--%><div class="card">
                    <div class="card-body">
                        <%--card row 1--%>
                        <div class="row">

                            <%--card Column--%>
                            <div class="col">
                                <h4>Seller Details </h4>
                            </div>



                        </div>

                        <%--end card row 1--%>

                        <%--card row 2--%>
                        <div class="row">
                            <%--card column--%>
                            <div class="col">
                                <img src="Img/user1.png" id="imgview"  class="img-thumbnail  w-25 h-100"/>
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
                                <label>Company Name</label>

                                <div class="form-group">
                                    <asp:TextBox runat="server" CssClass="form-control" ID="TextBox1" placeholder="Company Name " autocomplete="off"  />
                                </div>

                            </div>
                        </div>


                        <%--end card  row 4--%>

                      

                        <%--card row 7--%>

                        <div class="row">
                            <div class="col-md-4">
                                <label>
                                    CEO Name
                                </label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox2" CssClass="form-control"  placeholder="CEO Name" runat="server" autocomplete="off" ></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <%--end card  row 7 --%>

                        <%--card row 8--%>


                        <div class="row">
                            <div class="col-md-4">
                                <label>Email</label>
                                <div class="form-group">

                                    <asp:TextBox ID="TextBox3" CssClass="form-control" TextMode="Email" placeholder="Email" runat="server" autocomplete="off" ></asp:TextBox>

                                </div>
                            </div>
                        </div>

                        <%--end card  row 8 --%>

                        <%--card row 9--%>

                        <div class="row">
                            <div class="col-12">
                                <label>Phone </label>
                                <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server"  placeholder="Phone" TextMode="Phone" autocomplete="off"  ></asp:TextBox>
                            </div>
                        </div>
                        <%--end card  row 9 --%>

                        <%--card row 10--%>
                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="Button1" class="btn btn-lg btn-block btn-success "  runat="server" Text="Add" OnClick="Button1_Click"  />
                            </div>

                        </div>
                    </div>
                    <%--gohome button--%>
                    <a href="Welcome.aspx"><< Back to Home</a><br>


                    <br>
                </div>

                <%--GridView--%>
      
            </div>
                    <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                               
                           <h4>Seller List</h4>
                      
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT * FROM [Seller]" DeleteCommand="DELETE FROM [Seller] WHERE [CompanyName] = @CompanyName" InsertCommand="INSERT INTO [Seller] ([CompanyName], [CEO], [ImageLink], [Email], [Phone]) VALUES (@CompanyName, @CEO, @ImageLink, @Email, @Phone)" UpdateCommand="UPDATE [Seller] SET [CEO] = @CEO, [ImageLink] = @ImageLink, [Email] = @Email, [Phone] = @Phone WHERE [CompanyName] = @CompanyName">
                                <DeleteParameters>
                                    <asp:Parameter Name="CompanyName" Type="String" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="CompanyName" Type="String" />
                                    <asp:Parameter Name="CEO" Type="String" />
                                    <asp:Parameter Name="ImageLink" Type="String" />
                                    <asp:Parameter Name="Email" Type="String" />
                                    <asp:Parameter Name="Phone" Type="Int64" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="CEO" Type="String" />
                                    <asp:Parameter Name="ImageLink" Type="String" />
                                    <asp:Parameter Name="Email" Type="String" />
                                    <asp:Parameter Name="Phone" Type="Int64" />
                                    <asp:Parameter Name="CompanyName" Type="String" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" DataKeyNames="CompanyName" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:ImageField DataImageUrlField="ImageLink" HeaderText="Image" ItemStyle-Width="50px" ControlStyle-Width="100" ControlStyle-Height = "100"  >
                                        </asp:ImageField>
                                        <asp:BoundField DataField="CompanyName" HeaderText="Company Name" ReadOnly="True" SortExpression="CompanyName" />
                                        <asp:BoundField DataField="CEO" HeaderText="CEO" SortExpression="CEO" />
                                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                        <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
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

