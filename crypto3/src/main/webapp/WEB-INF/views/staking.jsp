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
   	<link rel="stylesheet" href="/crypto2/css/staking.css">
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
			            <a class="nav-link text-dark" href="./transfer">Transfer</a>
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