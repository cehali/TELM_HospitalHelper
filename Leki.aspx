<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Leki.aspx.cs" Inherits="Leki" %>

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
                width: 127px;
        }
        .auto-style2 {
                width: 125px;
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
          <br />
        <asp:TextBox ID="txtSearch" runat="server" />
        <asp:Button  class="btn"  data-toggle="modal" Text="Szukaj" runat="server" OnClick="Search" ID="txtSearch_btn" />
        <asp:GridView class="table table-striped" style="margin-top:20px;" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataLeki" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="Id">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
         <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="False" ReadOnly="True" Visible="False" />
               <asp:BoundField DataField="Nazwa" HeaderText="Nazwa" SortExpression="Nazwa" />
               <asp:BoundField DataField="Zalecana_dawka" HeaderText="Zalecana dawka" SortExpression="Zalecana_dawka" />
              <asp:BoundField DataField="Jednostka" HeaderText="Jednostka" SortExpression="Jednostka" />
                <asp:CommandField ShowEditButton="True" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Czy na pewno chcesz usunąć lek?');"></asp:LinkButton>
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
          

    
        <asp:SqlDataSource ID="SqlDataLeki" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Leki]" UpdateCommand ="UPDATE [Leki] SET [Nazwa] = @Nazwa, [Zalecana_dawka] = @Zalecana_dawka, [Jednostka] = @Jednostka where [Id] = @Id" DeleteCommand ="DELETE from [Leki] where [Id] = @Id"></asp:SqlDataSource>
    
        <br />
    
        <asp:Button class="btn"  data-toggle="modal"  ID="Dodaj_lek" runat="server" OnClick="Dodaj_lek_Click" Text="Dodaj lek" />
    
        <br />


      <table id="addtable" runat="server" class="table table-striped" Visible="false">
        <thead>  
          <tr>
                  <th>  <asp:TextBox ID="TextBox3" runat="server" BorderStyle="None" Visible="False">Nazwa</asp:TextBox> </th>
                  <th> <asp:TextBox ID="TextBox4" runat="server" BorderStyle="None" Visible="False">Zalecana dawka</asp:TextBox></th> 
                  <th>  <asp:TextBox ID="TextBox5" runat="server" BorderStyle="None" Visible="False">Jednostka</asp:TextBox></th>
               
            </tr>
        </thead>
        <tbody>
            <tr>
                
        <td><asp:TextBox ID="TextBox1" runat="server" Visible="False" EnableTheming="True"></asp:TextBox> </td>
                
                
        <td><asp:TextBox ID="TextBox2" runat="server" Visible="False"></asp:TextBox></td>
              
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" Visible="False">
                        <asp:ListItem>mg</asp:ListItem>
                        <asp:ListItem>ml</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
         </tbody>
        </table>



    
        <asp:Button class="btn"  data-toggle="modal"  ID="Submit_Dodaj_lek" runat="server" Text="Zapisz" OnClick="Submit_Dodaj_lek_Click" Visible="False" />
        <br />
        <br />
        <asp:Button class="btn"  data-toggle="modal"  ID="Back" runat="server" OnClick="Back_Click" Text="Powrót" />
        <br />
        <br />
    </div>
        </div>
    </form>
    
</body>
</html>
