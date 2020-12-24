<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            border-collapse: collapse;
            border: 1px solid #000000;
        }
        .auto-style2 {
            height: 75px;
        }
        .auto-style5 {
            height: 137px;
            font-weight: 700;
        }
        .auto-style7 {
            height: 75px;
            width: 315px;
        }
        .auto-style10 {
            height: 75px;
            width: 214px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style5" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label1" runat="server" Font-Size="XX-Large" ForeColor="#000066" Text="Welcome to MKM Hotel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:HyperLink ID="signup" runat="server" NavigateUrl="~/Signup.aspx">Sign up</asp:HyperLink>
                </td>
                <td class="auto-style10">
                    <asp:HyperLink ID="signin" runat="server" NavigateUrl="~/Signin.aspx">Sign in</asp:HyperLink>
                </td>
                <td class="auto-style2">
                    <asp:HyperLink ID="checkrooms" runat="server" NavigateUrl="~/checkrooms.aspx">Check available rooms</asp:HyperLink>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
