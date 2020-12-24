<%@ Page Title="" Language="C#" MasterPageFile="~/userMaster.master" %>
<%@import Namespace="System.Data.SqlClient" %>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Get username from the Cookie
            string username = "";
            if (Request.Cookies["userInfo"] != null)
            {
                username = Request.Cookies["userInfo"].Values["usern"];
            }
            // Create Connection Object
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|Hotel.mdf;Integrated Security=True";

            // Create SQL Select string
            string strSelect = "SELECT * FROM [dbo].[user] "
                + " WHERE Username = '" + username + "'";

            // Create SQL Command
            SqlCommand cmdSelect = new SqlCommand(strSelect, conn);

            SqlDataReader reader;
            conn.Open();
            reader = cmdSelect.ExecuteReader();

            if (reader.Read())
            {
                txtCurrentPass.Text = (string)reader.GetValue(7);
            }
            conn.Close();
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string username = "";
        if (Request.Cookies["userInfo"] != null)
            username = Request.Cookies["userInfo"].Values["usern"];
        // Create Connection Object
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|Hotel.mdf;Integrated Security=True";
        // Create SQL Select string
        string strUpdate = "UPDATE [dbo].[user] "
           + " SET password = '" + txtNewPassword.Text +  "'"
           + " WHERE username = '" + username + "'";
        // Create SQL Command
        SqlCommand cmdUpdate = new SqlCommand(strUpdate, conn);
        conn.Open();
        cmdUpdate.ExecuteNonQuery();
        conn.Close();
        lblmsg.Text = "Your Password has been successfully updated!!";
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Large" ForeColor="#000066" Text="Change Your Password:"></asp:Label>
    <br />
    <table class="auto-style1">
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Current Password :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtCurrentPass" runat="server" Enabled="False"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Enter New Paasword :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtNewPassword" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Confirm New Password :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtConfirmNewPassword" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
</asp:Content>

