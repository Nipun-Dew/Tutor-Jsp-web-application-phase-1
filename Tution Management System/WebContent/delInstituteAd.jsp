<%@page import = "java.sql.*" %>
<%@page import = "project.connectionProvider" %>

<%
try{
	String subjectId = request.getParameter("subjectid");
	
	String imail = (String)session.getAttribute("institute_email");
	String ipass = (String)session.getAttribute("institute_password");

	Connection con = connectionProvider.getCon();
	Statement st1 = con.createStatement();
	ResultSet rs1 = st1.executeQuery("select Institute_ID from testnew.institute where Institute_Email = '"+imail+"' and Institute_Password = '"+ipass+"'");
	rs1.next();
	String instituteid = rs1.getString(1);
	
	Statement st = con.createStatement();
	st.executeUpdate("delete from institute_ad where Subject_ID = '"+subjectId+"' and Institute_ID = '"+instituteid+"'");
	response.sendRedirect("instituteHome.html");
	
}catch(Exception e){
	
}

%>