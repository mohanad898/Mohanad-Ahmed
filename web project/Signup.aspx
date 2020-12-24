<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        // create connect object
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|Hotel.mdf;Integrated Security=True";
        
         // create Insert statement string
        string strInsert = "INSERT INTO [dbo].[user] "
            + " VALUES('" + txtfirstname.Text + "', '"
            + txtlastname.Text + "', '"
            + ddlguesttype.SelectedValue + "', '"
            + ddlnationality.SelectedValue + "', '"
            + txtnumber.Text + "', '"
            + txtcreditcard.Text + "', '"
            + txtusername.Text + "', '"
            + txtpassword.Text + "', '"
            + txtemail.Text + "')";
        // create sql command
        SqlCommand cmdInsert = new SqlCommand();
        cmdInsert.Connection = conn;
        cmdInsert.CommandText = strInsert;
        
        try
        {
         
            
            conn.Open();
            cmdInsert.ExecuteNonQuery();
            conn.Close();

            HttpCookie koko = new HttpCookie("userInfo");
            koko.Values.Add("usern", txtusername.Text);
            koko.Values.Add("passw", txtpassword.Text);
            koko.Values.Add("email", txtemail.Text);
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
            
        catch (SqlException err)
        {
            if (err.Number == 2627)
                lblmsg.Text = "Your Username already exists, please choose another!!";
            else
                lblmsg.Text = "Database Error!! Please, try later!!";
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            border: 10px solid #000000;
        }
        .auto-style2 {
            height: 23px;
        }
        .auto-style3 {
            height: 23px;
            width: 323px;
        }
        .auto-style4 {
            width: 323px;
        }
        .auto-style5 {
            height: 23px;
            width: 201px;
        }
        .auto-style6 {
        }
        .auto-style7 {
            height: 23px;
            width: 196px;
        }
        .auto-style8 {
            width: 196px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">
                    <asp:Label runat="server" Text="First Name"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtfirstname" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtfirstname" ErrorMessage="you must enter First name"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style2">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtfirstname" ErrorMessage="Invalid First Name" ValidationExpression="([A-Z][a-z]*\s[A-Z][a-z]*)|([A-Z][a-z]*)"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label runat="server" Text="Last Name"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtlastname" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtlastname" ErrorMessage="You must enter Last Name"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label runat="server" Text="Guest Type"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:DropDownList ID="ddlguesttype" runat="server">
                        <asp:ListItem Selected="True">Local</asp:ListItem>
                        <asp:ListItem>Foreigner</asp:ListItem>
                        <asp:ListItem>Group</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style8">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label10" runat="server" Text="Email"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtemail" ErrorMessage="You must enter Email"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtemail" ErrorMessage="Invalid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label4" runat="server" Text="Nationality"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:DropDownList ID="ddlnationality" runat="server">
                        <asp:ListItem Selected="True">Egyptian</asp:ListItem>
                        <asp:ListItem>French</asp:ListItem>
                        <asp:ListItem>American</asp:ListItem>
                        <asp:ListItem>German</asp:ListItem>
                        <asp:ListItem>Saudi Arabian</asp:ListItem>
                        <asp:ListItem>Canadian</asp:ListItem>
                        <asp:ListItem>British</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style8">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label5" runat="server" Text="Phone Number"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtnumber" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtnumber" ErrorMessage="You must enter Phone Number"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label6" runat="server" Text="Credit Card Number"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtcreditcard" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtcreditcard" ErrorMessage="You must enter your Credit Card number"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtcreditcard" ErrorMessage="Invalid Credit Card Number" ValidationExpression="\d{15}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label7" runat="server" Text="Username"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtusername" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtusername" ErrorMessage="You must enter Username"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style2">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtusername" ErrorMessage="It must be from 8-16" ValidationExpression="\w{8,16}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label8" runat="server" Text="Password"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtpassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtpassword" ErrorMessage="You must enter Password"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtpassword" ErrorMessage="Invalid Password" ValidationExpression="\w{8,}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label9" runat="server" Text="Confirm Password"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="confirmpass" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="confirmpass" ErrorMessage="Enter the same Password"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtpassword" ControlToValidate="confirmpass" ErrorMessage="Password don't match"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"></td>
                <td class="auto-style5"></td>
                <td class="auto-style7"></td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" />
                </td>
                <td class="auto-style6" colspan="3">
                    <asp:Label ID="lblmsg" runat="server" Font-Size="Large" ForeColor="#000066"></asp:Label>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
