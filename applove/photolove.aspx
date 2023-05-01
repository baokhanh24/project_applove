<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="photolove.aspx.cs" Inherits="applove.photolove" %>

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
    <link rel="stylesheet" href="css/photolove.css">
    <style>
        .add {
            background-image: url(./img/add.png );
            background-repeat: no-repeat;
            background-position: center;
            background-size: 19px 19px;
            width: 19px;
            height: 19px;
        }

        .delete {
            background-image: url(./img/delete-xxl.png);
            background-repeat: no-repeat;
            background-position: center;
            background-size: 19px 19px;
            background-color: transparent;
            width: 19px;
            height: 19px;
            border: none;
        }

        .album {
            width: 100%;
        }

        tbody {
            width: 100%;
        }

        tr {
            width: 100%;
        }

        #PhotoList {
            width: 100%;
        }

            #PhotoList td {
                width: 32.9%;
                position:relative;
            }
            .checkbox{
                position:absolute;
                top:5px;
                right:12px;
            }

        .photo {
            width: 100% !important;
                height: 139.74px;
        }

        .full {
            position: relative;
        }

            .full i {
                position: absolute;
                top: 5px;
                left: 13px;
                font-size: 30px;
                color: #ffffff;
                /* background-color: #fff; */
                padding: 5px;
                z-index: 1;
            }

        .fooder span {
            color: #fff;
        }
        #error-container {
            position: fixed;
            top: -50px; 
            left: 0;
            width: 100%;
            background-color: #f44336; 
            color: white; 
            text-align: center;
            padding: 10px;
            transition: top 0.5s; 
        }
        #image-overvideo {
            position: fixed;
            z-index: 9999;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            display: none;
        }
        #image-container {
   
            display: flex;
            justify-content: center;
            align-items: center;
        }
        #image-content{
   
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        #enlarged-image{
            height:auto!important;
        }
         #enlarged-video{
            max-width: 100%;
            max-height: 100%;
        }
        .photo video{
            border: 1px solid #000;
            width: 100%;
            height: 137.97px;
            object-fit: cover;

        }
        #back{
            position:absolute;
            top:5px;
            left:12px;
            padding:5px;
        }
         #back i{
             color:aliceblue;
             font-size:30px;
         }
    </style>
</head>


<body>
    <form runat="server" class="main">
        <div class="full">
            <a href="home.aspx"><i class='bx bx-chevron-left'></i></a>
            <div class="album">
                <asp:DataList ID="PhotoList" runat="server" RepeatColumns="3" RepeatDirection="Horizontal">
                    <ItemTemplate>
                        <div class="photo">
                            <%# CheckFileType(Eval("DuongDan").ToString()) %>
                            
                        </div>
                        <input type="checkbox" class="checkbox"  name="selectedItems" value='<%# Eval("ID") %>' />
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
        <div id="error-container">
            <span id="error-message"></span>
        </div>

        <div class="fooder">
            <button id="add" class="add" onclick="showAddPhotos()"></button>
            <label>
                <asp:Label ID="lblNote" CssClass="numer_note" runat="server" Text='<%# GetTotalphoto() %>'></asp:Label>
                Photo</label>
            <asp:Button ID="delete" runat="server" class="delete" OnClick="delete_Click"></asp:Button>
        </div>
        <div id="add-photos">
            <div id="add-photos-content">
                <div class="add-photos-header">
                    <span class="close" onclick="hideAddPhotos()">&times;</span>
                    <h2>ADD PHOTO</h2>
                </div>
                <div class="add-photos-body">
                    <p>Tải lên ảnh:</p>
                    <input type="file" id="fileUpload" runat="server" />
                </div>
                <div class="add-photos-footer">
                    <button id="cancel" class="button button-secondary" onclick="hideAddPhotos()">Hủy</button>
                    <asp:Button ID="add_photo" CssClass="button add_photo" runat="server" OnClick="addPhoto" Text="Thêm" />
                </div>
            </div>
        </div>
        <div id="image-overlay" onclick="hideImage()">
            <div id="image-container">
                <img id="enlarged-image" />
                
            </div>
        </div>
        <div id="image-overvideo" onclick="hidevideo()">
            <div id="image-content">
                <video id="enlarged-video"/>
            </div>
            <span id="back" onclick="hidebackvideo()"><i class='bx bx-chevron-left'></i></span>
        </div>
    </form>
    <script runat="server">
    protected string CheckFileType(string fileUrl)
    {
        string extension = System.IO.Path.GetExtension(fileUrl);
        if (extension.Equals(".jpg", StringComparison.InvariantCultureIgnoreCase) || 
            extension.Equals(".jpeg", StringComparison.InvariantCultureIgnoreCase) ||
            extension.Equals(".png", StringComparison.InvariantCultureIgnoreCase))
        {
            return "<img src='" + fileUrl + "' alt='' onclick='showImage(this)' />";
        }
        else if (extension.Equals(".mp4", StringComparison.InvariantCultureIgnoreCase) || 
                 extension.Equals(".avi", StringComparison.InvariantCultureIgnoreCase) ||
                 extension.Equals(".mov", StringComparison.InvariantCultureIgnoreCase))
        {
            return "<video src='" + fileUrl + "'  onclick='showvideo(this)' />";
        }
        else
        {
            return "";
        }
    }
    </script>
    <script>
        function showAddPhotos() {
            event.preventDefault();
            document.getElementById("add-photos").style.display = "block";
        }
        function hideAddPhotos() {
            document.getElementById("add-photos").style.display = "none";
        }
        function hidebackvideo() {
            // kiểm tra xem video có đang hiển thị hay không
            if (document.getElementById("enlarged-video").style.display === "block") {
                document.getElementById("enlarged-video").style.display = "none";
            }
            document.getElementById("image-overvideo").style.display = "none";
        }
        function showImage(img) {
            var enlargedImage = document.getElementById("enlarged-image");
            enlargedImage.src = img.src;
            var overlay = document.getElementById("image-overlay");
            overlay.style.display = "block";
        }
        function showvideo(video) {
            var enlargedImage = document.getElementById("enlarged-video");
            enlargedImage.src = video.src;
            enlargedImage.setAttribute("controls", "controls");
            var overlay = document.getElementById("image-overvideo");
            overlay.style.display = "block";
        }
        function hideImage() {
            var overlay = document.getElementById("image-overlay");
            overlay.style.display = "none";
        }
        function hidevideo() {
            var overlay = document.getElementById("image-overvideo");
            overlay.style.display = "none";
        }
        var errorContainer = document.getElementById("error-container");
        var errorMessage = document.getElementById("error-message");

        function showErrorMessage(message) {
            errorMessage.innerHTML = message;
            errorContainer.style.top = "0"; 
            setTimeout(function () {
                errorContainer.style.top = "-50px"; 
            }, 3000);
        }

    </script>
</body>

</html>
