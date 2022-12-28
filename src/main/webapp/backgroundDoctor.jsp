<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%
int counter = 0;
String d = request.getParameter("docID");
int docID = Integer.parseInt(d);
System.out.println(docID);
Connection con = DBConnect.getConn();
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from doctor where doctor_id="+docID+" and status='pending'");
while(rs.next()){
	counter++;
}
if(counter>=3){
%>
<font color=red>Sorry, has reached the limit<br>Try tomorrow</font>
<%}
counter=0;
%>