<%@ Page Title="" Language="C#" MasterPageFile="~/userMaster.master" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Net.Mail" %>
<%@ Import Namespace="System.Net" %>

<script runat="server">

    protected void txtCanel_Click(object sender, EventArgs e)
    {
        string email = "";
        string username = "";
        if (Request.Cookies["userInfo"] != null)
        {
            email = Request.Cookies["userInfo"].Values["email"];
            username = Request.Cookies["userInfo"].Values["usern"];
        }
        string room = txtRoomNumber.Text;
        string reservation = txtReservationNumber.Text;
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|Hotel.mdf;Integrated Security=True";
        string strdelete1 = "DELETE FROM [dbo].[reservation] "
       + "WHERE reservationnumber = '" + reservation + "'";
        
        string strdelete2 = "DELETE FROM [dbo].[rooms] "
       + "WHERE roomnumber = '" + room + "'";

        SqlCommand cmddelete1 = new SqlCommand(strdelete1, conn);
        SqlCommand cmddelete2 = new SqlCommand(strdelete2, conn);

        conn.Open();
        cmddelete1.ExecuteNonQuery();
        cmddelete2.ExecuteNonQuery();
        conn.Close();

        lblmsg.Text = "you reservation cancelled";

        MailMessage msg = new MailMessage("CSCE4502@gmail.com", email);
        msg.Subject = "Cancel Reservation";
        msg.Body = "Your Reservations MR " + username + " Has Been Cancled ";
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td colspan="3">
                <asp:Label ID="Label1" runat="server" Text="Canel Reservation"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Room Number :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtRoomNumber" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRoomNumber" ErrorMessage="Enter The Room Number"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Reaservation Number :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtReservationNumber" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtReservationNumber" ErrorMessage="Enter The Reservation Number"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="txtCanel" runat="server" OnClick="txtCanel_Click" Text="Canel" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

