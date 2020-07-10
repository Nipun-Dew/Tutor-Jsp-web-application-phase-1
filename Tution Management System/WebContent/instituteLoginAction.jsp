<%@page import = "java.sql.*" %>
<%@page import = "project.connectionProvider" %>

<%
try{
	String email1 = request.getParameter("username");
	String password1 = request.getParameter("password");
	
	session.setAttribute("institute_email",email1);
	session.setAttribute("institute_password",password1);
	
	Connection con = connectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select Institute_Email, Institute_Password from testnew.institute where Institute_Email = '"+email1+"' and Institute_Password = '"+password1+"'");
	
	
	
	if(rs.next()) {
		response.sendRedirect("instituteHome.html");
	}
	else {
		response.sendRedirect("errorInstituteLogin.html");
	}
}catch(Exception e){
	
}

%>