<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Doctor"%>
<%
if (session.getAttribute("doctObj") == null) {
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
	
	<div class="container p-3">
		<div class="row">
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
					<p class="fs-3 text-center">Patient Details</p>
					
					<%if(session.getAttribute("updateSuccMsg")!=null){
						%>
						<p class="text-center text-success fs-3">${updateSuccMsg }</p>
					<%}else if(session.getAttribute("updateErrMsg")!=null){ %>
					<p class="text-center text-danger fs-3">${updateErrMsg }</p>
					
				<%} %>
										
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment Date</th>
									<th scope="col">Email</th>
									<th scope="col">Mobile NO.</th>
									<th scope="col">Disease</th>
									<th scope="col">Status</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
							<%
							Doctor d =(Doctor)session.getAttribute("doctObj");
							AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
							List<Appointment> list = dao.getAllAppointmentByDoctorLogin(d.getId());
							for(Appointment ap: list){
								%>
								<tr>
									<th><%=ap.getFullName()%></th>
									<td><%=ap.getGender()%></td>
									<td><%=ap.getAge()%></td>
									<td><%=ap.getAppoinDate()%></td>
									<td><%=ap.getEmail()%></td>
									<td><%=ap.getPhNo()%></td>
									<td><%=ap.getDiseases() %></td>
									<td><%=ap.getStatus() %></td>
									<td>
									<%if("pending".equals(ap.getStatus())){
									%>
									<a href="comment.jsp?id=<%=ap.getId() %>" class="btn btn-success btn-sm">Comment</a>	
									<%}else{
									%>	
									<a href="#" class="btn btn-success btn-sm disabled">Comment</a>
									<%}%>
									</td>
								</tr>
							<%} %>
								
							</tbody>
						</table>
					
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>