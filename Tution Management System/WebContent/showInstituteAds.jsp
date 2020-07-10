<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">   
  <link rel="stylesheet" type="text/css" href="style.css">  
  <style>
  table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 80%;
}

td{
  border: none;
  text-align: left;
  color: #1a1a1a;
  padding: 20px;
}

th{
	background-color: #a6a6a6;
	padding: 18px;
	font-weight: 400;
	font-size: 18px;
	color: #cccccc;
	text-align: left;
}

a  {
    text-decoration: none;
    font-weight: 300;
    font-size: 20px;
    color: #d9d9d9;
}

a:hover
{
    color: #39dc79;
}

  </style>
</head>
<body>
<br><h1>ADVERTISTMENTS</h1><br><br>
<div>
    <center><table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
         <th>Institute ID</th>
          <th>Subject ID</th>
          <th>Contact Number</th>
          <th>Area</th>
          <th>Description</th>
        </tr>
      </thead><br>
   
      <tbody>
      <%@page import = "java.sql.*" %>
      <%@page import = "project.connectionProvider" %>
      <%
      	try{
      		String imail = (String)session.getAttribute("institute_email");
      		String ipass = (String)session.getAttribute("institute_password");
      		
      		//out.println(tmail);
      		//out.println(tpass);
      		
      		Connection con = connectionProvider.getCon();
      		Statement st = con.createStatement();
      		ResultSet rs = st.executeQuery("select Institute_ID from testnew.institute where Institute_Email = '"+imail+"' and Institute_Password = '"+ipass+"'");
      		rs.next();
      		String instid = rs.getString(1);
      		//out.println(teacherid);
      		
      		Statement st2 = con.createStatement();
      		ResultSet rs2 = st2.executeQuery("select * from testnew.institute_ad where Institute_ID = '"+instid+"'");
      		
      		while(rs2.next()){ %>
      		<tr>
          <td><%=rs2.getString(1) %></td>
          <td><%=rs2.getString(2) %></td>
          <td><%=rs2.getString(3) %></td>
          <td><%=rs2.getString(4) %></td>
          <td><%=rs2.getString(5) %></td>
        	</tr>
      		
      		
      	<% }}catch(Exception e){
			
		}%>
		</tbody>
		</table></center>
		</div><br><br><br><br><br>
		<center><a href="instituteHome.html">Back</a></center><br><br>
</body>
</html>