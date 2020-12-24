<%@ Page Title="" Language="C#" MasterPageFile="~/userMaster.master" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Net.Mail" %>
<%@ Import Namespace="System.Net" %>

<script runat="server">

    int roomnum;
    int resrvnum;
    string mystring;
    string mystring2;
    string price;
    int nightsnum;
    int countsingle=0, countdouble=0, countsuite=0;
    
    protected void Button1_Click(object sender, EventArgs e)
    {
       
        Random rand = new Random();
        roomnum = rand.Next(1,300);
        resrvnum = rand.Next(300, 1000);
        mystring = roomnum.ToString();
        mystring2 = resrvnum.ToString();
        
       // night = ddlnights.SelectedValue;
        nightsnum = int.Parse(ddlnights.SelectedValue);
        if (nightsnum <= 5 && ddlroomtype.SelectedValue == "Single")
        {
            price = "2000";
            
        }
        else if (nightsnum > 5 && ddlroomtype.SelectedValue == "Single")
        {
            price = "5000";
        }

        else if (nightsnum <= 5 && ddlroomtype.SelectedValue == "Double")
        {
            price = "3000";

        }
        else if (nightsnum > 5 && ddlroomtype.SelectedValue == "Double")
        {
            price = "6000";
        }

        else if (nightsnum <= 5 && ddlroomtype.SelectedValue == "Suite")
        {
            price = "4000";

        }
        else if (nightsnum > 5 && ddlroomtype.SelectedValue == "Suite")
        {
            price = "7000";
        }

        txtroomnumber.Text = mystring;
        txtreservenumber.Text = mystring2;
        txtprice.Text = price;
        
        lblprice.Visible = true;
        lblreserve.Visible = true;
        lblnumber.Visible = true;
        txtprice.Visible = true;
        txtreservenumber.Visible = true;
        txtroomnumber.Visible = true;
        btnconfirm.Visible = true;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string email = "";
        string username = "";
        if (Request.Cookies["userInfo"] != null)
        {
            email = Request.Cookies["userInfo"].Values["email"];
            username = Request.Cookies["userInfo"].Values["usern"];
        }
        
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|Hotel.mdf;Integrated Security=True";
        
        
        if (ddlroomtype.SelectedValue == "Single")
        {
            countsingle += 1;
        }
        if (ddlroomtype.SelectedValue == "Double")
        {
            countdouble += 1;
        }

        if (ddlroomtype.SelectedValue == "Suite")
        {
            countsuite += 1;
        }
        
       string strInsert = "INSERT INTO [dbo].[rooms] "
            + " VALUES('" + txtroomnumber.Text + "', '"
            + ddlroomtype.SelectedValue + "', '"
            + txtprice.Text + "', '"
            + ' ' + "', '"
            + countsingle + "', '"
            + countdouble + "', '"
            + countsuite  + "')";
        
       string strInsert2 = "INSERT INTO [dbo].[reservation] "
          + " VALUES('" + txtreservenumber.Text + "', '"
          + txtcheckin.Text + "', '"
          + txtcheckout.Text + "', '"
          + ddlnights.SelectedValue + "', '"
          + txtroomnumber.Text + "', '"
          + username + "', '" + txtprice.Text + "')";
        // create sql command
       SqlCommand cmdInsert = new SqlCommand(strInsert,conn);
       SqlCommand cmdInsert2 = new SqlCommand(strInsert2,conn);
            conn.Open();
            cmdInsert.ExecuteNonQuery();
            cmdInsert2.ExecuteNonQuery();
            conn.Close();
            lblmsg.Text = " Successfully Reservation ";
        
            MailMessage msg = new MailMessage("CSCE4502@gmail.com", email);
            msg.Subject = "Confirm Reservation";
            msg.Body = "Your Reservations MR " + username + " Has Been confirmed ";
            SmtpClient sclient = new SmtpClient("smtp.gmail.com", 587);
            NetworkCredential auth = new NetworkCredential("CSCE4502@gmail.com", "csce4502f16");
            sclient.UseDefaultCredentials = false;
            sclient.Credentials = auth;
            sclient.EnableSsl = true;
            try
            {

                sclient.Send(msg);


            }
            catch (Exception ex)
            {

                throw;

            }
        
        
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 100%;
            border: 4px solid #000000;
        }
        .auto-style4 {
            width: 421px;
        }
        .auto-style5 {
            width: 421px;
            height: 23px;
        }
        .auto-style6 {
            width: 421px;
            height: 26px;
        }
        .auto-style7 {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style3">
        <tr>
            <td class="auto-style4">
                <asp:Label ID="Label1" runat="server" Text="Room Type :"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlroomtype" runat="server">
                    <asp:ListItem Selected="True">Single</asp:ListItem>
                    <asp:ListItem>Double</asp:ListItem>
                    <asp:ListItem>Suite</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:Label ID="Label2" runat="server" Text="Number of Nights :"></asp:Label>
            </td>
            <td class="auto-style7">
                <asp:DropDownList ID="ddlnights" runat="server">
                    <asp:ListItem Selected="True">1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="Label3" runat="server" Text="Check in Date :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtcheckin" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="Label4" runat="server" Text="Check out Date :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtcheckout" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="lblprice" runat="server" Text="Price :" Visible="False"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtprice" runat="server" Enabled="False" Visible="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="lblnumber" runat="server" Text="Room Number :" Visible="False"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtroomnumber" runat="server" Enabled="False" Visible="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="lblreserve" runat="server" Text="Reservation Number :" Visible="False"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtreservenumber" runat="server" Enabled="False" Visible="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Button ID="btnshowprice" runat="server" OnClick="Button1_Click" Text="Show Price" />
            </td>
            <td class="auto-style2">
                <asp:Button ID="btnconfirm" runat="server" Text="Confirm Reservation" OnClick="Button2_Click" />
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
            </td>
            <td class="auto-style2">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

