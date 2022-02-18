<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="colorlib.com">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up Form</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <!-- Font Icon -->
    <link rel="stylesheet" href="/template/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="/template/css/style.css">
</head>
<body>

<div class="main">

    <div class="container">
        <h2>설문지</h2>
        <form method="POST" id="signup-form" class="signup-form" enctype="multipart/form-data">
            <h3>
                학습목표
            </h3>
            <fieldset>
                <div class="tab">
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" name="obj" id="inlineCheckbox1" value="1">
                        <label class="form-check-label" for="inlineCheckbox1">편입 및 대졸자 전형준비</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" name="obj" id="inlineCheckbox2" value="2">
                        <label class="form-check-label" for="inlineCheckbox2">자격증 취득 과정</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" name="obj" id="inlineCheckbox3" value="3">
                        <label class="form-check-label" for="inlineCheckbox3">기사/산업기사 응시자격</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" name="obj" id="inlineCheckbox4" value="4">
                        <label class="form-check-label" for="inlineCheckbox4">학위취득 취득과정</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" name="obj" id="inlineCheckbox5" value="4">
                        <label class="form-check-label" for="inlineCheckbox4">학위취득 취득과정</label>
                    </div>
                </div>
            </fieldset>
            <h3>
                최종학력
            </h3>
            <fieldset>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" name="edu" id="inlineCheckbox6" value="1">
                    <label class="form-check-label" for="inlineCheckbox6">고등학교 졸업</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" name="edu" id="inlineCheckbox7" value="2">
                    <label class="form-check-label" for="inlineCheckbox7">전문대학교 졸업</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" name="edu" id="inlineCheckbox8" value="3">
                    <label class="form-check-label" for="inlineCheckbox8">4년제 대학교 졸업</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" name="edu" id="inlineCheckbox9" value="4">
                    <label class="form-check-label" for="inlineCheckbox9">대학교 중퇴</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" name="edu" id="inlineCheckbox10" value="5">
                    <label class="form-check-label" for="inlineCheckbox10">기타</label>
                </div>
            </fieldset>

            <h3>
                상담진행방식
            </h3>
            <fieldset>
                <div class="tab">
                    <h3>상담진행방식</h3>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" name="adv" id="inlineCheckbox11" value="1">
                        <label class="form-check-label" for="inlineCheckbox11">전화상담</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" name="adv" id="inlineCheckbox12" value="2">
                        <label class="form-check-label" for="inlineCheckbox12">카카오톡 상담</label>
                    </div>
                </div>
            </fieldset>
            <h3>
                담당자에게 하고싶은 말
            </h3>
            <fieldset>
                <div class="tab">
                    <h3>담당자에게 전하고 싶은 말</h3>
                    <p><input class="input" placeholder="" id="memo"></p>
                </div>
            </fieldset>
            <h3>
                성함 및 연락처
            </h3>
            <fieldset>
                <div class="form-row">
                    <div class="form-group-flex">
                        <div class="form-group">
                            <input type="text" name="first_name" id="name" placeholder="이름" />
                        </div>
                        <div class="form-group">
                            <input type="text" name="last_name" id="phone" placeholder="연락처" />
                        </div>
                    </div>
                </div>
            </fieldset>
        </form>
    </div>

</div>

<!-- JS -->
<script src="/template/vendor/jquery/jquery.min.js"></script>
<script src="/template/vendor/jquery-validation/dist/jquery.validate.min.js"></script>
<script src="/template/vendor/jquery-validation/dist/additional-methods.min.js"></script>
<script src="/template/vendor/jquery-steps/jquery.steps.min.js"></script>
<script src="/template/js/main.js"></script>
</body>
</html>