<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allcss.jsp"%>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
<script>
function validate(){
	var emailID = document.getElementById("em_id").value;
	var passwordID = document.getElementById("pass_id").value;
	
	 
	 if(passwordID.length<6){
			alert("Min Password Length is 6");
			return false;
		}
	    
	 if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(emailID))	 
		    return true;
		 else{
			 alert("Enter Valid Email Address")
			 return false;
		 }
}
</script>
</head>
<body>

	<%@include file="component/navbar.jsp"%>
	
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">User Register</p>
						<%if (session.getAttribute("uObj") != null) { %>	
							<p class="text-center text-success fs-3">${uObj }</p>
							<%}
							session.setAttribute("uObj","");
							%>
						<%if(session.getAttribute("erMsg") != null){
							%>	<p class="text-center text-danger fs-3">${erMsg }</p>
							<%}
						session.setAttribute("erMsg","");
						%>
						<form action="user_register" method="post" onSubmit="return validate()">
							<div class="mb-3">
								<label class="form-label">User Name</label> <input required
									name="fullname" type="text" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Email address</label> <input required id="em_id"
									name="email" type="email" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input required id="pass_id"
									name="password" type="password" class="form-control">
							</div>
							<button type="submit" class="btn bg-success text-white col-md-12">Register</button>
						</form>
						<br>
						Already have an account? <a href="user_login.jsp" class="text-decoration-none">Login</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>