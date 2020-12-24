<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<script runat="server">

    protected void btncheck_Click(object sender, EventArgs e)
    {
        int counts=0, countd=0, countsuite=0;
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|Hotel.mdf;Integrated Security=True";
        string type=ddlroomtype.SelectedValue;
        string strSelect = "SELECT * FROM [dbo].[rooms] ";

        // Create SQL Command
        SqlCommand cmdSelect = new SqlCommand(strSelect, conn);

        SqlDataReader reader;
        conn.Open();
        reader = cmdSelect.ExecuteReader();

        if (reader.Read())
        {
            
            counts= (int)reader.GetValue(4);
            countd= (int)reader.GetValue(5);
            countsuite= (int)reader.GetValue(6);
        }
        if (type == "Single")
        {
            if (counts <= 100)
            {
                lblmsg.Text = "Available";
            }
            else
                lblmsg.Text = " Not Available";
        }
        if (type == "Double")
        {
            if (countd <= 100)
            {
                lblmsg.Text = "Available";
            }
            else
                lblmsg.Text = " Not Available";
        }
        if (type == "Suite")
        {
            if (countsuite <= 100)
            {
                lblmsg.Text = "Available";
            }
            else
                lblmsg.Text = " Not Available";
        }

        conn.Close();
        
    }

    protected void ddlroomtype_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 215px;
        }
        .auto-style3 {
            width: 215px;
            height: 26px;
        }
        .auto-style4 {
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label1" runat="server" Text="room type"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlroomtype" runat="server" OnSelectedIndexChanged="ddlroomtype_SelectedIndexChanged">
                        <asp:ListItem Selected="True">Single</asp:ListItem>
                        <asp:ListItem>Double</asp:ListItem>
                        <asp:ListItem>Suite</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label2" runat="server" Text="check in date"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtcheckin" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtcheckin" ErrorMessage="Enter the Check In Date"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label3" runat="server" Text="check out date"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtcheckout" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtcheckout" ErrorMessage="Enter the Check Out Date"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="btncheck" runat="server" OnClick="btncheck_Click" Text="Check" />
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    <div>
    
        <asp:Label ID="lblmsg" runat="server"></asp:Label>
    
    </div>
    </form>
</body>
</html>
