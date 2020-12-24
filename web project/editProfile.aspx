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
                txtfirstname.Text = (string)reader.GetValue(0);
                txtlastname.Text = (string)reader.GetValue(1);
                ddlguesttype.SelectedValue = (string)reader.GetValue(2);
                ddlnationality.SelectedValue = (string)reader.GetValue(3);
                txtnumber.Text = (string)reader.GetValue(4);
                txtcreditcard.Text = (string)reader.GetValue(5);
                txtusername.Text = (string)reader.GetValue(6);
                txtemail.Text = (string)reader.GetValue(8);

            }

            conn.Close();
        }
    }
    protected void btnEdit_Click1(object sender, EventArgs e)
    {
        txtfirstname.Enabled = true;
        txtlastname.Enabled = true;
        ddlguesttype.Enabled = true;
        ddlnationality.Enabled = true;
        txtnumber.Enabled = true;
        txtcreditcard.Enabled = true;
        txtemail.Enabled = true;
        btnSave.Visible = true;
    }
    protected void btnSave_Click1(object sender, EventArgs e)
    {
        string username = "";
        if (Request.Cookies["userInfo"] != null)
            username = Request.Cookies["userInfo"].Values["usern"];
        // Create Connection Object
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|Hotel.mdf;Integrated Security=True";
        // Create SQL Select string
        string strUpdate = "UPDATE [dbo].[user] "
           + " SET firstname = '" + txtfirstname.Text + "', "
           + " lastname = '" + txtlastname.Text + "', "
           + " guesttype = '" + ddlguesttype.SelectedValue + "', "
           + " nationality = '" + ddlnationality.SelectedValue + "', "
           + " phonenumber = '" + txtnumber.Text + "', "
           + " creditcardnumber = '" + txtcreditcard.Text + "', "
           + " email = '" + txtemail.Text + "'"
           + " WHERE username = '" + username + "'";
        // Create SQL Command
        SqlCommand cmdUpdate = new SqlCommand(strUpdate, conn);
        conn.Open();
        cmdUpdate.ExecuteNonQuery();
        conn.Close();
        lblmsg.Text = "Your Account has been successfully updated!!";
    }
    protected void btnEdit_Click(object sender, EventArgs e){}
    protected void btnSave_Click(object sender, EventArgs e){}
    protected void ddlguesttype_SelectedIndexChanged(object sender, EventArgs e){}
    protected void ddlnationality_SelectedIndexChanged(object sender, EventArgs e){}
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" Font-Names="Arial" Font-Size="Large" ForeColor="#000066" Text="Edit Profile :"></asp:Label>
    <br />
    <table class="auto-style1">
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="First Name :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtfirstname" runat="server" Enabled="False"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Last Name"></asp:Label>
            </td>
            <td>
                    <asp:TextBox ID="txtlastname" runat="server" Enabled="False"></asp:TextBox>
                </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Guest Type"></asp:Label>
            </td>
            <td>
                    <asp:DropDownList ID="ddlguesttype" runat="server" OnSelectedIndexChanged="ddlguesttype_SelectedIndexChanged" Enabled="False">
                        <asp:ListItem Selected="True">Local</asp:ListItem>
                        <asp:ListItem>Foreigner</asp:ListItem>
                        <asp:ListItem>Group</asp:ListItem>
                    </asp:DropDownList>
                </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Nationality"></asp:Label>
            </td>
            <td>
                    <asp:DropDownList ID="ddlnationality" runat="server" Enabled="False" OnSelectedIndexChanged="ddlnationality_SelectedIndexChanged">
                        <asp:ListItem Selected="True">Egyptian</asp:ListItem>
                        <asp:ListItem>French</asp:ListItem>
                        <asp:ListItem>American</asp:ListItem>
                        <asp:ListItem>German</asp:ListItem>
                        <asp:ListItem>Saudi Arabian</asp:ListItem>
                        <asp:ListItem>Canadian</asp:ListItem>
                        <asp:ListItem>British</asp:ListItem>
                    </asp:DropDownList>
                </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Phone Number"></asp:Label>
            </td>
            <td>
                    <asp:TextBox ID="txtnumber" runat="server" Enabled="False"></asp:TextBox>
                </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="Credit Card Number"></asp:Label>
            </td>
            <td>
                    <asp:TextBox ID="txtcreditcard" runat="server" Enabled="False"></asp:TextBox>
                </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label8" runat="server" Text="Username"></asp:Label>
            </td>
            <td>
                    <asp:TextBox ID="txtusername" runat="server" Enabled="False"></asp:TextBox>
                </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label9" runat="server" Text="Email"></asp:Label>
            </td>
            <td>
                    <asp:TextBox ID="txtemail" runat="server" Enabled="False"></asp:TextBox>
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
            <td>
                <asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click1" />
            </td>
            <td>
                <asp:Button ID="btnSave" runat="server" Text="Save" Visible="False" OnClick="btnSave_Click1" />
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

