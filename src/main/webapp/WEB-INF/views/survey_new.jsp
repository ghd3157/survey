<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="colorlib.com">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up Form</title>

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
                <div class="form-row form-input-flex">
                    <input class="form-input" type="checkbox" name="obj" id="inlineCheckbox1" value="1">
                    <label class="form-check-label form-check-text" for="inlineCheckbox1">자격증 취득 과정</label>
                    <input class="form-input" type="checkbox" name="obj" id="inlineCheckbox2" value="2">
                    <label class="form-check-label form-check-text" for="inlineCheckbox2">자격증 취득 과정</label>
                    <input class="form-input" type="checkbox" name="obj" id="inlineCheckbox3" value="3">
                    <label class="form-check-label form-check-text" for="inlineCheckbox3">기사/산업기사 응시자격</label>
                    <input class="form-input" type="checkbox" name="obj" id="inlineCheckbox4" value="4">
                    <label class="form-check-label form-check-text" for="inlineCheckbox4">학위취득 취득과정</label>
                    <input class="form-input" type="checkbox" name="obj" id="inlineCheckbox5" value="5">
                    <label class="form-check-label form-check-text" for="inlineCheckbox5">대학원 진학준비</label>
                </div>
            </fieldset>
            <h3>
                최종학력
            </h3>
            <fieldset>
                <div class="form-radio">
                    <label for="job" class="label-radio">What are you doing ?</label>
                    <div class="form-flex">
                        <div class="form-radio">
                            <input type="radio" name="job" value="designer" id="designer" />
                            <label for="designer">
                                <figure>
                                    <img src="images/icon-1.png" alt="">
                                </figure>
                                <span>Designer</span>
                            </label>
                        </div>

                        <div class="form-radio">
                            <input type="radio" name="job" value="coder" id="coder" checked="checked" />
                            <label for="coder">
                                <figure>
                                    <img src="images/icon-2.png" alt="">
                                </figure>
                                <span>Coder</span>
                            </label>
                        </div>

                        <div class="form-radio">
                            <input type="radio" name="job" value="developer" id="developer" />
                            <label for="developer">
                                <figure>
                                    <img src="images/icon-3.png" alt="">
                                </figure>
                                <span>Developer</span>
                            </label>
                        </div>
                    </div>
                </div>
            </fieldset>

            <h3>
                상담진행방식
            </h3>
            <fieldset>
                <div class="form-row form-input-flex">
                    <div class="form-input">
                        <input type="text" name="street_name" id="street_name" placeholder="Street Name" />
                    </div>
                    <div class="form-input">
                        <input type="text" name="street_number" id="street_number" placeholder="Street Number" />
                    </div>
                </div>
                <div class="form-row form-input-flex">
                    <div class="form-input">
                        <input type="text" name="city" id="city" placeholder="City" />
                    </div>
                    <div class="form-input">
                        <select name="country" id="country">
                            <option value="">Country</option>
                            <option value="Viet Nam">Viet Nam</option>
                            <option value="USA">USA</option>
                        </select>
                        <span class="select-icon"><i class="zmdi zmdi-caret-down"></i></span>
                    </div>
                </div>
            </fieldset>
            <h3>
                담당자에게 하고싶은 말
            </h3>
            <fieldset>
                <div class="form-row">
                    <div class="form-group-flex">
                        <div class="form-group">
                            <input type="text" name="first_name" id="first_name" placeholder="First Name" />
                        </div>
                        <div class="form-group">
                            <input type="text" name="last_name" id="last_name" placeholder="Last Name" />
                        </div>
                    </div>
                </div>
            </fieldset>
            <h3>
                성함 및 연락처
            </h3>
            <fieldset>
                <div class="form-row">
                    <div class="form-group-flex">
                        <div class="form-group">
                            <input type="text" name="first_name" id="first_name" placeholder="First Name" />
                        </div>
                        <div class="form-group">
                            <input type="text" name="last_name" id="last_name" placeholder="Last Name" />
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