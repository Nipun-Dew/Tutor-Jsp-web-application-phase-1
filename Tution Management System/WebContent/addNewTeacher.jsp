<%@page import = "project.connectionProvider" %>
<%@page import = "java.sql.*" %>

<% 
	String teachername = request.getParameter("teachername");
	String contactnumber = request.getParameter("contactnumber");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	
	try{
		Connection con = connectionProvider.getCon();
		Statement st = con.createStatement();
		st.executeUpdate("insert into testnew.teacher (Teacher_Name, Contact_Number, Teacher_Email, Teacher_Password) values('"+teachername+"','"+contactnumber+"','"+email+"','"+password+"')");
		response.sendRedirect("teacherLogin.html");
	}
	catch(Exception e) {
		out.println(e);
	}

%>