<%@ Page Title="" Language="C#" MasterPageFile="~/staffMaster.master" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<script runat="server">

    protected void btn_Check_Click(object sender, EventArgs e)
    {
        string username = txtusername.Text;
        if (!IsPostBack)
        {
            // Get username from the Cookie


        }
        // Create Connection Object
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|Hotel.mdf;Integrated Security=True";

        // Create SQL Select string
        string strSelect = "SELECT * FROM [dbo].[reservation] "
            + " WHERE username = '" + username + "'";

        // Create SQL Command
        SqlCommand cmdSelect = new SqlCommand(strSelect, conn);

        SqlDataReader reader;
        conn.Open();
        reader = cmdSelect.ExecuteReader();

        if (reader.Read())
        {
            txtBill.Text = (string)reader.GetValue(6);
        }

        conn.Close();
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td colspan="2">
                <asp:Label ID="Label2" runat="server" Text="Check Out Bill User :"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Enter Username OF Guest :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtusername" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="BILL :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtBill" runat="server" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btn_Check" runat="server" OnClick="btn_Check_Click" Text="Check" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

