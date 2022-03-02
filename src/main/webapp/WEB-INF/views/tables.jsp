<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>chart</title>

    <!-- Custom fonts for this template -->
    <link href="/chart/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/chart/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="/chart/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">

<!-- chartJS파일-->
<script type="text/javascript" src="/js/chart.js"></script>

<!-- Page Wrapper -->
<div id="wrapper">
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
        <!-- Main Content -->
        <div id="content">
            <!-- Begin Page Content -->
            <div class="container-fluid">
                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800"></h1>
                <p class="mb-4"><a target="_blank" href=""></a></p>
                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">설문 결과</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" style="width:100%;font-size:small" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>순번</th>
                                    <th>일시</th>
                                    <th>학습목표</th>
                                    <th>최종학력</th>
                                    <th>상담방식</th>
                                    <th>이름</th>
                                    <th>연락처</th>
                                    <th>결제여부</th>
                                    <th>비고</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="user" items="${dataList}" varStatus="i">
                                <tr>
                                    <td style="text-align: center">${user.userNum}</td>
                                    <td>${user.regiDate}</td>
                                    <td>${user.objective}</td>
                                    <td>${user.education}</td>
                                    <td>${user.advice}</td>
                                    <td>${user.name}</td>
                                    <td>${user.phone}</td>
                                    <c:choose>
                                        <c:when test="${user.pay eq 0}">
                                            <td>
                                                <div id="pay${i.count}" style="float:left;padding-top:7px;width:3px;">X</div>
                                                <button  type="button" class="btn btn-light" style="font-size:small; margin-left:15px;" onclick="changePay('${user.userNum}','${i.count}','${user.pay}')">변경</button>
                                            </td>
                                        </c:when>
                                        <c:when test="${user.pay eq 1}">
                                            <td>
                                                <div id="pay${i.count}" style="float:left;padding-top:7px;width:3px;">O</div>
                                                <button type="button" class="btn btn-light" style="font-size:small; margin-left:15px;" onclick="changePay('${user.userNum}','${i.count}','${user.pay}')">변경</button>
                                            </td>
                                        </c:when>
                                    </c:choose>
                                    <td>
                                        <input id="memo${i.count}" type="text" value="${user.memo}" style="width: 100px;">
                                        <button type="button" class="btn btn-light" style="font-size: small; margin-left:10px;" onclick="insertMemo('${i.count}','${user.userNum}')">저장</button>
                                    </td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- End of Main Content -->
    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Bootstrap core JavaScript-->
<script src="/chart/vendor/jquery/jquery.min.js"></script>
<script src="/chart/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/chart/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/chart/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="/chart/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="/chart/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="/chart/js/demo/datatables-demo.js"></script>

<!-- Page level plugins -->
<script src="/chart/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts Chart-->
<script src="/chart/js/demo/chart-area-demo.js"></script>
<script src="/chart/js/demo/chart-pie-demo.js"></script>

</body>

</html>