<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>librarian</title>
</head>
<body>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*" %>

<%
String barcode_no = request.getParameter("barcode_no");
//out.println(barcode_no);
//session.putValue("barcode_no",barcode_no);
//String date_time=request.getParameter("date_time");
Class.forName("com.mysql.jdbc.Driver");
Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/book_cleaning","root","root123");

String query = "INSERT INTO book_details(id,barcode_no, date_time)VALUES (9,'"+ barcode_no +"','" + "2020-02-20 13:31:44')";
PreparedStatement pstmt = con.prepareStatement(query);
//pstmt.setString(1,barcode_no);
pstmt.executeUpdate(query);
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