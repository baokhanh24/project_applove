<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Note.aspx.cs" Inherits="applove.Note" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>APP LOVE</title> 
    <link rel="shortcut icon" href="img/hearts.png" type="image/png">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@300;400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/Note.css">
    <style>
       .boder{
    
            width: 100%;
            border-bottom: 1px dashed#fff;
            padding: 5px 0;
        }
       .data {
             position:relative;
             border-bottom: 1px dashed#fff;
             width:100%;
             margin-bottom: 10px;
             padding-bottom: 11px;
             padding-right:30px;
        }
       .data_list td{
          display: block;
       }
       .data_list{
           width:100%;
           table-layout: fixed;
       }
       .dropdown-content {
          display: none;
          position: absolute;
          z-index: 1;
          width: 100%;
          max-height: 200px;
          overflow-y: auto;
          border: 1px solid #ccc;
          background-color: #fff;
        }
       .btnSeach {
            border: none;
            outline: none;
            color: #fff;
            padding: 18px;
            position: absolute;
            right: 7px;
            top: 4px;
            border-radius: 5px;
            background-image: url(../img/search.png);
            background-repeat: no-repeat;
            background-position: center center;
            text-indent: -9999px;
            background-color: transparent;
            background-size: 20px 20px;
            width: 24px;
            height: 24px;
            
            cursor: pointer;
        }
       .input_search{
            padding: 10px 71px 10px 15px;
       }
      
       .fooder_note li{
           font-size: 18px;
            color: #fff;
       }
       .delete-button{
            position:absolute;
            right: 0;
            top: 16px;
            background-image: url(../img/deleteee.png);
            background-repeat: no-repeat;
            background-position: center center;
            text-indent: -9999px;
            background-color:transparent;
            background-size:24px 24px;
            width:24px;
            height:24px;
            border: none;
            cursor: pointer;
       }
       .data_little{
           display:block;
           text-overflow: clip!important;
       }
       .data_title{
           text-overflow: clip!important;
       }
    </style>
</head>
<body>
    <form runat="server" class="full__main">
        <div class="container">
            <div class="left_home">
                <a href="home.aspx"><i class='bx bx-chevron-left'></i> Home</a>
            </div>
            <div class="content">
                <span class="title">Note</span>
                <div class="div_search">
                    
                    
                    <asp:TextBox type="text" ID="search" CssClass="input_search" placeholder="Search" runat="server" />
                    <asp:Button ID="btnSeach" runat="server"  CssClass="btnSeach" OnClick="btnseach_Click" />
                </div>
                <div class="Information">
                    <div class="Information_data">
                       
                        
                           <asp:DataList ID="dlData" runat="server" CssClass="data_list" RepeatLayout="Table" RepeatColumns="2" OnItemCommand="dlData_ItemCommand">
                                <ItemTemplate>
                                    <div class="data">
                                        <a href="Edit_note.aspx?id=<%# Eval("Idnd") %>">
                                            <span class="data_title"><%# Eval("TieuDe") %></span>
                                            <span class="data_little"><%# Eval("NoiDung") %></span>
                                        </a>
                                        <asp:Button ID="btnDelete" runat="server" Text="" CommandName="Delete" 
                                            CommandArgument='<%# Eval("Idnd") %>' 
                                            CssClass="delete-button" />
                                    </div>
                                </ItemTemplate>
                           </asp:DataList>
                           
                        
                       
                    </div>
                    
                </div>
            </div>
            <div class="fooder">
                <div class="bottom">
                    <ul class="fooder_note">
                        <li></li>
                        <li> <asp:Label ID="lblNote" CssClass="numer_note" runat="server" Text='<%# GetTotalNote() %>'  ></asp:Label> Note</li>
                        <li><a href="Add_Note.aspx"><i class='bx bx-edit'></i></a></li>
                    </ul>

                </div>    
            </div>
        </div>
    </form>
</body>

</html>
