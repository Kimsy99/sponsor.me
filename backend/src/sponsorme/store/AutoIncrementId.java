package sponsorme.store;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import sponsorme.ConnectionManager;

public interface AutoIncrementId
{
	default int getNewId()
	{
		Connection connection = ConnectionManager.getConnection();
		
		try (Statement statement = connection.createStatement())
		{
			try (ResultSet result = statement.executeQuery(getNewIdQuery()))
			{
				if (result.next())
					return result.getInt("max_id");
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		return 0;
	}
	
	String getNewIdQuery();
}
