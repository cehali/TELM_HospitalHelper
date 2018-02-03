<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Logowanie.aspx.cs" Inherits="_Default"%>

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
            width: 92px;
            
        }
        .carousel-inner > .item > img,
        .carousel-inner > .item > a > img {
            width: 50%;
            margin: auto;
            margin-top: 20px;
        }
        .carousel-inner > .item > .carousel-caption > p {
             font-size: 1.5vw;
            overflow-wrap: break-word;
            font-weight: bold;
            width: 50%;
            margin: auto;
            margin-top: 20px;
        }
        .carousel-control{
            width:38%;
            margin-top: 20px;
            
        }
        .carousel-control.right {
            background-image: linear-gradient(to right,rgba(0,0,0,.0001) 0,rgba(153, 241, 248, 0.9) 100%);
            }
        .carousel-control.left {
            background-image: linear-gradient(to right,rgba(153, 241, 248, 0.9) 0,rgba(0,0,0,.0001) 100%);
            }

        body{
            background-color: #2d2d30;
            color:#92bcbc;
       }
        .form-control {
            display: block;
            width: 80%;
            height: 34px;
            padding: 6px 12px;
            font-size: 14px;
            line-height: 1.42857143;
            color: #555;
            background-color: #fff;
            background-image: none;
        }
    </style>
    

  
    </head>
<body>
  
    <div class="container" style="text-align:center;">
    <form id="form1" runat="server" class="form-horizontal">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="zdj1.jpg" alt="Zadbaj o zdrowie swoich pacjentów"/>
      <div class="carousel-caption">
        <!-- <h3>Chania</h3>-->
        <p>Zadbaj o zdrowie swoich pacjentów</p>
      </div>
    </div>

    <div class="item">
      <img src="zdj2.jpg" alt="Kontroluj skład i ilość leków"/>
      <div class="carousel-caption">
     <!-- <h3>Chania</h3>-->
        <p>Kontroluj skład i ilość leków</p>
      </div>
    </div>

    <div class="item">
      <img src="zdj3.jpg" alt="Bądź mobilny w każdej chwili"/>
      <div class="carousel-caption">
       <!-- <h3>Chania</h3>-->
        <p>Bądź mobilny w każdej chwili</p>
      </div>
    </div>

    <div class="item">
      <img src="zdj4.jpg" alt="Skorzystaj z naszego katalogu zaleceń lekowych"/>
      <div class="carousel-caption">
         <!-- <h3>Chania</h3>-->
        <p>Skorzystaj z naszego katalogu zaleceń lekowych</p>
      </div>
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
  
    <h2>Zaloguj się do systemu</h2>    
  <div class="form-group">
        <label class="control-label col-sm-2" for="TextBoxLogin">Login:</label>
        <div class="col-sm-10">                
                <asp:TextBox class="form-control" ID="TextBoxLogin" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxLogin" ErrorMessage="Login wymagany" ForeColor="Red"></asp:RequiredFieldValidator>
           </div>   
           
           <label class="control-label col-sm-2" for="TextBoxHaslo">Hasło:</label>
              <div class="col-sm-10">   
                    <asp:TextBox class="form-control" ID="TextBoxHaslo" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxHaslo" ErrorMessage="Haslo wymagane" ForeColor="Red"></asp:RequiredFieldValidator>
             </div>
           
                <td class="auto-style1">&nbsp;</td>
                <td>
                    <asp:Button class="btn btn-info" ID="Button_Login" runat="server" OnClick="Button_Login_Click" Text="Zaloguj" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
   
        </div>
    </form>

</div>
    
</body>
</html>