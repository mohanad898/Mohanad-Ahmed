<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.master" %>
<%@import Namespace="System.Data.SqlClient" %>
<%@import Namespace="System.Data" %>
<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnexecute_Click(object sender, EventArgs e)
    {
        // Create Connection Object
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|Hotel.mdf;Integrated Security=True";

        // Create SQL command
        SqlCommand cmdSelect = new SqlCommand(txtsql.Text, conn);

        // Create Data Table
        DataTable tbl = new DataTable();
        try
        {
            lblmsg.Visible = false;
            conn.Open();
            tbl.Load(cmdSelect.ExecuteReader());
            conn.Close();

            gvresult.DataSource = tbl;
            gvresult.DataBind();
        }



        catch
        {
            lblmsg.Visible = true;
            lblmsg.Text = "Please, correct your SQL Query!!";
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 358px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div _designerregion="0">
    </div>
    <br />
    <table class="auto-style1" style="height: 67px; margin-top: 0px">
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#3366CC" Text="Enter Sql Statment:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtsql" runat="server" Height="64px" TextMode="MultiLine" Width="272px"></asp:TextBox>
                <br />
            </td>
        </tr>
    </table>
    <br />
    <br />
    <asp:Button ID="btnexecute" runat="server" Font-Bold="True" Font-Size="Medium" OnClick="btnexecute_Click" Text="Execute" />
    <br />
    <br />
    <asp:GridView ID="gvresult" runat="server">
    </asp:GridView>
    <br />
    <asp:Label ID="lblmsg" runat="server" Font-Size="Large" ForeColor="#000066" Visible="False"></asp:Label>
</asp:Content>

