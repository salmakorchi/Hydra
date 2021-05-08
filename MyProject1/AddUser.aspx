<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="MyProject1.AddUserr" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .col-12 {
            background-color: rgb(255, 255, 255);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                 <%--GridView--%>
      
            </div>
                    <div class="col-md-7">
                <div class="card" style="left: 353px;top: 18px;">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                               
                           <h4>User List</h4>
                                <p>&nbsp;</p>
                      
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT * FROM [TblUser]" DeleteCommand="DELETE FROM [TblUser] WHERE [ID] = @ID" InsertCommand="INSERT INTO [TblUser] ([Name], [Email], [Role], [Password], [isblocked]) VALUES (@Name, @Email, @Role, @Password, @isblocked)" UpdateCommand="UPDATE [TblUser] SET [Name] = @Name, [Email] = @Email, [Role] = @Role, [Password] = @Password, [isblocked] = @isblocked WHERE [ID] = @ID">
                                <DeleteParameters>
                                    <asp:Parameter Name="ID" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="Name" Type="String" />
                                    <asp:Parameter Name="Email" Type="String" />
                                    <asp:Parameter Name="Role" Type="String" />
                                    <asp:Parameter Name="Password" Type="String" />
                                    <asp:Parameter Name="isblocked" Type="Boolean" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Name" Type="String" />
                                    <asp:Parameter Name="Email" Type="String" />
                                    <asp:Parameter Name="Role" Type="String" />
                                    <asp:Parameter Name="Password" Type="String" />
                                    <asp:Parameter Name="isblocked" Type="Boolean" />
                                    <asp:Parameter Name="ID" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" InsertVisible="False" />
                                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                        <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" />

                                        <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                                        <asp:CheckBoxField DataField="isblocked" HeaderText="isblocked" SortExpression="isblocked" />
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
