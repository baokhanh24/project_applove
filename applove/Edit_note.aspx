<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit_note.aspx.cs" Inherits="applove.Edit_note" %>

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
        .Done {
            margin-right: 25px;
            padding: 10px;
            background-color: transparent;
            border: none;
            outline: none;
            color: #E0EB5E;
            font-size: 20px;
        }
        .Input_title,.Input_little {
            width: 100%;
            min-height: 100%;
            height: 32px;
            font-weight: 700;
            font-size: 20px;
            line-height: 24px;
            color: #FFFFFF;
            background-color: transparent;
            border: none;
            outline: none;
            word-wrap: break-word;
            overflow: hidden;
            resize: none;
           
        }
        .Input_little{
            font-weight: 300;
            height: 531px;
        }
        .boder_top{
            width: 100%;
            border-top: 1px dashed#fff;
            padding: 5px 0;
        }
        .Input_title::placeholder,.Input_little::placeholder{
            color: #c8bdbd;
            font-weight: 300;
        }
        

    </style>
</head>
<body>
    <form runat="server" class="full__main">
        <div class="container">
            <div class="left_home">
                <a href="Note.aspx"><i class='bx bx-chevron-left'></i> Note</a>
                <asp:Button ID="Done" runat="server" Text="Done" CssClass="Done" OnClick="Done_Click" />
            </div>
            <div class="content">
                <span class="title">Note</span>
                <div class="input">
                    <div class="Information_data">
                       <asp:TextBox ID="Input_title" TextMode="MultiLine" Rows="10  " runat="server" CssClass="Input_title" placeholder="Tiêu Đề"></asp:TextBox>

                        <div class="boder_top"></div>
                        <asp:TextBox ID="Input_content" runat="server" TextMode="MultiLine" Rows="50"   CssClass="Input_little" placeholder="Nội dung"></asp:TextBox>
                    </div>

                </div>
            </div>
            
        </div>
    </form>
</body>

</html>
