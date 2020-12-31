package sponsorme;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager
{
	private static final String URL = "jdbc:mysql://localhost:3306/sponsorme";
	private static final String USER = "root";
	private static final String PASSWORD = "sql153 @?3462mrB";
	
	private static Connection connection;
	
	public static Connection getConnection()
	{
		if (connection == null)
		{
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection(URL, USER, PASSWORD);
			}
			catch (SQLException | ClassNotFoundException e)
			{
				e.printStackTrace();
			}
		}
		return connection;
	}
}
