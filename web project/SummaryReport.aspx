<%@ Page Title="" Language="C#" MasterPageFile="~/staffMaster.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
    <br />
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#000066" Text="Reservation of all Guests :"></asp:Label>
</p>
<p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="reservationnumber" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="reservationnumber" HeaderText="reservationnumber" ReadOnly="True" SortExpression="reservationnumber" />
            <asp:BoundField DataField="CheckIn" HeaderText="CheckIn" SortExpression="CheckIn" />
            <asp:BoundField DataField="CheckOut" HeaderText="CheckOut" SortExpression="CheckOut" />
            <asp:BoundField DataField="NumberOfNights" HeaderText="NumberOfNights" SortExpression="NumberOfNights" />
            <asp:BoundField DataField="roomnumber" HeaderText="roomnumber" SortExpression="roomnumber" />
            <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [reservation]"></asp:SqlDataSource>
</p>
<p>
</p>
</asp:Content>

