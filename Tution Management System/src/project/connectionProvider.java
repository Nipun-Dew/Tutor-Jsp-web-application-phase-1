package project;
import java.sql.*;

public class connectionProvider {
	public static Connection getCon() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testnew","root","aspire");
			
			return con;
		}
		catch(Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
}
