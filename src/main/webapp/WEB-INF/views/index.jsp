<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/bootstrap.css">

    <title>Spring Boot with JSP</title>

</head>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
    <div class="container mt-5">
        <div class="row d-flex justify-content-center align-items-center">
            <div class="col-md-8">
                <form id="regForm">
                    <h1 id="register">Survey Form</h1>
                    <div class="all-steps" id="all-steps"> <span class="step"><i class="fa fa-user"></i></span> <span class="step"><i class="fa fa-map-marker"></i></span> <span class="step"><i class="fa fa-shopping-bag"></i></span> <span class="step"><i class="fa fa-car"></i></span> <span class="step"><i class="fa fa-spotify"></i></span> <span class="step"><i class="fa fa-mobile-phone"></i></span> </div>
                    <div class="tab">
                        <h3>이름</h3>
                        <p> <input placeholder="이름" oninput="this.className = 'name'"  id="name"></p>
                    </div>
                    <div class="tab">
                        <h3>연락처</h3>
                        <p><input placeholder="-를 제외한 휴대폰 번호" oninput="this.className = 'phone'" id="phone"></p>
                    </div>
                    <div class="tab">
                        <h3>학습목표</h3>
                        <p><input placeholder="" oninput="this.className = 'objective'" id="objective"></p>
                    </div>
                    <div class="tab">
                        <h3>최종학력</h3>
                        <p><input placeholder="" oninput="this.className = 'education'" id="education"></p>
                    </div>
                    <div class="tab">
                        <h3>상담진행방식</h3>
                        <p><input placeholder="" oninput="this.className = 'advice'" id="advice"></p>
                    </div>
                    <div class="tab">
                        <h3>담당자에게 전하고 싶은 말</h3>
                        <p><input placeholder="" oninput="this.className = 'memo'" id="memo"></p>
                    </div>
                    <div class="thanks-message text-center" id="text-message"> <img src="https://i.imgur.com/O18mJ1K.png" width="100" class="mb-4">
                        <h3>Thankyou for your feedback!</h3> <span>Thanks for your valuable information. It helps us to improve our services!</span>
                    </div>
                    <div style="overflow:auto;" id="nextprevious">
                        <div style="float:right;"> <button type="button" id="prevBtn" onclick="nextPrev(-1)"><i class="fa fa-angle-double-left"></i></button> <button type="button" id="nextBtn" onclick="nextPrev(1)"><i class="fa fa-angle-double-right"></i></button> </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
