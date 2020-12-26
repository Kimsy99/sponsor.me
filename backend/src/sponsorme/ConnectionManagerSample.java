package sponsorme;

import java.sql.Connection;

public class ConnectionManagerSample
{
	private static final String URL = "jdbc:mysql://localhost:3306/sponsorme";
	private static final String USER = "root";
	private static final String PASSWORD = " #### YOUR PASSWORD HERE ####";
	
	private static Connection connection;
	
	public static Connection getConnection()
	{
		/*
		 * ###############################################
		 * Rename ConnectionManagerSample.java to ConnectionManager.java, change the PASSWORD final field
		 * then uncomment the code snippet below.
		 * ###############################################
		 */
		
//		if (connection == null)
//		{
//			try
//			{
//				Class.forName("com.mysql.jdbc.Driver");
//				connection = DriverManager.getConnection(URL, USER, PASSWORD);
//			}
//			catch (SQLException e)
//			{
//				e.printStackTrace();
//			}
//		}
		return connection;
	}
}
