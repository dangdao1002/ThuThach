<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>KQXS HCM</title>
	
	<!-- Link lấy API từ trang kết quả xổ số minhngoc.net.vn -->
	<script language="javascript"
		src="//www.minhngoc.com.vn/jquery/jquery-1.7.2.js"></script>
	<link rel="stylesheet" type="text/css"
		href="//www.minhngoc.com.vn/style/bangketqua_mini.css" />	
	
	<!-- Bootstrap CSS v5.2.1 -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
		crossorigin="anonymous">
		
	<!-- Angular Js  -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.8.3/angular.min.js"
		integrity="sha512-KZmyTq3PLx9EZl0RHShHQuXtrvdJ+m35tuOiwlcZfs/rE7NZv29ygNA8SFCkMXTnYZQK2OX0Gm2qKGfvWEtRXA=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/angular-messages/1.8.3/angular-messages.min.js"
		integrity="sha512-a+xgEyXVK7r+KKIDYyHtFfLi9LItmFDff6Z4/5lrGmL03u1vtFCjQXQz3dSIwOapB3YIRMBO1+IQj6ptnxAh/A=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<link type="text/css" rel="stylesheet" href="/css/style.css"/>
</head>

<body ng-app="myapp" ng-controller="mycontroller">
	<header>
		<h3 class="text-center">KET QUA XO SO HCM</h3>
	</header>
	<main class="container" style="height: 54vh;">
		<div class="row mt-4">
			<div id="box_kqxs_minhngoc" class="col-lg-9 col-12 ms-4 bg-light">
				<script language="javascript">
					bgcolor = "#A40E0D";
					titlecolor = "#FFFCF9";
					dbcolor = "#000000";
					fsize = "24px";
					kqwidth = "70%";
				</script>
				<script type='text/javascript'
					src="//www.minhngoc.com.vn/getkqxs${tinh != null ? tinh : '/tp-hcm'}${ngay}.js"></script>
			</div>
			<div id="do-kqxs" class="col-2">
				<h2 class="text-nowrap mb-3">Kiểm Tra Số</h2>
				<form action="/KQXS" class="Do-KQXS" name="DoKQXS" method="post"
					novalidate>
					<div class="d-lg-flex justify-content-around">
						<select name="chontinh" id="tinh-id" class="form-select col-5"
							aria-label="Default select example" onchange="chonTinhOnChange()">
						</select>
						<div class="col-2 hidden-lg"></div>
						<select name="chonngay" id="ngay-id" class="form-select col-5"
							aria-label="Default select example">
						</select>
					</div>
					<div class="d-flex" style="margin-left: -58%;">
						<div class="mb-3 mt-3 me-4 col-12">
							<label for="mave" class="form-label">Kiểm tra vé số của bạn:</label> <input
								type="text" class="form-control" id="mave" name="mave"
								aria-describedby="maveHelp" placeholder="Hãy nhập số trên vé của bạn"
								ng-model="MaVeModel" minlength="5" maxlength="6" required
								pattern="^[0-9]+$">
						</div>
						<div class="mb-3 mt-5 col-8">
							<button type="submit" class="btn btn-primary" ng-disabled="DoKQXS.$invalid"
								formaction="/Result"
								style="background-color: #A40E0D; border: none;">Tìm kiếm</button>
						</div>
					</div>

					<div ng-if="DoKQXS.$submitted || DoKQXS.mave.$dirty" class="mb-4"
						ng-messages="DoKQXS.mave.$error"
						style="color: #D10024; margin-left: -58%;" role="alert">
						<div ng-message="required">
							<strong>Để trống là không được nha!</strong>
						</div>
						<div ng-message="pattern">
							<strong>Nhập số thôii!</strong>
						</div>
						<div ng-message="minlength">
							<strong>Hãy nhập đúng!</strong>
						</div>
						<div ng-message-default>
							<strong>Có gì đó sai sai!</strong>
						</div>
					</div>
					<button type="submit" class="btn btn-primary rainbow-5" ${disableButton}
						formaction="/ShowResult"
						style="background-color: #A40E0D; border: none;" >Nhấp để đổi đời</button>

					<div class="d-flex" style="margin-left: -30%;">
						<h1 class="mt-2 text-center">${messages}</h1>
					</div>
				</form>
			</div>
		</div>

	</main>

	<footer class="text-center text-lg-start text-muted mt-4">
		<div class="row">
            <div class="col-md-12 text-center">
                    Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Đăng Đào</a></p>
            </div>
        </div>
	</footer>


	<!-- javascript -->
	<!-- 	lấy ra danh sách giải thưởng -->
	<script src="/js/app.js"></script>
	<!-- End javascript -->
</body>

</html>