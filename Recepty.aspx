<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Recepty.aspx.cs" Inherits="Recepty" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
          body{
            background-color: #2d2d30;
       }
       .btn {
            padding: 10px 20px;
            background-color: #5D7B9D;
            color: #f1f1f1;
            border-radius: 0;
            transition: .2s;
            margin-top:10px;
  }
       .btn:hover, .btn:focus {
            border: 1px solid #333;
            background-color: #fff;
            color: #000;
            }
       .table-striped > tbody > tr:nth-of-type(2n+1) {
            background-color: #5D7B9D;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
         <div class="container">
        <table class="table table-striped">
            <tr>
                <td>
                    Imie pacjenta</td>
                <td>
                    Nazwisko pacjenta</td>
                <td>Nazwa leku</td>
                <td>Dawka</td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Imie" DataValueField="Imie" Height="27px">
                    </asp:DropDownList>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Imie] FROM [Pacjenci]"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Nazwisko" DataValueField="Nazwisko" Height="27px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Nazwisko] FROM [Pacjenci]"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="Nazwa" DataValueField="Nazwa" Height="27px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Nazwa] FROM [Leki]"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:TextBox ID="TextBox8" runat="server" Height="27px"></asp:TextBox>
                </td>
            </tr>
        </table>
        <br />
        <asp:Button class="btn"  data-toggle="modal" ID="Submit_Dodaj_recepte" runat="server" OnClick="Submit_Dodaj_recepte_Click" Text="Dodaj recepte" />
        <br />
        <br />
        <asp:Button class="btn"  data-toggle="modal" ID="Back" runat="server" OnClick="Back_Click" Text="Powrót" />
        <br />
   </div>
              </form>
</body>
</html>