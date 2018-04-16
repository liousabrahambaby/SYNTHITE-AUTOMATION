<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ViewMoreVacanciApplication.aspx.cs" Inherits="Admin_Default" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
        }
        .auto-style3 {
            width: 116px;
        }
        .auto-style4 {
            width: 116px;
            height: 24px;
        }
        .auto-style5 {
            height: 24px;
        }
    </style>
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style2" colspan="2">VIEW VACANCY APPLICANTS DETAILS</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">First Name</td>
            <td>
                <asp:Label ID="lbl_fname" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Last Name</td>
            <td>
                <asp:Label ID="lbl_lname" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Gender</td>
            <td>
                <asp:Label ID="lbl_gender" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Date of Birth</td>
            <td>
                <asp:Label ID="lbl_dob" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">Qualification</td>
            <td class="auto-style5">
                <asp:Label ID="lbl_quali" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Aggregate Marks</td>
            <td>
                <asp:Label ID="lbl_marks" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Experience</td>
            <td>
                <asp:Label ID="lbl_expe" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">House Name</td>
            <td>
                <asp:Label ID="lbl_hname" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Post Office</td>
            <td>
                <asp:Label ID="lbl_po" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">District</td>
            <td>
                <asp:Label ID="lbl_district" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Place</td>
            <td>
                <asp:Label ID="lbl_place" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Pin Code</td>
            <td>
                <asp:Label ID="lbl_pin" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Mobile Number</td>
            <td>
                <asp:Label ID="lbl_mobile" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Email</td>
            <td>
                <asp:Label ID="lbl_email" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">View Resume</td>
            <td>
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Download</asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>

