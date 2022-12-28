<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Doctor"%>
<%
HttpSession session1 = request.getSession();
if (session1.getAttribute("doctObj") == null) {

	response.sendRedirect("../doctor_login.jsp");
}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp" %>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	
<%@include file="navbar.jsp" %>

<p class="text-center fs-3">Doctor Dashboard</p>

	 <%
	Doctor d= (Doctor) session.getAttribute("doctObj");
	DoctorDao dao = new DoctorDao(DBConnect.getConn());
	%> 
	<div class="d-flex justify-content-center">
		<div class="row">
			
			<div class="col-md-70">
				<div class="card paint-card">
					<div class="card-body text-center text-primary">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Total Appointment <br><%=dao.countAppointmentByDoctorId(d.getId())%>
						</p>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>