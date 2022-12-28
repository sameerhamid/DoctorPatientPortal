

<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
if (session.getAttribute("doctObj") == null) {
	response.sendRedirect("../doctor_login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
<%@include file="../component/allcss.jsp"%>

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
	$('#dobEdId').attr('max', maxDate);
}
</script>

<script>
function validate(){
	var mobNo = document.getElementById("mob_id").value;
	var emailID = document.getElementById("email_id").value;
	
	
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

</head>
<body>

	<%@include file="navbar.jsp"%>

	<div class="container p-4">
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<p class="text-center fs-3">Change Password</p>

					<%
					if (session.getAttribute("drChangePassSuccMsg") != null) {
					%>
					<p class="text-center text-success fs-3">${drChangePassSuccMsg }</p>
					<%
					session.setAttribute("drChangePassSuccMsg", "");
					} else if (session.getAttribute("drChangePassErrMsg") != null) {

					session.setAttribute("drChangePassErrMsg", "");
					%>

					<p class="text-center text-danger fs-3">${drChangePassErrMsg }</p>
					<%
					} else if (session.getAttribute("drOldPassErrMsg") != null) {

					session.setAttribute("drOldPassErrMsg", "");
					%>
					<p class="text-center text-danger fs-3">${drOldPassErrMsg }</p>
					<%
					}
					%>
					<div class="card-body">
						<form action="../doctChangePassword" method="post">


							<div class="mb-3">
								<label>Enter Old Password</label> <input type="text"
									name="oldPassword" class="form-control" required>
							</div>

							<div class="mb-3">
								<label>Enter New Password</label> <input type="text"
									name="newPassword" class="form-control" required>
							</div>
							<input type="hidden" value="${doctObj.id }" name="uid">
							<button class="btn btn-primary col-md-12">Change
								Password</button>
						</form>
					</div>
				</div>
			</div>

			<div class="col-md-5 offset-md-2">
				<div class="card paint-card">
					<p class="text-center fs-3">Edit Profile</p>

					<%
					if (session.getAttribute("updateDrSuccessMsgd") != null) {
					%>
					<p class="text-center text-success fs-3">${updateDrSuccessMsgd }</p>
					<%
					session.setAttribute("updateDrSuccessMsgd", "");
					} else if (session.getAttribute("updateDrErrMassaged") != null) {
					%>
					<p class="text-center text-danger fs-3">${updateDrErrMassaged }</p>
					<%
					}
					session.setAttribute("updateDrErrMassaged", "");
					%>

					<div class="card-body">
						<form action="../doctorUpdateProfile" method="post" onSubmit="return validate()">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="fullname" class="form-control"
									value="${doctObj.fullName }" onKeyUp="setMaxDate()">
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label> <input type="date"
									required name="dob" class="form-control"
									value="${doctObj.dob }" id="dobEdId">
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label> <input required
									name="qualification" type="text" class="form-control"
									value="${doctObj.qualifaction }">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label> <select name="spec"
									required class="form-control">
									<option>${doctObj.specialist }</option>

									<%
									SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
									List<Specialist> list = dao.getAllSpecialist();
									for (Specialist s : list) {
									%>
									<option><%=s.getSpecialistName()%></option>
									<%
									}
									%>

								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label> <input type="text"
									required name="email" class="form-control"
									value="${doctObj.email }" id="email_id">
							</div>

							<div class="mb-3">
								<label class="form-label">Mob No</label> <input type="tel"
									required name="mobno" class="form-control"
									value="${doctObj.mobNo }" id="mob_id">
							</div>

							<input type="hidden" name="id" value="${doctObj.id }">

							<button type="submit" class="btn btn-primary">Update</button>
						</form>

					</div>
				</div>
			</div>


		</div>
	</div>


</body>
</html>
