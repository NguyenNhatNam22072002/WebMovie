<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js">
    </script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/675bbfe78c.js" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <style type="text/css">
       <%@include file="../css/delete.css" %>
    </style>

</head>
<body>
	<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
	<c:url var="urlUser" value="/manager/editUser" />

	<!-- Tag nav -->
	<%@include file="nav.jsp"%>
	<!-- Thẻ Nav -->
	<form action="${urlUser}/index" method="post">
		<div class="container">
			<h2>Danh sách người dùng</h2>

			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Tên ĐN</th>
						<th>Họ</th>
						<th>Tên</th>
						<th>Email</th>
						<th>Vai trò</th>
						<th>Hoạt động</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="item" items="${list}">
						<tr>
							<td>${item.getTenDN()}</td>
							<td>${item.getHo()}</td>
							<td>${item.getTen()}</td>
							<td>${item.getEmail()}</td>
							<td>${item.isVaiTro()?'Nhân viên':'Người dùng'}</td>
							<td><a class="btn btn-primary btn-sm" href="#myModal2"
								data-toggle="modal" onclick="result2('${item.getTenDN()}')"
									formaction="">Cập nhật vai trò</a> | <a
								class="btn btn-danger btn-sm" href="#myModal"
								data-toggle="modal" onclick="result1('${item.getTenDN()}')">Xóa</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div class="container pt-5 text-center pb-5">
				<ul class="pagination justify-content-center">
					<li class="page-item ${disBack?'disabled':''}"><button
							class="page-link" formaction="">
							<i class="fas fa-angle-double-left"></i>
						</button></li>
					<li class="page-item disabled"><a class="page-link">${page}</a></li>
					<li class="page-item ${disNext?'disabled':''}"><button
							class="page-link" formaction="">
							<i class="fas fa-angle-double-right"></i>
						</button></li>
				</ul>
				<label style="font-size: 15px;">Trang: <input type="number"
					max="${maxPage}" min="1" style="width: 30px;" value="${page}">/${maxPage}
				</label>
			</div>

			<!-- Modal xóa HTML -->
			<div id="myModal" class="modal fade">
				<div class="modal-dialog modal-confirm">
					<div class="modal-content">
						<div class="modal-header flex-column">
							<div class="icon-box">
								<i class="material-icons">&#xE5CD;</i>
							</div>
							<h4 class="modal-title w-100">Bạn có chắc?</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body">
							<p>Mọi thông tin liên quan tới người dùng này sẽ bị xóa mất. Bạn có thực sự muốn xóa người dùng này không?</p>
						</div>
						<div class="modal-footer justify-content-center">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Cancel</button>
							<button formaction="${urlUser}/delete" class="btn btn-danger">Delete</button>
							<input type="text" name="maXoa" id="result" style="display: none;">
						</div>
					</div>
				</div>
			</div>
			
			<!-- Modal cập nhật HTML -->
			<div id="myModal2" class="modal fade">
				<div class="modal-dialog modal-confirm">
					<div class="modal-content">
						<div class="modal-header flex-column">
							<div class="icon-box">
								<i class="material-icons">&#xE5CD;</i>
							</div>
							<h4 class="modal-title w-100">Bạn có chắc?</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body">
							<p>Bạn có muốn thay đổi vai trò của người dùng này không?</p>
						</div>
						<div class="modal-footer justify-content-center">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Cancel</button>
							<button formaction="${urlUser}/update" class="btn btn-danger">Update</button>
							<input type="text" name="maUpdate" id="result2" style="display: none;">
						</div>
					</div>
				</div>
			</div>
	</form>
	</div>



	<!-- Tag Footer -->
	<footer>
		<div class="container-fluid w-100 text-center"
			style="color: white; height: 100px; background-color: grey;">
			<div class="social pt-3" style="font-size: 30px;">
				<i class="fab fa-facebook"></i> <i class="fab fa-instagram"></i> <i
					class="fab fa-skype"></i> <i class="fab fa-youtube"></i> <i
					class="fab fa-google-plus-square"></i> <i class="fab fa-twitter"></i>
			</div>
			<h5>&copy; Copyright by 20110523@student.hcmute.edu.vn</h5>
		</div>
	</footer>
	<!-- Tag Footer -->

	
	<script type="text/javascript">
	   function result1(u){
      	  var temp = document.getElementById("result");
       	  temp.value = u;
        //salert(temp);
   	   }
	   
	   function result2(u){
	      	  var temp = document.getElementById("result2");
	       	  temp.value = u;
	        //salert(temp);
	   }
	</script>
	

</body>
</html>