<%@page import = "project.connectionProvider" %>
<%@page import = "java.sql.*" %>

<% 
	String institutename = request.getParameter("institutename");
	String contactnumber = request.getParameter("contactnumber");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	
	try{
		Connection con = connectionProvider.getCon();
		Statement st = con.createStatement();
		st.executeUpdate("insert into testnew.institute (Institute_Name, Contact_Number, Institute_Email, Institute_Password) values('"+institutename+"','"+contactnumber+"','"+email+"','"+password+"')");
		response.sendRedirect("instituteLogin.html");
	}
	catch(Exception e) {
		out.println(e);
	}

%>