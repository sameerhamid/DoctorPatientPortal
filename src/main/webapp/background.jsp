
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%
String spec = request.getParameter("spec");
Connection con = DBConnect.getConn();
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from doctor where specialist='" + spec + "'");
if (rs.isBeforeFirst()) {
%>
<hr style="height: 4px; border-width: 0; coslor: red; background-color: red">
<form class="row g-3" action="appAppointment" method="post">
	<input type="hidden" name="userid" value="${userObj.id }">

	<div class="col-md-6">
		<label for="inputEmail4" class="form-label">Full Name</label> <input
			required type="text" class="form-control" name="fullname">
	</div>

	<div class="col-md-6">
		<label>Gender</label> <select class="form-control" name="gender"
			required>
			<option value="male">Male</option>
			<option value="female">Female</option>
		</select>
	</div>

	<div class="col-md-6">
		<label for="inputEmail4" class="form-label">Age</label> <input
			required type="number" class="form-control" name="age" onKeyUp="setMinDate()" max=100 min=0>
	</div>

	<div class="col-md-6">
		<label for="inputEmail4" class="form-label">Appointment Date</label> <input
			type="date" class="form-control" required id="inputdate"
			name="appoint_date">
	</div>

	<div class="col-md-6">
		<label for="inputEmail4" class="form-label">Email</label> <input
			required type="email" class="form-control" name="email">
	</div>

	<div class="col-md-6">
		<label for="inputEmail4" class="form-label">Phone No</label> <input
			maxlength="10" required type="tel" class="form-control"
			name="phno">
	</div>


	<div class="col-md-6">
		<label for="inputEmail4" class="form-label">Consult</label> <input
			required type="text" class="form-control" name="diseases"
			value="<%=spec%>">
	</div>

	<div class="col-md-6">
		<label for="inputPassword4" class="form-label">Doctor</label> <select
			required class="form-control" name="doct">
			<option value="">--select--</option>

			<%
			while (rs.next()) {
			%>
			<option value="<%=rs.getInt("id")%>"><%=rs.getString("full_name")%></option>
			<%
			}
			%>
		</select>
	</div>

	<div class="col-md-12">
		<label>Full Address</label>
		<textarea required name="address" class="form-control" rows="3"
			cols=""></textarea>
	</div>

	<button class="col-md-6 offset-md-3 btn btn-success">Submit</button>
</form>
<%
} else {
%>
<font color=red>Sorry No <%=spec%> available
</font>
<%
}
%>
