<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cleaned On a Particular Day</title>
<style>
.menu a{
             color: black;
             text-align: center;
             padding: 5px;
             margin: 3px;
             text-decoration: none;

             font-size: 15px;}
.menu a:hover{background-color:#F4D03F; color:black; }
* {box-sizing: border-box;}

/* Add styles to the form container */
.container {
  text-align:left;
  margin: 20px;
  padding: 25px;
  max-width: 300px;
  width: 700px ;
  margin-left: auto ;
  margin-right: auto ;
  background-color: white;
  border: 1px solid blue;
  box-sizing: border-box;
}
</style>
</head>
<body>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*" %>
<br>
<div align="center" class="container">
<h4>Enter a date to view the books cleaned on a particular day:</h4>
<form action="cleanedonaday.jsp" method="get">
Enter date:<input name = "Date" type="text" placeholder="YYYY - MM - DD">
</form >
</div>
<div align="center" >
<table border="1">
  <tr align = "center" style=" background-color:#ffffcc;">
    <td><b>id</b></td>
    <td><b>barcode_no</b></td>
    <td><b>date_time</b></td>
    <td><b>book_title</b></td>
    <td><b>book_author</b></td>
    <td><b>book_status</b></td>
   </tr>
	<tr>

<%
String date=request.getParameter("Date");
Connection con =null;
Statement st = null;
ResultSet rs = null;
try
{
	Class .forName("com.mysql.jdbc.Driver");
	con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/book_cleaning","root","root123");
	st=con.createStatement();
	
	//String qry="select * from book_details";
	String qry="SELECT * FROM book_details WHERE CAST(date_time as DATE)='"+date+"' order by id";%>
	<h3 style="color:red; font-size:180%;"> List of books cleaned on
	<%
	out.print(date+" :");
	%></h3><% 
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
</div>
</table>
</body>
</html>