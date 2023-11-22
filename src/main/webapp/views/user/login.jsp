<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>ĐĂNG NHẬP/ĐĂNG KÍ</title>
</head>
<body>
	<%@include file="../../common/user/menuuser.jsp"%>
	<div class="col-md-12" style="margin-top: 30px">
	    <img src="" class="logo-web-login">
	</div>
	<% if (request.getParameter("error").equals("1")) { %>
		<div class="alert alert-warning w-50 mx-auto" role="alert">
			Password or username is incorrect
		</div>
	<% } %>
	<div class="login-form">
	     <div class="row">
	         <div class="col-lg-6">
	             <img src="template/user/image/logologin1.png" class="img-login">
	         </div>
			 <form class="row col-lg-6 needs-validation" action="${pageContext.request.contextPath}/j_spring_security_check" method='POST' novalidate>
				 <div class="col-md-12">
					 <label for="username" class="form-label">Username</label>
					 <input name="username" id="username" type="text" placeholder="Enter user name" class="form-control" required>
					 <div class="invalid-feedback">
						 Username cannot be empty
					 </div>
				 </div>
				 <div class="col-md-12">
					 <label for="password" class="form-label">Password</label>
					 <input name="password" id="password" type="password" placeholder="Enter your password" class="form-control" required>
					 <div class="invalid-feedback">
						 Password cannot be empty
					 </div>
				 </div>
				 <div class="col-12">
					 <button class="btn-login">Sign in</button>
					 <p class="not-member">Not a Member? <a href="regis">Sign Up</a> </p>
				 </div>
			 </form>
	     </div>
	</div>


	<script>
		(() => {
			'use strict'

			// Fetch all the forms we want to apply custom Bootstrap validation styles to
			const forms = document.querySelectorAll('.needs-validation')

			// Loop over them and prevent submission
			Array.from(forms).forEach(form => {
				form.addEventListener('submit', event => {
					if (!form.checkValidity()) {
						event.preventDefault()
						event.stopPropagation()
					}

					form.classList.add('was-validated')
				}, false)
			})
		})()
	</script>
</body>
</html>