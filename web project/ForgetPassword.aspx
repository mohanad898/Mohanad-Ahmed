<%@ Page Language="C#" %>
<%@ Import Namespace="System.Net.Mail" %>
<%@ Import Namespace="System.Net" %>
<!DOCTYPE html>

<script runat="server">

    protected void btnSend_Click(object sender, EventArgs e)
    {
        MailMessage msg = new MailMessage("CSCE4502@gmail.com", txtEmail.Text);
        msg.Subject = "Reset Password";
        msg.Body = "To Reset your password enter this link:http://localhost:60990/web%20project/ResetPassword.aspx";
        SmtpClient sClient = new SmtpClient("smtp.gmail.com", 587);
        NetworkCredential auth = new NetworkCredential("CSCE4502@gmail.com", "csce4502f16");
        sClient.UseDefaultCredentials = false;
        sClient.Credentials = auth;
        sClient.EnableSsl = true;
        try
        {
            sClient.Send(msg);
        }
        catch (Exception ex)
        {
            throw;
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Font-Names="Arial" Font-Size="X-Large" ForeColor="#000066" Text="Forget Password:"></asp:Label>
        <br />
        <table class="auto-style1">
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Enter the Email :"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="btnSend" runat="server" OnClick="btnSend_Click" Text="Send" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
