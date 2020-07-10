<%@page import = "java.sql.*" %>
<%@page import = "project.connectionProvider" %>

<%
try{
	String email1 = request.getParameter("username");
	String password1 = request.getParameter("password");
	
	session.setAttribute("teacher_email",email1);
	session.setAttribute("teacher_password",password1);
	
	Connection con = connectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select Teacher_Email, Teacher_Password from testnew.teacher where Teacher_Email = '"+email1+"' and Teacher_Password = '"+password1+"'");
	
	
	
	if(rs.next()) {
		response.sendRedirect("teacherHome.html");
	}
	else {
		response.sendRedirect("errorTeacherLogin.html");
	}
}catch(Exception e){
	
}

%>