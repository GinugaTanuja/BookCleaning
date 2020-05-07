<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CleanedRange</title>
<style>
.menu a{
             color: black;
             text-align: center;
             padding: 5px;
             margin: 3px;
             text-decoration: none;

             font-size: 15px;}
.menu a:hover{background-color:#F4D03F; color:black; }
</style>
</head>
<body>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*" %>
<table border="1">
  <tr style=" background-color: blue; color: aliceblue;">
    <td>id</td>
    <td>barcode_no</td>
    <td>date_time</td>
    <td>book_title</td>
    <td>book_author</td>
    <td>book_status</td>
   </tr>
	<tr>

<%
String min=request.getParameter("min");
String max=request.getParameter("max");
Connection con =null;
Statement st = null;
ResultSet rs = null;
try
{
	Class .forName("com.mysql.jdbc.Driver");
	con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/book_cleaning","root","root123");
	st=con.createStatement();
	
	//String qry="select * from book_details";
	String qry="SELECT * FROM book_details WHERE id >='"+min+"'and id<='"+max+"'";
	
	rs=st.executeQuery(qry);
	while(rs.next())
	{
		
		//out.print(" id : "+rs1.getString(1)+" barcode_no :"+rs1.getString(2)+" date & time :"+rs1.getString(3));
	%>
	
	    <td><%=rs.getString(1) %></td>
	    <td><%=rs.getString(2) %></td>
	    <td><%=rs.getString(3) %></td>
	    <td><%=rs.getString(4) %></td>
	    <td><%=rs.getString(5) %></td>
	    <td><%=rs.getString(6) %></td>
	</tr>
	<% 
	}
}
catch(Exception e){}
%>
</table>
</body>
</html>