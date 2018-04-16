<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="District.aspx.cs" Inherits="Admin_Default" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style1 {
        width: 100%;
    }
    .auto-style2 {
        width: 113px;
    }
    .auto-style3 {
        width: 113px;
        height: 24px;
    }
    .auto-style4 {
        height: 24px;
    }
    .auto-style5 {
        width: 113px;
        height: 26px;
    }
    .auto-style6 {
        height: 26px;
    }
</style>
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
    <tr>
        <td class="auto-style2">&nbsp;</td>
        <td>Add New District</td>
    </tr>
    <tr>
        <td class="auto-style2">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">State</td>
        <td class="auto-style4">
            <asp:DropDownList ID="ddl_state" runat="server" Height="17px" Width="127px">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="auto-style5">District</td>
        <td class="auto-style6">
            <asp:TextBox ID="txt_district" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">&nbsp;</td>
        <td>
            <asp:Button ID="btn_save" runat="server" Text="Save" OnClick="btn_save_Click" />
        </td>
    </tr>
    <tr>
        <td class="auto-style2">&nbsp;</td>
        <td>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="GridView1_RowCommand">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="state_name" HeaderText="State" />
                    <asp:BoundField DataField="district_name" HeaderText="District" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="link_edit" runat="server" CommandArgument='<%# Eval("district_id") %>' CommandName="ed" ForeColor="#0066FF">Edit</asp:LinkButton>
                            <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("district_id") %>' CommandName="ed" ForeColor="#3366FF">Delete</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
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
    </tr>
</table>
</asp:Content>

