<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMasterPage.master" AutoEventWireup="true" CodeFile="ApplyVacancies.aspx.cs" Inherits="User_Default" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 127px;
        }
    </style>
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>VACANCY APPLICATION</td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">First Name</td>
            <td>
                <asp:TextBox ID="txt_fname" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Last Name</td>
            <td>
                <asp:TextBox ID="txt_lname" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Gender </td>
            <td>
                <asp:RadioButtonList ID="rbl_gender" runat="server" Font-Bold="True" RepeatDirection="Horizontal">
                    <asp:ListItem Value="male">Male</asp:ListItem>
                    <asp:ListItem Value="female">Female</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Date of Birth</td>
            <td>
                <asp:TextBox ID="txt_dob" runat="server" TextMode="Date"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Qualification</td>
            <td>
                <asp:DropDownList ID="ddl_quali" runat="server" Height="23px" Width="126px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Aggregate Marks</td>
            <td>
                <asp:TextBox ID="txt_marks" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Experience</td>
            <td>
                <asp:TextBox ID="txt_expe" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">House Name</td>
            <td>
                <asp:TextBox ID="txt_hname" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Post Office</td>
            <td>
                <asp:TextBox ID="txt_po" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">District</td>
            <td>
                <asp:DropDownList ID="ddl_district" runat="server" AutoPostBack="True" Height="23px" OnSelectedIndexChanged="ddl_district_SelectedIndexChanged" Width="126px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Place</td>
            <td>
                <asp:DropDownList ID="ddl_place" runat="server" Height="23px" OnSelectedIndexChanged="ddl_place_SelectedIndexChanged" Width="126px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Pin Code</td>
            <td>
                <asp:TextBox ID="txt_pin" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Mobile Number</td>
            <td>
                <asp:TextBox ID="txt_mobile" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Email</td>
            <td>
                <asp:TextBox ID="txt_email" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Upload Resume</td>
            <td>
                <asp:FileUpload ID="fu_resume" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>
                <asp:Button ID="txt_save" runat="server" OnClick="txt_save_Click" Text="Apply" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

