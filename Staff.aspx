<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Staff.aspx.cs" Inherits="Admin_Default" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 23px;
        }
        .auto-style3 {
            width: 469px;
        }
        .auto-style4 {
            height: 23px;
            width: 469px;
        }
        .auto-style5 {
            width: 469px;
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
            <td class="auto-style3">&nbsp;</td>
            <td>ADD NEW STAFF</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">First Name</td>
            <td class="auto-style6">
                <asp:TextBox ID="txt_fname" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Last Name</td>
            <td>
                <asp:TextBox ID="txt_lname" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Designaton</td>
            <td>
                <asp:DropDownList ID="ddl_designation" runat="server" Height="16px" Width="123px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">Gender</td>
            <td class="auto-style2">
                <asp:RadioButtonList ID="rbl_gender" runat="server" RepeatDirection="Horizontal" Width="132px">
                    <asp:ListItem Value="male">Male</asp:ListItem>
                    <asp:ListItem Value="female">Female</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Date Of Birth</td>
            <td>
                <asp:TextBox ID="txt_dob" runat="server" TextMode="Date"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Maritial Status</td>
            <td>
                <asp:RadioButtonList ID="rbl_mstatus" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="married">Married</asp:ListItem>
                    <asp:ListItem Value="unmarried">Unmarried</asp:ListItem>
                    <asp:ListItem Value="divorced">Divorced</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">House Name</td>
            <td>
                <asp:TextBox ID="txt_hname" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Post Office</td>
            <td>
                <asp:TextBox ID="txt_po" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Place</td>
            <td>
                <asp:TextBox ID="txt_place" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">District</td>
            <td>
                <asp:DropDownList ID="ddl_district" runat="server" AutoPostBack="True" Height="16px" Width="123px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Pin Code</td>
            <td>
                <asp:TextBox ID="txt_pin" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Mobile Number</td>
            <td>
                <asp:TextBox ID="txt_mobile" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Email</td>
            <td>
                <asp:TextBox ID="txt_email" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Date Of Join</td>
            <td>
                <asp:TextBox ID="txt_doj" runat="server" TextMode="Date"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Salary</td>
            <td>
                <asp:TextBox ID="txt_salary" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Qualifiction</td>
            <td>
                <asp:DropDownList ID="ddl_qualification" runat="server" Height="16px" Width="123px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Experience</td>
            <td>
                <asp:TextBox ID="txt_experience" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">User Name</td>
            <td>
                <asp:TextBox ID="txt_uname" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Password</td>
            <td>
                <asp:TextBox ID="txt_pwd" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Image Upload</td>
            <td>
                <asp:FileUpload ID="fu_img" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td>
                <asp:Button ID="btn_save" runat="server" Text="Save" OnClick="btn_save_Click" />
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" style="margin-left: 4px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="staff_fname" HeaderText="First Name" />
                        <asp:BoundField DataField="staff_lname" HeaderText="Last Name" />
                        <asp:BoundField DataField="desig_id" HeaderText="Designation" />
                        <asp:BoundField DataField="staff_gender" HeaderText="Gender" />
                        <asp:BoundField DataField="staff_dob" HeaderText="Date of Birth" />
                        <asp:BoundField DataField="staff_mstatus" HeaderText="Maritial Status" />
                        <asp:BoundField DataField="staff_hname" HeaderText="House Name" />
                        <asp:BoundField DataField="staff_mob" HeaderText="Mobile Number" />
                        <asp:BoundField DataField="staff_email" HeaderText="Email" />
                        <asp:BoundField DataField="staff_doj" HeaderText="Date of Join" />
                        <asp:BoundField DataField="quali_id" HeaderText="Qualifiction" />
                        <asp:BoundField DataField="staff_expe" HeaderText="Experience" />
                        <asp:BoundField DataField="staff_uname" HeaderText="User Name" />
                        <asp:BoundField DataField="staff_pwd" HeaderText="Password" />
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <img src="image/<%#Eval("staff_image") %>" height="100" width="100" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Edit\Delete"></asp:TemplateField>
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
    </table>
</asp:Content>

