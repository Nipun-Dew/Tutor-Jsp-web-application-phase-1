<!DOCTYPE html>
<html>
<title>Tutor</title>
<link rel="stylesheet" type="text/css" href="style.css">

<style>


* {margin: 0; padding: 0;}
 
div {
  margin: 30px;
}
 
ul {
  list-style-type: none;
  width: 60%;
}
 
h3 {
  font: bold 24px/1.5 Helvetica, Verdana, sans-serif;
  color: #404040;
}
h5 {
  font: bold 19px/1.5 Helvetica, Verdana, sans-serif;
  color: #404040;
}
 
li img {
  float: left;
  margin: 0 15px 40px 0;
}
 
li p {
  font: 200 16px/1.5 Georgia, Times New Roman, serif;
  color: #001a33;
}
 
li {
  padding: 10px;
  background: #758da3;
  border-style: solid;
  border-color: #c2d6d6;
  border-radius: 10px;
  margin: 25px;
  overflow: auto;
}
 
li:hover {
  background: #b3cce6;
  border-radius: 10px;
  cursor: pointer;
}
.login-box {
  position: fixed;
  right: 0;
}
a{
    text-decoration: none;
    font-weight: 20px;
    font-size: 22px;
    color: #bfbfbf;
}
a:hover
{
    color: #737373;
}
</style>
<body>
<div>
  <ul>
  <%@page import = "java.sql.*" %>
  <%@page import = "project.connectionProvider" %>
  <%
      	try{
      		String sub_id = request.getParameter("subjectid");
      		
      		//out.println(tmail);
      		//out.println(tpass);
      		
      		Connection con = connectionProvider.getCon();
      		Statement st = con.createStatement();
      		Statement st1 = con.createStatement();
      		ResultSet rs = st.executeQuery("select Teacher_Name, Subject_Name, Medium, teacher.Contact_Number, Area, Description from teacher_ad, teacher, subject where teacher_ad.Teacher_ID=teacher.Teacher_ID and teacher_ad.Subject_ID=subject.Subject_ID and teacher_ad.Subject_ID='"+sub_id+"'");
      		ResultSet rs1 = st1.executeQuery("select Institute_Name, Subject_Name, institute_ad.Teacher_Name, Medium, institute.Contact_Number, Area, Description from institute_ad, institute, subject where institute_ad.Institute_ID=institute.Institute_ID and institute_ad.Subject_ID=subject.Subject_ID and institute_ad.Subject_ID='"+sub_id+"'");
      		
      		while(rs.next()){ %>
    <li>
      <img src="user.png">
      <h3><%=rs.getString(1) %></h3>
      <h5><%=rs.getString(2) %></h5>
      <p><%=rs.getString(3) %> medium</p><br>
      <p>contact no: 0<%=rs.getString(4) %></p>
      <p>classes at <%=rs.getString(5) %></p><br>
      <p><%=rs.getString(6) %></p>
    </li>
      
    <% }
      		while(rs1.next()){ %>
      	    <li>
      	      <img src="user.png" />
      	      <h3><%=rs1.getString(1) %> Institute</h3>
      	      <h5><%=rs1.getString(2) %></h5><br>
      	      <h5>Teacher: <%=rs1.getString(3) %></h5>
      	      <p><%=rs1.getString(4) %> medium</p><br>
      	      <p>contact no: 0<%=rs1.getString(5) %></p>
      	      <p>classes at <%=rs1.getString(6) %></p><br>
      	      <p><%=rs1.getString(7) %></p>
      	    </li>
      	      
      	    <% }
      	
      	
      	}catch(Exception e){
			
		}%>
  </ul>
</div><br><br>
<center><h1><a href="studentSearch.html">Back</a></h1></center>

</body>
</html>
















