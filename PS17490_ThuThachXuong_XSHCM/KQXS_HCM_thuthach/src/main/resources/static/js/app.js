		// Đổ dữ liệu thẻ chọn tỉnh
		for (var option of document.getElementById("box_kqxs_tinh").options) {
			document.getElementById("tinh-id").add(option);
		}

		// Đổ dữ liệu thẻ chọn ngày
		for (var option of document.getElementById("box_kqxs_ngay").options) {
			document.getElementById("ngay-id").add(option);
		}

		// Cập nhật lại bảng kết quả
		document.getElementById("box_kqxs_tinh").onchange();

		// Thêm sự kiện cho thẻ chọn tỉnh
		var chonTinhOnChange = function () {
			// cập nhật lại bảng kết quả xổ số khi dò kết quả
			let scriptElementment = document.createElement("script");
			let tinh = document.getElementById("tinh-id").value;
			let ngay = document.getElementById("ngay-id").value;
			let src = "//www.minhngoc.com.vn/getkqxs/" + tinh + "/" + ngay + ".js";
			scriptElementment.setAttribute("src", src);
			document.getElementById("box_kqxs_minhngoc").appendChild(scriptElement);

			scriptElement.onload = function () {
				// Đổ dữ liệu thẻ chọn ngày
				document.getElementById("ngay-id").innerText = null;
				for (var option of document.getElementById("box_kqxs_ngay").options) {
					document.getElementById("ngay-id").add(option);
				}
			}
			document.getElementById("box_kqxs_tinh").onchange();
			document.getElementById("box_kqxs_ngay").onchange();
		}
	
		// Cập nhật bảng kết quả sau khi dò kết quả
		let scriptElement = document.createElement("script");
		let tinh = document.getElementById("tinh-id").value;
		let ngay = document.getElementById("ngay-id").value;
		let src = "//www.minhngoc.com.vn/getkqxs/" + tinh + "/" + ngay + ".js";
		scriptElement.setAttribute("src", src);
		document.getElementById("box_kqxs_minhngoc").appendChild(scriptElement);

		scriptElement.onload = function () {
			// JSON list giải thưởng
			var listGiai = {
				tinh: document.getElementById("box_kqxs_tinh").value,
				ngay: document.getElementById("box_kqxs_ngay").value,
				giaidb: document.getElementsByClassName("giaidb")[0].innerText,
				giai1: document.getElementsByClassName("giai1")[0].innerText,
				giai2: document.getElementsByClassName("giai2")[0].innerText,
				giai3: document.getElementsByClassName("giai3")[0].innerText,
				giai4: document.getElementsByClassName("giai4")[0].innerText,
				giai5: document.getElementsByClassName("giai5")[0].innerText,
				giai6: document.getElementsByClassName("giai6")[0].innerText,
				giai7: document.getElementsByClassName("giai7")[0].innerText,
				giai8: document.getElementsByClassName("giai8")[0].innerText
			}
			console.log(listGiai)
			$.ajax({
				type: "POST",
				url: window.location.href,
				data: listGiai,
				success: function (result) {
					console.log("Post JSON Success")
				},
				error: function (result) {
					console.log("Post JSON error")
				}
			})
		}
	

		// Angular Js
		var app = angular.module("myapp", ['ngMessages']);
		app.controller("mycontroller", function ($scope, $window, $rootScope) {

		});