package sponsorme.store;

import sponsorme.ConnectionManager;
import sponsorme.model.Admin;
import sponsorme.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Data store for users.
 * <p>
 * Handles actual retrieving and storing transactions with a database.
 *
 * @author Kenneth Tan
 */
public class AdminStore extends DataStore<Admin>
{
	private static AdminStore instance;

	/**
	 * Can't retrieves an admin by their admin id.
	 * @param id the admin id
	 * @return Retrieved admin from the database, or null if the admin does not exist
	 */
	@Override
	public Admin get(int id)
	{
		return null;
	}
	
	/**
	 * Retrieves an admin by their username.
	 * @param username the username of the admin.
	 * @return Retrieved admin from the database, or null if the admin does not exist.
	 */
	public Admin get(String username)
	{
		System.out.println("[AdminStore] Retrieving user with username \"" + username + "\"");
		Connection connection = ConnectionManager.getConnection();
		String sql = "SELECT * FROM sponsorme.admin WHERE name = ? ;";
		
		try (PreparedStatement statement = connection.prepareStatement(sql))
		{
			statement.setString(1, username);
			Admin admin = query(statement);
			if (admin != null)
			{
				System.out.println("[AdminStore] Retrieved " + admin);
				return admin;
			}
			System.out.println("[AdminStore] Admin \"" + username + "\" does not exist!");
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	private Admin query(PreparedStatement statement)
	{
		try (ResultSet result = statement.executeQuery())
		{
			if (result.next())
			{
				return new Admin(
						result.getInt("admin_id"),
						result.getString("name"),
						result.getString("email"),
						result.getString("password_hash"),
						result.getString("salt"));
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * Do nothing. Can't store admin in database.
	 *
	 * @param admin the admin to store.
	 */
	@Override
	public void store(Admin admin)
	{

	}
	
	public static AdminStore getInstance()
	{
		if (instance == null)
			instance = new AdminStore();
		return instance;
	}
}
