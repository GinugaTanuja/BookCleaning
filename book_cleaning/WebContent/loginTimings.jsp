<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*" %>
<a href ="barcode.html"><b>Back</b></a>
<br>
<br>
<button onclick="window.print()">Print</button>
<br><br>
<table border="1">
  <tr style=" background-color: blue; color: aliceblue;">
    <td>user</td>
    <td>password</td>
    <td>role</td>
    
   </tr>
	<tr>

<%
Connection con =null;
Statement st = null;
ResultSet rs = null;
try
{
	Class .forName("com.mysql.jdbc.Driver");
	con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/book_cleaning","root","root123");
	st=con.createStatement();
	
	String qry="select * from login_timings";
	rs=st.executeQuery(qry);
	while(rs.next())
	{
		
		//out.print(" id : "+rs1.getString(1)+" barcode_no :"+rs1.getString(2)+" date & time :"+rs1.getString(3));
	%>
	
	    <td><%=rs.getString(1) %></td>
	    <td><%=rs.getString(2) %></td>
	    <td><%=rs.getString(3) %></td>
	</tr>
	<% 
	}
}
catch(Exception e){}
%>
</table>
</body>
</html>