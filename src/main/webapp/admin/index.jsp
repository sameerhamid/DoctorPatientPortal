<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%
HttpSession session1 = request.getSession();
if (session1.getAttribute("adminObj") == null) {

	response.sendRedirect("../admin_login.jsp");
}
%>

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
</head>
<body>
	<%@include file="navbar.jsp"%>


	<div class="container p-5">
		<p class="text-center fs-3">Admin Dashboard</p>
		
		<%if(session.getAttribute("specObj")==null){ %>
		<p class="text-center text-success fs-3">${errMsg }</p>
		<%
		session.setAttribute("errMsg","");
		}else{ %>
		<p class="text-center text-success fs-3">${succMsg }</p>
		<%} 
		session.setAttribute("succMsg", "");
		%>
		
		<%DoctorDao dao =new DoctorDao(DBConnect.getConn());
		%>
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-primary">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">
							Doctor <br><%=dao.countDoctor() %>
						</p>
					</div>
				</div>
			</div>



			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-primary">
						<i class="fas fa-user-circle fa-3x"></i><br>
						<p class="fs-4 text-center">
							Patient <br><%=dao.countUser() %>
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-primary">
						<i class="fa-solid fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Total Appointment <br><%=dao.countAppointment() %>
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-4 mt-2">

				<div class="card paint-card " data-bs-toggle="modal"
					data-bs-target="#exampleModal">
					<div class="card-body text-center text-primary">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Speciality <br><%=dao.countSpecialist() %>
						</p>
					</div>
				</div>

			</div>

		</div>
	</div>



	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Specialist</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="../addSpecialist" method="post">
						<div calss="form-group">
							<label>Enter Specialist Name: </label> <input type="text"
								name="specName" calss="form-control">
						</div>

						<div class="text-center mt-3">
							<button type=submit class="btn btn-primary">Add</button>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>