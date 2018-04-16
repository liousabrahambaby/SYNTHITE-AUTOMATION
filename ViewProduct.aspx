<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMasterPage.master" AutoEventWireup="true" CodeFile="ViewProduct.aspx.cs" Inherits="User_Default" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
        }
        .auto-style3 {
            width: 554px;
        }
    </style>
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style3">VIEW PRODUCT</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">Category:</td>
            <td>
                <asp:DropDownList ID="ddl_category" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_category_SelectedIndexChanged" style="margin-left: 0px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2" colspan="2">
                <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand" RepeatColumns="4" RepeatDirection="Horizontal">
                    <ItemTemplate>
                        <img src="../Production Manager/image product/<%#Eval("product_image") %>" width="100" height="100" />  
                        <br />
                        Product Name:<asp:Label ID="Label1" runat="server" Text='<%# Eval("product_name") %>'></asp:Label>
                        <br />
                        Price:<asp:Label ID="Label2" runat="server" Text='<%# Eval("product_price") %>'></asp:Label>
                        <br />
                        Description:<asp:Label ID="Label3" runat="server" Text='<%# Eval("product_dsc") %>'></asp:Label>
                        <br />
                        Weight:<asp:Label ID="Label4" runat="server" Text='<%# Eval("product_qty") %>'></asp:Label>
                        <br />
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("product_id") %>' CommandName="buy">Buy</asp:LinkButton>
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

