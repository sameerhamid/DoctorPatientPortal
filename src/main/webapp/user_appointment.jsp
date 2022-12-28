
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script>
	function setMinDate() {
		var dtToday = new Date();

		var month = dtToday.getMonth() + 1;
		var day = dtToday.getDate();
		var year = dtToday.getFullYear();
		if (month < 10)
			month = '0' + month.toString();
		if (day < 10)
			day = '0' + day.toString();

		var maxDate = year + '-' + month + '-' + day;
		$('#inputdate').attr('min', maxDate);
	}
</script>
<script>
	var req;
	function fun() {
		var speciality = document.getElementById("speciality_id").value;
		req = new XMLHttpRequest();
		var url = "background.jsp?spec=" + speciality;

		req.onreadystatechange = fun1;
		req.open("GET", url, true);
		req.send();
	}

	function fun1() {
		if (req.readyState == 4) {
			document.getElementById("full_form").innerHTML = req.responseText;
		}
	}
</script>
<meta charset="ISO-8859-1">
<title>User Appointment</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("img/hos2.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div class="container-fulid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 p-5">
				<img alt="" src="img/doct.jpg" width="100%" height="90%"
					border-radious="20px">
			</div>

			<div class="col-md-6">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-3">User Appointment</p>
				

						<%
						if (session.getAttribute("appoinSuccessmsg") != null) {
						%>
						<p class=" fs-4 text-center text-success">${appoinSuccessmsg}</p>
						<%
						
						session.setAttribute("appoinSuccessmsg", "");
						} else if (session.getAttribute("appoinErrormsg") != null) {
						%>
						<p class="fs-4 text-center text-danger">${appoinErrormsg}</p>
						<%
						
						session.setAttribute("appoinErrormsg", "Something Wrong on server");
						}
						%>
						<div class="col-md-6">
							<label for="inputPassword4" class="form-label">Select
								Specialist you are looking for: </label> <select onChange="fun()"
								id="speciality_id" required class="form-control">
								<option value="">--select--</option>
								<%
								Connection con = DBConnect.getConn();
								Statement st = con.createStatement();
								ResultSet rs = st.executeQuery("select * from specialist");
								while (rs.next()) {
								%>
								<option value="<%=rs.getString("spec_name")%>"><%=rs.getString("spec_name")%></option>
								<%
								}
								%>
							</select>
						</div>
						<%
						if (session.getAttribute("userObj") == null) {
						%>
						<br>
						<a href="user_login.jsp"
							class="col-md-6 offset-md-3 btn btn-primary">Login First</a>
						<%
						} else {
						%>
						<div id="full_form"></div>
						<%
						}
						%>
					</div>
				</div>
			</div>
		</div>

	</div>
	<%@include file="component/footer.jsp"%>

</body>
</html>