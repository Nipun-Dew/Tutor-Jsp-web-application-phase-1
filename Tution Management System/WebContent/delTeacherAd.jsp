<%@page import = "java.sql.*" %>
<%@page import = "project.connectionProvider" %>

<%
try{
	String subjectId = request.getParameter("subjectid");
	
	String tmail = (String)session.getAttribute("teacher_email");
	String tpass = (String)session.getAttribute("teacher_password");

	Connection con = connectionProvider.getCon();
	Statement st1 = con.createStatement();
	ResultSet rs1 = st1.executeQuery("select Teacher_ID from testnew.teacher where Teacher_Email = '"+tmail+"' and Teacher_Password = '"+tpass+"'");
	rs1.next();
	String teachid = rs1.getString(1);
	
	Statement st = con.createStatement();
	st.executeUpdate("delete from teacher_ad where Subject_ID = '"+subjectId+"' and Teacher_ID = '"+teachid+"'");
	response.sendRedirect("teacherHome.html");
	
}catch(Exception e){
	
}

%>