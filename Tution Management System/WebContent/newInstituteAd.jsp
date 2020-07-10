<%@page import = "project.connectionProvider" %>
<%@page import = "java.sql.*" %>

<% 
	
	String subId = request.getParameter("subjectid");
	String teacherName = request.getParameter("teachername");
	String area = request.getParameter("area");
	String description = request.getParameter("description");
	
	String imail = (String)session.getAttribute("institute_email");
	String ipass = (String)session.getAttribute("institute_password");
	
	try{
		Connection con = connectionProvider.getCon();
		Statement st1 = con.createStatement();
  		ResultSet rs1 = st1.executeQuery("select Institute_ID from testnew.institute where Institute_Email = '"+imail+"' and Institute_Password = '"+ipass+"'");
  		rs1.next();
  		String institid = rs1.getString(1);
		
		Statement st = con.createStatement();
		st.executeUpdate("insert into testnew.institute_ad (Institute_ID, Subject_ID, Teacher_Name, Area, Description) values('"+institid+"','"+subId+"','"+teacherName+"','"+area+"','"+description+"')");
		response.sendRedirect("instituteHome.html");
	}
	catch(Exception e) {
		out.println(e);
	}

%>