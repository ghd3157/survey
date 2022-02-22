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
    <link rel="stylesheet" href="/css/survey.css">

    <!-- Bootstrap CSS -->

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">


    <title>Spring Boot with JSP</title>

</head>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="/js/survey.js"></script>
    <div class="flex-container">
            <div class="content">
                <form id="regForm">
                    <h6 id="register"></h6>
                    <div class="tab">
                        <h3>학습목표</h3>
                        <div id="objval" style="padding-bottom: 7px; color: #f63726; display: none;">
                            <h7>학습목표를 선택해 주세요(복수선택 가능)</h7>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" name="obj" id="inlineCheckbox1" value="1">
                            <label class="form-check-label" for="inlineCheckbox1">편입 및 대졸자 전형준비</label>
                        </div>
                        <br/>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" name="obj" id="inlineCheckbox2" value="2">
                            <label class="form-check-label" for="inlineCheckbox2">자격증 취득 과정</label>
                        </div>
                        <br/>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" name="obj" id="inlineCheckbox3" value="3">
                            <label class="form-check-label" for="inlineCheckbox3">기사/산업기사 응시자격</label>
                        </div>
                        <br/>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" name="obj" id="inlineCheckbox4" value="4">
                            <label class="form-check-label" for="inlineCheckbox4">학위취득 취득과정</label>
                        </div>
                        <br/>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" name="obj" id="inlineCheckbox5" value="5">
                            <label class="form-check-label" for="inlineCheckbox5">대학원 진학준비</label>
                        </div>
                    </div>
                    <div class="tab">
                        <h3>최종학력</h3>
                        <div id="eduval" style="padding-bottom: 7px; color: #f63726; display: none;">
                            <h7>최종학력을 선택해 주세요(택1)</h7>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" name="edu" id="inlineCheckbox6" value="1">
                            <label class="form-check-label" for="inlineCheckbox6">고등학교 졸업</label>
                        </div><br/>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" name="edu" id="inlineCheckbox7" value="2">
                            <label class="form-check-label" for="inlineCheckbox7">전문대학교 졸업</label>
                        </div><br/>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" name="edu" id="inlineCheckbox8" value="3">
                            <label class="form-check-label" for="inlineCheckbox8">4년제 대학교 졸업</label>
                        </div><br/>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" name="edu" id="inlineCheckbox9" value="4">
                            <label class="form-check-label" for="inlineCheckbox9">대학교 중퇴</label>
                        </div><br/>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" name="edu" id="inlineCheckbox10" value="5">
                            <label class="form-check-label" for="inlineCheckbox10">기타</label>
                        </div>
                    </div>
                    <div class="tab">
                        <h3>상담진행방식</h3>
                        <div id="adval" style="padding-bottom: 7px; color: #f63726; display: none;">
                            <h7>상담 방식을 선택해 주세요</h7>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" name="adv" id="inlineCheckbox11" value="1">
                            <label class="form-check-label" for="inlineCheckbox11">전화상담</label>
                        </div><br/>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" name="adv" id="inlineCheckbox12" value="2">
                            <label class="form-check-label" for="inlineCheckbox12">카카오톡 상담</label>
                        </div>
                    </div>
                    <div class="tab">
                        <h3>성함 및 연락처</h3>
                        <div id="nameval" style="padding-bottom: 7px; color: #f63726; display: none;">
                            <h7>이름을 입력해주세요</h7>
                        </div>
                        <p><input class="input" placeholder="이름" id="name" type="text"></p>
                        <div id="phoneval" style="padding-bottom: 7px; color: #f63726; display: none;">
                            <h7>연락처를 입력해주세요</h7>
                        </div>
                        <p><input class="input" placeholder="-를 제외한 휴대폰 번호" id="phone" type="text"></p>
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
</body>
</html>
