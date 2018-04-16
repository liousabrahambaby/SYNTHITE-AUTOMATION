<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddVacancies.aspx.cs" Inherits="Admin_Default" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 154px;
        }
    </style>
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style2" style="height: 28px; width: 341px">&nbsp;</td>
            <td class="auto-style2" style="height: 28px"></td>
            <td style="width: 874px; height: 28px">ADD NEW VANCANCY</td>
        </tr>
        <tr>
            <td class="auto-style2" style="width: 341px">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td style="width: 874px">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2" style="width: 341px">&nbsp;</td>
            <td class="auto-style2">Position Applying For</td>
            <td style="width: 874px">
                <asp:TextBox ID="txt_position" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" style="width: 341px">&nbsp;</td>
            <td class="auto-style2">Qualification</td>
            <td style="width: 874px">
                <asp:DropDownList ID="ddl_quali" runat="server" Height="17px" Width="125px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" style="width: 341px">&nbsp;</td>
            <td class="auto-style2">Basic Pay</td>
            <td style="width: 874px">
                <asp:TextBox ID="txt_pay" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" style="width: 341px">&nbsp;</td>
            <td class="auto-style2">No of Vacancies</td>
            <td style="width: 874px">
                <asp:TextBox ID="txt_number" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" style="width: 341px">&nbsp;</td>
            <td class="auto-style2">Last Date of Application</td>
            <td style="width: 874px">
                <asp:TextBox ID="txt_date" runat="server" TextMode="Date"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" style="width: 341px; height: 16px;"></td>
            <td class="auto-style2" style="height: 16px"></td>
            <td style="width: 874px; height: 16px;">
                <asp:Button ID="btn_save" runat="server" OnClick="btn_save_Click" Text="Save" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2" style="width: 341px; height: 16px;">&nbsp;</td>
            <td class="auto-style2" style="height: 16px">&nbsp;</td>
            <td style="width: 874px; height: 16px;">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2"></td>
            <td></td>
            <td >
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" OnRowCommand="GridView1_RowCommand" Height="207px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="vacanci_postname" HeaderText="Position" />
                        <asp:BoundField DataField="quali_name" HeaderText="Qualification" />
                        <asp:BoundField DataField="vacanci_basicpay" HeaderText="Basic Salary" />
                        <asp:BoundField DataField="vacanci_novacancies" HeaderText="No of Vacancies" />
                        <asp:BoundField DataField="vacanci_postddate" HeaderText="Last date for Applying" />
                        <asp:TemplateField HeaderText="Edit\Delete">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("vacanci_id") %>' CommandName="ed">Edit</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("vacanci_id") %>' CommandName="del">Delete</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" style="width: 341px">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td style="width: 874px">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2" style="width: 341px">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td style="width: 874px">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

