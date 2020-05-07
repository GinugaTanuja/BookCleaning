<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<meta charset="ISO-8859-1">
<title>insert data into book_details</title>
</head>
<body>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*" %>

<%
String barcode_no = request.getParameter("barcode_no");
//session.putValue("barcode_no",barcode_no);
//String date_time=request.getParameter("date_time");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/book_cleaning","root","root123");

String query = "INSERT INTO book_details(barcode_no, date_time)VALUES (?, CURRENT_TIMESTAMP)";
PreparedStatement pstmt = con.prepareStatement(query);
pstmt.setString(1,barcode_no);
pstmt.executeUpdate();
System.out.println("Data inserted......");
%>

<%
String book_title=request.getParameter("booktitle");
try
{
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con1 =DriverManager.getConnection("jdbc:mysql://localhost:3306/book_cleaning","root","root123");
    if(!con1.isClosed())
    {
    	PreparedStatement ps=con.prepareStatement("Select * from book_details where book_title='"+book_title+"'");
    	ResultSet rs=ps.executeQuery();
    	if(rs.next())
    	{
    		out.println(rs.getString("book_status"));
    	}
    	else
    	{
    		out.println("Invalid Book Name");
    	}
    }
}

catch(Exception e){}
%>
</body>
</html>