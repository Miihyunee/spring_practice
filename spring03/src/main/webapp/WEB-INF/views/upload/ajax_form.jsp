<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>Ajax Form</title>
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	$(function() {
		$(".uploadedList").on("click", "span", function(event) {
			const that = $(this); //클릭한 span 태그
			$.ajax({
				url : "/upload/delete_file",
				type : "post",
				data : {
					file_name : $(this).attr("data-src")
				},
				dataType : "text",
				success : function(result) {
					if (result == "deleted") {
						that.parent("div").remove();
					}
				}
			});
		});

		$(".fileDrop").on("dragenter dragover", function(event) {
			event.preventDefault(); // 기본 효과를 막음
		});
		$(".fileDrop")
				.on(
						"drop",
						function(event) {
							event.preventDefault();
							const files = event.originalEvent.dataTransfer.files;
							const file = files[0]; // 파일 한개씩
							const form_data = new FormData();
							form_data.append("file", file);
							$
									.ajax({
										type : "post",
										url : "/upload/ajax_upload",
										data : form_data,
										dataType : "text",
										processData : false,
										contentType : false,
										success : function(file_name) {
											let str = "<div>";
											str += "<a href='/upload/display_file?file_name="
													+ file_name
													+ "'>"
													+ getOriginalName(file_name)
													+ "</a>";
											str += "<span data-src=" + file_name + ">[삭제]</span></div>";
											$(".uploadedList").append(str);
										}
									});
						});
	});

	function getOriginalName(file_name) { //이미지 원본 이름
		// ex) 10b95ae5-e1c1-42c2-99fc-b40cd975622b_peach.png → "_" 뒤부터
		const idx = file_name.indexOf("_") + 1;
		return file_name.substr(idx);
	}
</script>
<style>
.fileDrop {
	width: 100%;
	height: 200px;
	border: 1px dotted blue;
}
</style>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>

	<h2>Ajax File Upload</h2>
	<!-- 드래그 영역 -->
	<div class="fileDrop"></div>
	<!-- 파일 목록 영역 -->
	<div class="uploadedList"></div>

</body>
</html>