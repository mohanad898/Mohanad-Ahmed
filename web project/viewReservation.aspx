<%@ Page Title="" Language="C#" MasterPageFile="~/userMaster.master" %>
<%@import Namespace="System.Data.SqlClient" %>
<%@import Namespace="System.Data" %>
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
            string strSelect = "SELECT * FROM [dbo].[reservation] "
                + " WHERE Username = '" + username + "'";

            // Create SQL Command
            SqlCommand cmdSelect = new SqlCommand(strSelect, conn);

            
           DataTable tbl = new DataTable();
        
        
            conn.Open();
            tbl.Load(cmdSelect.ExecuteReader());
            conn.Close();

            gvdview.DataSource = tbl;
            gvdview.DataBind();
        
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" Font-Names="Arial" Font-Size="Large" ForeColor="#000066" Text="Your Reservation Data :"></asp:Label>
    <br />
    <asp:GridView ID="gvdview" runat="server">
    </asp:GridView>
    <br />
</asp:Content>

