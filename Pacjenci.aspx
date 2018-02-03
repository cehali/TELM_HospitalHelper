<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Pacjenci.aspx.cs" Inherits="Pacjenci" %>

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
        .auto-style1 {
            width: 5px;
            height: 26px;
        }
        .auto-style2 {
            width: 9px;
            height: 26px;
        }
        .auto-style3 {
            width: 125px;
            height: 26px;
        }
        .auto-style4 {
            width: 5px;
            height: 19px;
        }
        .auto-style5 {
            width: 9px;
            height: 19px;
        }
        .auto-style6 {
            width: 125px;
            height: 19px;
        }
        .hiddencol
        {
            display: none;
        }
          
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
    
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="container">
        <asp:TextBox ID="txtSearch" runat="server" />
        <asp:Button  class="btn"  data-toggle="modal" Text="Szukaj" runat="server" OnClick="Search" ID="txtSearch_btn" />
        <br />
        <br />
        <asp:GridView class="table table-striped" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataPacjenci" CellPadding="4" DataKeyNames="Id" ForeColor="#333333" GridLines="None" AllowPaging="True" OnRowCommand="GridView1_RowCommand">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol">
<HeaderStyle CssClass="hiddencol"></HeaderStyle>

<ItemStyle CssClass="hiddencol"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" />
                <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" SortExpression="Nazwisko" />
                <asp:BoundField DataField="Wiek" HeaderText="Wiek" SortExpression="Wiek" />
                <asp:BoundField DataField="Plec" HeaderText="Plec" SortExpression="Plec" />
                <asp:CommandField ShowEditButton="True" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Czy na pewno chcesz usunąć pacjenta?');"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataPacjenci" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Pacjenci]" UpdateCommand ="UPDATE [Pacjenci] SET [Imie] = @Imie, [Nazwisko] = @Nazwisko, [Wiek] = @Wiek, [Plec] = @Plec where [Id] = @Id" DeleteCommand ="INSERT INTO Historia_recept SELECT Pacjenci.Id, Pacjenci.Imie, Pacjenci.Nazwisko, Pacjenci.Wiek, Pacjenci.Plec, Recepty.Id, Leki.Id, Leki.Nazwa, Recepty.Dawka, Recepty.Data, Recepty.Lekarz FROM Recepty inner join Pacjenci on Pacjenci.Id = Recepty.Id_pacjenta inner join Leki on Leki.Id = Recepty.Id_leku where Recepty.Id_pacjenta = @id DELETE from [Pacjenci] where [Id] = @Id"></asp:SqlDataSource>
        <br />
    
        <asp:GridView class="table table-striped" ID="GridView2" runat="server">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    
        <br />
    
        <asp:Button class="btn"  data-toggle="modal" ID="Dodaj_recepte" runat="server" OnClick="Dodaj_recepte_Click" Text="Dodaj recepte" Visible="False" />
    
        <br />
        <asp:Button class="btn"  data-toggle="modal" ID="Dodaj_pacjenta" runat="server" OnClick="Dodaj_pacjenta_Click" Text="Dodaj pacjenta" />
    
        <br />
        <table id="addpat" runat="server" Visible="False" class="table table-striped" >
            <tr>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBox3" runat="server" BorderStyle="None" Visible="False">Imie</asp:TextBox>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox4" runat="server" BorderStyle="None" Visible="False">Nazwisko</asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBox5" runat="server" BorderStyle="None" Visible="False">Wiek</asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBox7" runat="server" BorderStyle="None" Visible="False">Plec</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
        <asp:TextBox ID="TextBox1" runat="server" Visible="False" EnableTheming="True"></asp:TextBox>
                </td>
                <td class="auto-style2">
        <asp:TextBox ID="TextBox2" runat="server" Visible="False"></asp:TextBox>
                </td>
                <td class="auto-style3">
        <asp:TextBox ID="TextBox6" runat="server" Visible="False"></asp:TextBox>
                </td>
                <td class="auto-style3">
                    <asp:DropDownList ID="DropDownList1" runat="server" Visible="False">
                        <asp:ListItem>Mezczyzna</asp:ListItem>
                        <asp:ListItem>Kobieta</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
    
        <asp:Button class="btn"  data-toggle="modal" ID="Submit_Dodaj_pacjenta" runat="server" Text="Dodaj pacjenta" OnClick="Submit_Dodaj_pacjenta_Click" Visible="False" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <asp:Button class="btn"  data-toggle="modal" ID="Back1" runat="server" OnClick="Back1_Click" Text="Powrót" />
                <br />
        <br />
        <asp:Button class="btn"  data-toggle="modal" ID="Back2" runat="server" OnClick="Back2_Click" Text="Powrót" Visible="False" />
       <br />
        <br />
             </div>
    </div>
    </form>
</body>
</html>
