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
<body>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row">

<%
						if (session.getAttribute("updateDrSuccMsg") != null) {
						%>
						<p class="text-center text-success fs-3">${updateDrSuccMsg }</p>
						<%
						session.setAttribute("updateDrSuccMsg", "");
						}else if (session.getAttribute("updateDrErrMassage") != null) {
						%>
						<p class="text-center text-danger fs-3">${updateDrErrMassage }</p>
						<%
						session.setAttribute("updateDrErrMassage", "");
						}
						%>

			<%
			if (session.getAttribute("updateDrSuccessMsg") != null) {
			%>
			<p class="fs-3 text-center text-success">${updateDrSuccessMsg}</p>
			<%
			}else if (session.getAttribute("updateDrErrMassage") != null) {
			%>
			<p class="fs-3 text-center text-danger">${updateDrErrMassage}</p>
			<%
			}
			%>
			
			
			<%
			if (session.getAttribute("deleteDrSuccessMsg") != null) {
			%>
			<p class="fs-3 text-center text-success">${deleteDrSuccessMsg}</p>
			<%
			session.setAttribute("deleteDrSuccessMsg", "");
			}else if (session.getAttribute("deleteDrErrMassage") != null) {
			%>
			<p class="fs-3 text-center text-danger">${deleteDrErrMassage}</p>
			<%
			session.setAttribute("deleteDrErrMassage", "");
			}
			%>
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 tsxt-center">Doctor Details</p>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">ID</th>
									<th scope="col">Full Name</th>
									<th scope="col">DOB</th>
									<th scope="col">Qualification</th>
									<th scope="col">Specialist</th>
									<th scope="col">Email</th>
									<th scope="col">Mob No</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
								List<Doctor> list2 = dao2.getAllDoctor();
								for (Doctor d : list2) {
								%>
								<tr>
									<td>
										<%
										out.print(d.getId());
										%>
									</td>
									<td>
										<%
										out.print(d.getFullName());
										%>
									</td>
									<td>
										<%
										out.print(d.getDob());
										%>
									</td>
									<td>
										<%
										out.print(d.getQualifaction());
										%>
									</td>
									<td>
										<%
										out.print(d.getSpecialist());
										%>
									</td>
									<td>
										<%
										out.print(d.getEmail());
										%>
									</td>
									<td>
										<%
										out.print(d.getMobNo());
										%>
									</td>
									<td><a href="edit_doctor.jsp?id=<%=d.getId()%>"
										class="btn btn-sm btn-success">Edit</a> <a
										href="../deleteDoctor?id=<%=d.getId()%>"
										class="btn btn-sm btn-danger">Delete</a></td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>

					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>