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
<%@include file="../component/allcss.jsp"%>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
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
	$('#dobId').attr('max', maxDate);
}
</script>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row">

			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Edit Doctor Details</p>

					
						
						<%
						String ID_STRING = request.getParameter("id");
						int id = Integer.parseInt(ID_STRING);
						DoctorDao dao3 = new DoctorDao(DBConnect.getConn());
						Doctor d = dao3.getDoctorById(id);
						%>
						
							
						<form action="../updateDoctor" method="post">						
							<div class="mb-3">
								<label class="form-label">ID</label> <input type="text"
									 class="form-control" disabled
									value="<%=id%>">
							</div>
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="fullname" class="form-control"
									value="<%=d.getFullName()%>" onKeyUp="setMaxDate()">
							</div>
							<div class="mb-3">
								<label class="form-label">DOB</label> <input type="date"
									required name="dob" class="form-control"
									value="<%=d.getDob()%>" id="dobId">
							</div>
							<div class="mb-3">
								<label class="form-label">Qualification</label> <input
									type="text" required name="qualification" class="form-control"
									value="<%=d.getQualifaction()%>">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label> <select name="spec"
									required class="form-control">
									<option>
										<%=d.getSpecialist()%></option>
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
									 class="form-control" disabled
									value="<%=d.getEmail()%>">
							</div>
							<div class="mb-3">
								<label class="form-label">Mob No.</label> <input type="tel"
									 class="form-control" disabled
									value="<%=d.getMobNo()%>">
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input type="text"
									required name="password" class="form-control"
									value="<%=d.getPassword()%>">
							</div>
							<input type="hidden" name="id" value="<%=id%>">
							<input type="hidden" name="email" value="<%=d.getEmail()%>">
							<input type="hidden" name="mobno" value="<%=d.getMobNo()%>">
							<button type="submit" class="btn btn-success col-md-12">Update</button>
						</form>
						
					</div>
				</div>
			</div>

		</div>
	</div>


</body>


</html>