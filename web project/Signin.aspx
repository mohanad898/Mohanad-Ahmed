<%@ Page Language="C#" %>
<%@import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        // Create Connection Object
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|Hotel.mdf;Integrated Security=True";

        // Create SQL Select string
        string strSelect = "SELECT * FROM [dbo].[user] "
            + " WHERE username = '" + txtusername.Text + "' AND "
            + " password = '" + txtpassword.Text + "'";

        // Create SQL Command
        SqlCommand cmdSelect = new SqlCommand(strSelect, conn);

        SqlDataReader reader;
        conn.Open();
        reader = cmdSelect.ExecuteReader();

        if (reader.Read())
        {
            HttpCookie koko = new HttpCookie("userInfo");
            koko.Values.Add("usern", txtusername.Text);
            koko.Values.Add("passw", txtpassword.Text);
            koko.Expires = DateTime.Now.AddDays(10);
            Response.Cookies.Add(koko);
            if (txtusername.Text == "admin2019")
                Response.Redirect("~/adminHome.aspx");
            else if (txtusername.Text == "staff2019")
                Response.Redirect("~/staffHome.aspx");
            else
            {
                Response.Redirect("~/userHome.aspx");
            }
        }

        else
            lblmsg.Text = "Invalid Username and/or Password, please, try again!!";

        conn.Close();
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            border: 6px solid #000000;
        }
        .auto-style2 {
            height: 79px;
        }
        .auto-style3 {
            height: 93px;
        }
        .auto-style4 {
            height: 79px;
            width: 402px;
        }
        .auto-style5 {
            height: 93px;
            width: 402px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
                </td>
                <td class="auto-style2" colspan="2">
                    <asp:TextBox ID="txtusername" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                </td>
                <td class="auto-style3" colspan="2">
                    <asp:TextBox ID="txtpassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="height: 26px" Text="Login" />
                </td>
                <td class="auto-style2">
                    <asp:Label ID="lblmsg" runat="server" Font-Size="Large" ForeColor="Red"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/ForgetPassword.aspx">Forget Password</asp:HyperLink>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
