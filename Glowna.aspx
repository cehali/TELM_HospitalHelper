<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Glowna.aspx.cs" Inherits="Logowanie" %>

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
            background-color: #333;
            color: #f1f1f1;
            border-radius: 0;
            transition: .2s;
  }
         .btn:hover, .btn:focus {
            border: 1px solid #333;
            background-color: #fff;
            color: #000;
            }
         .thumbnail {
            padding: 0 0 15px 0;
            border: none;
            border-radius: 0;
  }
        .thumbnail p {
            margin-top: 15px;
            color: #555;
  }
        .bg-1 h3 {
            color: #fff;
}
        </style>
</head>
<body>
  <form id="form2" runat="server">
   
    <div>
    <div id="tour" class="bg-1"> 
       
       <h3 class="text-center" style="margin-top:60px; margin-bottom:60px;">SYSTEM ZARZĄDZANIA PODAWANIEM LEKÓW</h3>
        </div>
      
      
         <div class="row text-center">
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="pacjenci.jpg" alt="Pacjenci" width="100%" height="100%"/>
         
          <p>Przejdź do spisu pacjentów</p>
          
          <asp:Button class="btn" data-toggle="modal" data-target="#myModal" ID="Button3" runat="server" OnClick="Button1_Click" Text="Pacjenci" />
             </div>
      </div>

      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="leki.jpg" alt="Leki" width="100%" height="100%"/>
        
          <p>Przejdź do spisu leków</p>
          
            <asp:Button class="btn" data-toggle="modal" ID="Button1" runat="server" OnClick="Button2_Click" Text="Leki" />
        </div> 
      </div>
         <div class="col-sm-4">
        <div class="thumbnail">
          <img src="logout.png" alt="Wyloguj" width="100%" height="100%"/>
        
          <p>Wyloguj się z systemu</p>
        <asp:Button class="btn" data-toggle="modal" data-target="#myModal" ID="Button_Logout" runat="server" OnClick="Button_Logout_Click" Text="Wyloguj" />
    </div>
             </div>
        </div>
    </div>
    </form>
</body>
</html>
