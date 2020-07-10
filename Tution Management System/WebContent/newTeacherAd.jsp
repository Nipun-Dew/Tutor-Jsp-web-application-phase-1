<%@page import = "project.connectionProvider" %>
<%@page import = "java.sql.*" %>

<% 
	String subId = request.getParameter("subjectid");
	String contactNo = request.getParameter("contactnumber");
	String area = request.getParameter("area");
	String description = request.getParameter("description");
	
	String tmail = (String)session.getAttribute("teacher_email");
	String tpass = (String)session.getAttribute("teacher_password");
	
	try{
		Connection con = connectionProvider.getCon();
		Statement st1 = con.createStatement();
  		ResultSet rs1 = st1.executeQuery("select Teacher_ID from testnew.teacher where Teacher_Email = '"+tmail+"' and Teacher_Password = '"+tpass+"'");
  		rs1.next();
  		String teachid = rs1.getString(1);
		
		Statement st = con.createStatement();
		st.executeUpdate("insert into testnew.teacher_ad (Teacher_ID, Subject_ID, Contact_Number, Area, Description) values('"+teachid+"','"+subId+"','"+contactNo+"','"+area+"','"+description+"')");
		response.sendRedirect("teacherHome.html");
	}
	catch(Exception e) {
		out.println(e);
	}

%>