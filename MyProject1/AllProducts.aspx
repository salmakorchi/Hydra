<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AllProducts.aspx.cs" Inherits="MyProject1.AllProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
_onkeyup : function(ev) {
    var k = ev.keyCode ? ev.keyCode :
                ev.rawEvent.keyCode;
    if (k != Sys.UI.Key.Tab) {
        this._timer.set_enabled(true);
    }
},

_onkeydown : function(ev) {
    this._timer.set_enabled(false);
},

_onTimerTick : function(sender, eventArgs) {
    this._timer.set_enabled(false);

    if(this._text != this.get_element().value) {
        this._text = this.get_element().value;

        this.get_element().onchange();
    }
},
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container">
            <div class="row">
 
                <div class="col-sm-12">
                    <center>
                        <h3>
                        All Products List</h3>
                    </center>
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <asp:Panel class="alert alert-success" role="alert" ID="Panel1" runat="server" Visible="False">
                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                            </asp:Panel>
                        </div>
                     
                    </div>
                    <br />
                    <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged" Columns="50"></asp:TextBox>        
<br />
List of matching words:<br />
                    <div class="row " style="margin-left:15%">
                        <div class="card">
                            <div class="card-body">

                                <div class="row">
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT [ProductName], [ProductDescription], [ProductImageLink], [ProductPrice], [ProductType], [Seller], [Stock] FROM [Product]"></asp:SqlDataSource>
                                    <div class="col" >
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="TextBox1" />
                                            </Triggers>
                                            <ContentTemplate>
                                                                                          <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" DataKeyNames="ProductName" AllowSorting="True">
                                            <Columns>
                                               
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <div class="container-fluid" style="background-color:white!important">
                                                            <div class="row">
                                                                <div class="col-lg-10">
                                                                    <div class="row">
                                                                        <div class="col-12">
                                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProductName") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-12">
                                                                            <span>Seller</span>
                                                                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("Seller") %>'></asp:Label>
                                                                            &nbsp;| <span><span>&nbsp;</span>Category</span>
                                                                            <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("ProductType") %>'></asp:Label>
                                                                            &nbsp;|
                                                                            <span>
                                                    *<span>&nbsp;</span>
                                                                        
                                                                        </div>
                                                                    </div>
                                                                   
                                                                    <div class="row">
                                                                        <div class="col-12">
                                                                            Cost -
                                                                            <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("ProductPrice") %>'></asp:Label>
                                                                            &nbsp;| Actual Stock -
                                                                            <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("Stock") %>'></asp:Label>
                                      
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-12">
                                                                            Description -
                                                                            <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Smaller" Text='<%# Eval("ProductDescription") %>'></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-2">
                                                                    <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("ProductImageLink") %>' />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:ButtonField HeaderText="You want This item?" Text="Add To Cart" />
                                            </Columns>
                                        </asp:GridView>

                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <center>
                    <a href="home.aspx">
                        << Back to Home</a><span class="clearfix"></span>
                            <br />
                            <center>
            </div>
        </div>
</asp:Content>
