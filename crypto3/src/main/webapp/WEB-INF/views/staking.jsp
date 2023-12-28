<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!--Bootstrap setting part-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staking</title>
    <style>
        /*
        Css RWD排版規則，由大排到小，同屬性的話會單獨排，如果只有單一屬性會在最下面   
        */


        /*內容設定*/
        .stakingContent {
            min-height: 100vh;
            display: flex;
            justify-content: start;
            flex-direction: column;
            align-items: center;

        }

        /*內容標題字體設定*/
        .stakingTitle {
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }

        /*設定Staking內容排版以及最大寬度為螢幕視窗寬度*/
        .stakingInfo {
            margin-top: 1rem;
            display: flex;
            justify-content: space-evenly;
            width: 100vw;
        }

        /*每個框框都是一個section，設定三個框框的相同屬性*/
        .section {
            border: solid 2px #dadce0;
            width: 300px;
            height: 150px;
        }

        /*設置激勵內容的框框*/
        .incentive {
            margin-top: 2rem;
            border: solid 2px #dadce0;
            width: 400px;
            height: 300px
        }

        /*設定綁定內容的框框*/
        .bondedNumber {
            display: flex;
            justify-content: center;
            padding-top: 1rem
        }

        /*設定綁定內容框框裡面的乙太幣圖片*/
        .bondedToken .bondedNumber img {
            width: 3rem;
            height: 3rem;
        }

        /*設定nav bar右半邊*/
        .rightPartNav {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /*設定登出按鈕顯示*/
        .rightPartNav {
            position: relative;
        }

        .logoutButton {
            top: 2.5rem;
            position: absolute;
            width: 3vw;
            height: 5vh;
            background: #f6f6f6;
            border-radius: 5px;
        }

        .logoutButton a {
            text-decoration: none;
            color: black
        }

        /*設定使用者圖片*/
        .rightPartNav i {
            cursor: pointer;
        }

        /*設定標題左右邊各3個字的距離*/
        .navRWD {
            margin-left: 3rem;
            margin-right: 3rem'

        }

        /*登出按鈕RWD設定*/
        @media(max-width:1170px) {
            .logoutButton {
                height: 10vh;

            }
        }

        /*在寬度960以下設定排版變成直列排版*/
        @media(max-width:960px) {
            .stakingInfo {
                flex-direction: column;
                width: 100vw;
                align-items: center;
            }

            .stakingInfo div {
                margin: 2rem 0rem;
            }

        }

        @media(max-width:800px) {
            .logoutButton {
                height: 10vh;
                width: 5vw;
            }
        }

        /*在寬度為380以下把激勵區域的寬度設定為視窗寬度*/
        @media(max-width:380px) {
            .incentive {
                width: 100vw;
            }
        }

        @media(max-width:330px) {
            .logoutButton {
                width: 8vw;
            }
        }

        /*在寬度為320以下時把導覽列的按鈕右邊為3個字的寬度*/
        @media(max-width:320px) {
            .buttonRWD {
                margin-right: 3rem;
            }
        }

        /*在寬度為300以下設置導覽列左右無間距*/
        @media(max-width:300px) {
            .navRWD {
                margin-left: 0rem;
            }
        }

        /*在螢幕250以下時讓user字體變小*/
        @media(max-width:250px) {

            .rightPartNav {
                font-size: 15px;
            }


        }

        /*在螢幕250以下時讓user字體變小*/
        @media(max-width:250px) {

            .rightPartNav {
                font-size: 15px;
            }


        }
    </style>
</head>

<body>
    <!--navbar-->

    <nav class="navbar navbar-expand-lg navbar-light  ">
        <!--Left side navbar-->
        <div class="container-fluid  fs-5 navRWD ">
            <a class="navbar-brand text-dark fs-2 fw-bolder" href="#">ZheZhe</a>
            <button class="navbar-toggler buttonRWD" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active text-dark" aria-current="page" href="#">Markets</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="#">Chart</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="#">Staking</a>
                    </li>
                    <li class="nav-item">
			            <a class="nav-link text-dark" href="./transaction">Transaction</a>
			        </li>


                </ul>
            </div>

            <!--rigth side navbar-->
            <div class="rightPartNav">
                <a class="nav-link text-dark" href="#">Assets</a>
                <i class="bi bi-person-circle text-dark h5 mb-0  d-md-block userIcon"></i>
                <a class="nav-link text-dark" href="#">username</a>
                <div class="logoutButton d-none ">
                    <a href="" onclick="">登出</a>
                </div>
            </div>
        </div>
    </nav>
    <!--Staking content-->
    <div class="stakingContent">
        <h1 class="stakingTitle">Staking</h1>
        <div class="stakingInfo">
            <div class="validator section">
                <h2 class="text-center">Validators</h2>
            </div>
            <div class="bondedToken section">
                <h2 class="text-center">BondedToken</h2>
                <div class="bondedNumber">
                    <h1 class="text-center  fw-bolder">1999999</h1>
                    <img src="./img/eth.png" alt="">
                </div>

            </div>
            <div class="guide section">
                <h2 class="text-center">Guide</h2>
            </div>

        </div>
        <div class="incentive">
            <h1 class="text-center">Incentive</h1>
        </div>
    </div>
</body>
<script>
    /*設定登出按鈕*/
    let test = document.querySelector(".userIcon");
    let test1 = document.querySelector(".logoutButton");
    test.addEventListener("click", (e) => {
        test1.classList.toggle("d-none");
    })
</script>

</html>