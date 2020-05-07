package book_cleaning;
import java.sql.*;
public class driver {
public static void main(String args[]) {
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/book_cleaning","root","root123");
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("select * from book_details");
		
		while(rs.next())
		{
			//System.out.println("id:"+" \t"+"barcode_no:"+ " \t "+"date_time: ");
			System.out.println(rs.getString("id")+ " \t " + rs.getString("barcode_no")+"\t\t" + rs.getString("date_time"));
		
		}
		con.close();
		}
	catch(Exception e)
	{
		System.out.println(e);
	}
}
}
