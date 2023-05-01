<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="applove.home" %>

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
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@500;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/home.css">
    <style>
        .menu {
            display: flex;
            flex-direction: column;
            justify-content: center;
            display: none;
        }

        .number_phone.show {
            display: block;
        }
        .Notification{
            text-transform:capitalize!important;
            font-size:18px !important;
        }
    </style>
</head>
<body>
    <div class="main">
        <div class="contaier">
            <div class="header">
                <div class="logo">
                    <img src="./img/hearts.png" alt="" class="logo_love">
                </div>
                <div class="datetime">
                    <span class="date_love"></span>
                </div>
            </div>
            <div class="center">
                <div class="avatar">
                    <img class="jointphoto" src="./img/man.png" alt="">
                    <img src="./img/beauty.png" alt="" class="jointphoto">
                </div>
                <div class="fullname">
                    <div class="name">
                        <div class="name_men">
                            <img src="/img/khanhpr.png" alt="" class="share">
                            <span class="name_share">Bảo Khánh</span>
                        </div>
                        <div class="name_woman">
                            <img src="/img/thipro.png" alt="" class="share">
                            <span class="name_share">Bảo Thi</span>
                        </div>
                    </div>
                    <div class="cung">
                        <div class="duc">
                            <img src="./img/mars.png" alt="" class="share_sex">
                            <span class="name_cung">Thiên Bình</span>
                        </div>
                        <div class="cai">
                            <img src="./img/femenine.png" alt="" class="share_sex">
                            <span class="name_cung">Song Ngư</span>
                        </div>
                    </div>
                </div>
                <div class="mess_note">
                    <div class="messenger">
                        <span class="note">NOTIFY:</span>
                        <span class="Notification">chúc mừng app</span>
                    </div>
                </div>

            </div>
            <div class="fooder">
                <div class="bottom">
                    <ul class="navbar">
                        <li class="navbar_li" id="navbar_li" onclick="toggleMenu(event)"><a href="" class="heart"><i class='bx bx-heart'></i></a>
                            <ul class="menu" id="menu">
                                <li><a href="Note.aspx"><i class='bx bx-notepad'></i>Note</a></li>
                                <li><a href="photolove.aspx"><i class='bx bx-photo-album'></i>Photo Love</a></li>

                            </ul>
                        </li>
                        <li class="navbar_home"><a href="Home.aspx" class="home"><i class='bx bx-home'></i></a></li>
                        <li class="phone_li" onclick="showMenu(event)"><a href="#" class="phone"><i class='bx bx-phone'></i></a>
                            <ul class="number_phone" id="number_phone">
                                <li><a href="tel:0906457971"><i class='bx bx-phone'>Anhiu</i> 0906457971</a></li>
                                <li><a href="tel:0905014507"><i class='bx bx-phone'>Emiu</i> 0905014507</a></li>

                            </ul>
                        </li>
                    </ul>

                </div>
            </div>
        </div>
    </div>
</body>
<script>
    // Lấy tham chiếu đến các phần tử HTML cần sử dụng
    // Lấy tham chiếu đến các phần tử HTML cần sử dụng
    function toggleMenu(event) {
        if (event.target.tagName !== "A") {
            event.preventDefault();
            event.stopPropagation(); // Ngăn chặn việc load lại trang sau khi click
            var menu = document.getElementById("menu");
            if (menu.style.display === "block") {
                menu.style.display = "none";
            } else {
                menu.style.display = "block";
            }
        }
        document.addEventListener("click", function (event) {
            var menu = document.getElementById("menu");
            var isClickInsideMenu = menu.contains(event.target);

            if (!isClickInsideMenu) {
                menu.style.display = "none";
            }
        });
    }

</script>
<script>
    // Lấy tham chiếu đến các phần tử HTML cần sử dụng
    // Lấy tham chiếu đến các phần tử HTML cần sử dụng
    function showMenu(event) {
        if (event.target.tagName !== "A") {
            event.preventDefault();
            event.stopPropagation(); // Ngăn chặn việc load lại trang sau khi click
            var menu = document.getElementById("number_phone");
            if (menu.style.display === "block") {
                menu.style.display = "none";
            } else {
                menu.style.display = "block";
            }
        }
        document.addEventListener("click", function (event) {
            var menu = document.getElementById("number_phone");
            var isClickInsideMenu = menu.contains(event.target);

            if (!isClickInsideMenu) {
                menu.style.display = "none";
            }
        });
    }

</script>
<script>
    // Lấy ngày hiện tại
    var today = new Date();

    // Ngày 24/06/2022
    var loveDay = new Date("2022-06-24");

    // Tính số ngày còn lại
    var diffTime = today.getTime() - loveDay.getTime();
    var diffDays = Math.ceil(diffTime / (1000 * 3600 * 24));

    // Gán giá trị vào phần tử span
    var dateLoveSpan = document.querySelector(".date_love");
    dateLoveSpan.innerText = diffDays + " Days";
</script>
<script>
    var daysOfWeek = ["Chủ nhật", "Thứ 2", "Thứ 3", "Thứ 4", "Thứ 5", "Thứ 6", "Thứ 7"];
    var today = new Date();
    var dayOfWeek = daysOfWeek[today.getDay()];

    // Sử dụng biến dayOfWeek để hiển thị thứ trong câu thông báo
    document.querySelector('.Notification').innerHTML = "Hôm nay là " + dayOfWeek + ", " + today.toLocaleDateString();
    // Lấy ngày hiện tại
    var today = new Date();

    // Ngày sinh nhật anh Khánh
    var birthdaymen = new Date("2023-09-24");
    var birthdaygirl = new Date("2023-02-21");
    var travel = new Date("2023-04-07");
    // Ngày kỉ niệm 1 năm yêu nhau
    var anniversary = new Date("2023-06-24");
    
    // So sánh ngày hiện tại với ngày sinh nhật anh Khánh
    if (today.getDate() === birthdaymen.getDate() && today.getMonth() === birthdaymen.getMonth()) {
        // Thay đổi nội dung của thẻ span thành "Chúc mừng sinh nhật anh Khánh"
        document.querySelector('.Notification').innerHTML = "Chúc mừng sinh nhật anh Khánh";
    }
    if (today.getDate() === travel.getDate() && today.getMonth() === travel.getMonth()) {
        document.querySelector('.Notification').innerHTML = "Hôm nay đi du lịch ở Huế";
    }
    if (today.getDate() === birthdaygirl.getDate() && today.getMonth() === birthdaygirl.getMonth()) {
        // Thay đổi nội dung của thẻ span thành "Chúc mừng sinh nhật anh Khánh"
        document.querySelector('.Notification').innerHTML = "Chúc mừng sinh nhật chị Thi";
    }
    // So sánh ngày hiện tại với ngày kỉ niệm 1 năm yêu nhau
    if (today.getDate() === anniversary.getDate() && today.getMonth() === anniversary.getMonth()) {
        // Thay đổi nội dung của thẻ span thành "Chúc mừng kỉ niệm 1 năm yêu nhau"
        document.querySelector('.Notification').innerHTML = "Chúc mừng kỉ niệm 1 năm yêu nhau";
    }

    
</script>


</html>

