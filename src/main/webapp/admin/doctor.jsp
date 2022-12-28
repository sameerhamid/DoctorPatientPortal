<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>
function setMaxDate() {
	var dtToday = new Date();

	var month = dtToday.getMonth() + 1;
	var day = dtToday.getDate();
	var year = dtToday.getFullYear();
	year = year-20;
	if (month < 10)
		month = '0' + month.toString();
	if (day < 10)
		day = '0' + day.toString();

	var maxDate = year + '-' + month + '-' + day;
	$('#userdate').attr('max', maxDate);
}
</script>
<script>
function validate(){
	var mobNo = document.getElementById("mob_id").value;
	var emailID = document.getElementById("email_id").value;
	var passwordID = document.getElementById("password_id").value;
	
	if(passwordID.length<6){
		alert("Min Password Length is 6");
		return false;
	}
 	
	if(mobNo.length!=10){
		alert("Enter 10 digit Mobile Number");
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
<%@include file="../component/allcss.jsp"%>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row">

			<div class="col-md-5 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Add Doctor</p>

						<%
						if (session.getAttribute("addDocSuccessMsg") != null) {
						%>
						<p class="fs-3 text-center text-success">${addDocSuccessMsg}</p>
						<%
						session.setAttribute("addDocSuccessMsg", "");
						} else if (session.getAttribute("addDocErrMassage") != null) {
						%>
						<p class="fs-3 text-center text-danger">${addDocErrMassage}</p>
						<%
						session.setAttribute("addDocErrMassage", "");
						}
						%>
						<form action="../addDoctor" method="post"
							onSubmit="return validate()">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="fullname" class="form-control" onKeyUp="setMaxDate()">
							</div>
							<div class="mb-3">
								<label class="form-label">DOB</label> <input type="date"
									required name="dob" class="form-control" id="userdate">
							</div>
							<div class="mb-3">
								<label class="form-label">Qualification</label> <input
									type="text" required name="qualification" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label> <select name="spec"
									required class="form-control">
									<option value="">--select--</option>
									<%
									SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
									List<Specialist> list = dao.getAllSpecialist();
									for (Specialist s : list) {
									%>
									<option>
										<%
										out.print(s.getSpecialistName());
										%>
									</option>
									<%
									}
									%>
								</select>
							</div>
							<div class="mb-3">
								<label class="form-label">Email</label> <input type="email"
									id="email_id" required name="email" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Mob No.</label> <input type="tel"
									id="mob_id" required name="mobno" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input
									type="password" required name="password" class="form-control" id="password_id">
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>


</body>
</html>