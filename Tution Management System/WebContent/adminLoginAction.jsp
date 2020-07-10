<%@page import = "java.sql.*" %>
<%@page import = "project.connectionProvider" %>

<%
try{
	String email1 = request.getParameter("username");
	String password1 = request.getParameter("password");
	
	Connection con = connectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select Student_Email, Student_Password from testnew.student where Student_Email = '"+email1+"' and Student_Password = '"+password1+"'");
	
	
	
	if(rs.next()) {
		response.sendRedirect("studentHome.html");
	}
	else {
		response.sendRedirect("errorStudentLogin.html");
	}
}catch(Exception e){
	
}

%>