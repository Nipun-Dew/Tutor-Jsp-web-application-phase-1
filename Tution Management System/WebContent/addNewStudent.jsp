<%@page import = "project.connectionProvider" %>
<%@page import = "java.sql.*" %>

<% 
	String studentname = request.getParameter("studentname");
	String contactnumber = request.getParameter("contactnumber");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	
	try{
		Connection con = connectionProvider.getCon();
		Statement st = con.createStatement();
		st.executeUpdate("insert into testnew.student (Student_Name, Contact_Number, Student_Email, Student_Password) values('"+studentname+"','"+contactnumber+"','"+email+"','"+password+"')");
		response.sendRedirect("adminLogin.html");
	}
	catch(Exception e) {
		out.println(e);
	}

%>