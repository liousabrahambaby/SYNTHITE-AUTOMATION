<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMasterPage.master" AutoEventWireup="true" CodeFile="PhotoList.aspx.cs" Inherits="User_PurchasePhoto_PhotoList" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">

       .ratingStar
        {
            font-size: 0pt;
            width: 13px;
            height: 12px;
            margin: 0px;
            padding: 0px;
            cursor: pointer;
            display: block;
            background-repeat: no-repeat;
        }
        
        .filledRatingStar
        {
            background-image: url(RatingImages/FilledStar.png);
        }
        
        .emptyRatingStar
        {
            background-image: url(RatingImages/EmptyStar.png);
        }
        
        .savedRatingStar
        {
            background-image: url(RatingImages/SavedStar.png);
        }


         .bak {
             background-color:blue;
             opacity:0.3;
             filter:alpha(opacity=30);

         }
         .image22 {
             flex-align:center;
             position:fixed;
         }
         .auto-style9 {
             width: 64px;
         }
         .auto-style11 {
             width: 149px;
         }
         .auto-style13 {
             width: 303px;
         }
         .auto-style14 {
             width: 313px;
         }
         .auto-style15 {
             width: 320px;
         }
         .auto-style16 {
             width: 321px;
         }
         .auto-style18 {
             width: 1069px;
         }
         .auto-style19 {
             width: 29px;
         }
        </style>
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>
                <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                </asp:ToolkitScriptManager>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>
                <table class="auto-style9">
                    <tr>
                        <td class="auto-style11">Category</td>
                        <td>
                            <asp:DropDownList ID="ddl_category" runat="server" AutoPostBack="True" Width="175px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>
                <asp:DataList ID="DataList1" runat="server" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" OnItemCommand="DataList1_ItemCommand" OnItemDataBound="DataList1_ItemDataBound" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" RepeatColumns="4" RepeatDirection="Horizontal">
                    <AlternatingItemStyle BackColor="PaleGoldenrod" />
                    <FooterStyle BackColor="Tan" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <ItemTemplate>
                        <table class="auto-style1">
                            <tr>
                                <td class="auto-style4" colspan="2">
                                    <img src="../Production Manager/image product/<%#Eval("product_image") %>" width="100" height="100" />
                                    
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style7" colspan="2">
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <asp:Rating ID="Rating1" runat="server" CurrentRating="0" EmptyStarCssClass="emptyRatingStar" FilledStarCssClass="filledRatingStar" OnChanged="Rating1_Changed" StarCssClass="ratingStar" Style="float:left;" Tag='<%# Eval("product_id") %>' WaitingStarCssClass="savedRatingStar" >
                                            </asp:Rating>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("product_id") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style18">Product Name</td>
                                <td>
                                    <asp:Label ID="Label1" runat="server" style="font-size: medium" Text='<%# Eval("product_name") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style18">Price</td>
                                <td class="auto-style6">
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("product_price") %>'></asp:Label>
                                </td>
                            </tr>
                             <tr>
                                <td class="auto-style18">Description</td>
                                <td class="auto-style6">
                                    <asp:Label ID="Label12" runat="server" Text='<%# Eval("product_dsc") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style18">Weight</td>
                                <td class="auto-style6">
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("product_qty") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style18">&nbsp;</td>
                                <td class="auto-style6">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style18">&nbsp;</td>
                                <td class="auto-style6">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style18">
                                    <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# Eval("product_id") %>' CommandName="com" >Comment</asp:LinkButton>
                                </td>
                                <td class="auto-style6">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style18">&nbsp;</td>
                                <td class="auto-style6">&nbsp;</td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                </asp:DataList>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>
                <asp:Panel ID="Panel1" runat="server">
                    <table class="style1">
                        <tr>
                            <td class="auto-style14">Comment</td>
                            <td>
                                <table class="style1">
                                    <tr>
                                        <td class="auto-style13">
                                            <asp:TextBox ID="txtcomm" runat="server" TextMode="MultiLine"></asp:TextBox>
                                        </td>
                                        <td class="auto-style19">
                                            <asp:Button ID="btnpost" runat="server" OnClick="btnpost_Click" Text="POST" />
                                        </td>
                                        <td>
                                            <asp:Button ID="btncan" runat="server" OnClick="btncan_Click" Text="Cancel" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style14">&nbsp;</td>
                            <td>
                                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="5">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <table class="style1">
                                                    <tr>
                                                        <td class="auto-style15" colspan="4">
                                                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("comment") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style20">By :</td>
                                                        <td class="auto-style16">
                                                            <asp:Label ID="Label11" runat="server" Text='<%# Eval("user_uname") %>'></asp:Label>
                                                        </td>
                                                        <td class="auto-style19">Date</td>
                                                        <td>
                                                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("date") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <table class="style1">
                                            <tr>
                                                <td class="auto-style15" colspan="4">
                                                    <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style15">Posted By :</td>
                                                <td class="auto-style16">
                                                    <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
                                                </td>
                                                <td>Date</td>
                                                <td>
                                                    <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </EmptyDataTemplate>
                                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                    <SortedDescendingHeaderStyle BackColor="#820000" />
                                </asp:GridView>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style14">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>
                <asp:Image ID="Image1" runat="server" ToolTip="Close" CssClass="image22" />
                <asp:HiddenField ID="HiddenField2" runat="server" />
                <asp:ModalPopupExtender ID="HiddenField2_ModalPopupExtender" runat="server" TargetControlID="HiddenField2" PopupControlID="Image1" BackgroundCssClass="bak" OkControlID="Image1" DropShadow="true">
                </asp:ModalPopupExtender>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

