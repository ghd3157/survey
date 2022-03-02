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

<!-- Begin Page Content -->
<div class="container-fluid">
    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800" style="padding-top:50px;">모듀에듀 설문 통계 차트</h1>
    </div>

    <!-- Content Row -->
    <div class="row">

        <!-- Earnings (Monthly) Card Example -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                이번달 설문 횟수
                            </div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">40,000</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Earnings (Monthly) Card Example -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                오늘 설문 횟수
                            </div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">500</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Earnings (Monthly) Card Example -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                전달 대비 설문 증가
                            </div>
                            <div class="row no-gutters align-items-center">
                                <div class="col-auto">
                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">
                                        50%
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="progress progress-sm mr-2">
                                        <div class="progress-bar bg-info" role="progressbar"
                                             style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                             aria-valuemax="100">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Pending Requests Card Example -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                Pending Requests</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Content Row -->

    <div class="row">

        <!-- Area Chart -->
        <div class="col-xl-8 col-lg-7">
            <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">월별 설문 횟수</h6>

                </div>
                <!-- Card Body -->
                <div class="card-body">
                    <div class="chart-area">
                        <canvas id="myAreaChart"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <!-- Pie Chart -->
        <div class="col-xl-4 col-lg-5">
            <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">인원별 배부수</h6>
               </div>
                <!-- Card Body -->
                <div class="card-body">
                    <div class="chart-pie pt-4 pb-2">
                        <canvas id="myPieChart"></canvas>
                    </div>
                    <div class="mt-4 text-center small">
                        <span class="mr-2">
                            <i class="fas fa-circle text-primary"></i> 홍길동
                        </span>
                        <span class="mr-2">
                            <i class="fas fa-circle text-success"></i> 임꺽정
                        </span>
                        <span class="mr-2">
                            <i class="fas fa-circle text-info"></i> 장길산
                        </span>
                        <span class="mr-2">
                            <i class="fas fa-circle text-danger"></i> 최민식
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Content Row -->
    <div class="row">

        <!-- Content Column -->
        <div class="col-lg-6 mb-4">
            <!-- Project Card Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">설문자 학력 통계</h6>
                </div>
                <div class="card-body">
                    <h4 class="small font-weight-bold">고등학교 졸업<span
                            class="float-right">30%</span></h4>
                    <div class="progress mb-4">
                        <div class="progress-bar bg-danger" role="progressbar" style="width: 30%"
                             aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <h4 class="small font-weight-bold">전문대학교 졸업 <span
                            class="float-right">20%</span></h4>
                    <div class="progress mb-4">
                        <div class="progress-bar bg-warning" role="progressbar" style="width: 20%"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <h4 class="small font-weight-bold">4년제 대학교 졸업 <span
                            class="float-right">30%</span></h4>
                    <div class="progress mb-4">
                        <div class="progress-bar" role="progressbar" style="width: 30%"
                             aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <h4 class="small font-weight-bold">대학교 중퇴 <span
                            class="float-right">15%</span></h4>
                    <div class="progress mb-4">
                        <div class="progress-bar bg-info" role="progressbar" style="width: 15%"
                             aria-valuenow="15" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <h4 class="small font-weight-bold">기타 <span
                            class="float-right">5%</span></h4>
                    <div class="progress">
                        <div class="progress-bar bg-success" role="progressbar" style="width: 5%"
                             aria-valuenow="5" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6 mb-4">
            <!-- Project Card Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">설문자 학습목표 통계</h6>
                </div>
                <div class="card-body">
                    <h4 class="small font-weight-bold">편입 및 대졸자 전형준비 <span
                            class="float-right">20%</span></h4>
                    <div class="progress mb-4">
                        <div class="progress-bar bg-danger" role="progressbar" style="width: 20%"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <h4 class="small font-weight-bold">자격증 취득 과정 <span
                            class="float-right">30%</span></h4>
                    <div class="progress mb-4">
                        <div class="progress-bar bg-warning" role="progressbar" style="width: 30%"
                             aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <h4 class="small font-weight-bold">기사/산업기사 응시자격 <span
                            class="float-right">15%</span></h4>
                    <div class="progress mb-4">
                        <div class="progress-bar" role="progressbar" style="width: 15%"
                             aria-valuenow="15" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <h4 class="small font-weight-bold">학위취득 과정 <span
                            class="float-right">30%</span></h4>
                    <div class="progress mb-4">
                        <div class="progress-bar bg-info" role="progressbar" style="width: 30%"
                             aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <h4 class="small font-weight-bold">대학원 진학준비 <span
                            class="float-right">5%</span></h4>
                    <div class="progress">
                        <div class="progress-bar bg-success" role="progressbar" style="width: 5%"
                             aria-valuenow="5" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</div>
<!-- /.container-fluid -->

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