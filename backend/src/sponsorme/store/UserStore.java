package sponsorme.store;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import sponsorme.ConnectionManager;
import sponsorme.model.User;

/**
 * Data store for users.
 * <p>
 * Handles actual retrieving and storing transactions with a database.
 *
 * @author Kenneth Tan
 */
public class UserStore extends DataStore<User>
{
	private static UserStore instance;
	
	/**
	 * Retrieves a user by their user id.
	 * @param id the user id
	 * @return Retrieved user from the database, or null if the user does not exist
	 */
	@Override
	public User get(int id)
	{
		System.out.println("Retrieving user with user id \"" + id + "\"");
		Connection connection = ConnectionManager.getConnection();
		String sql = "SELECT * FROM sponsorme.user WHERE user_id = ? ;";
		
		try (PreparedStatement statement = connection.prepareStatement(sql))
		{
			statement.setInt(1, id);
			User user = query(statement);
			if (user != null)
			{
				System.out.println("Retrieved " + user);
				return user;
			}
			System.out.println("User \"" + id + "\" does not exist!");
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * Retrieves a user by their username.
	 * @param username the username of the user.
	 * @return Retrieved user from the database, or null if the user does not exist.
	 */
	public User get(String username)
	{
		System.out.println("Retrieving user with username \"" + username + "\"");
		Connection connection = ConnectionManager.getConnection();
		String sql = "SELECT * FROM sponsorme.user WHERE username = ? ;";
		
		try (PreparedStatement statement = connection.prepareStatement(sql))
		{
			statement.setString(1, username);
			User user = query(statement);
			if (user != null)
			{
				System.out.println("Retrieved " + user);
				return user;
			}
			System.out.println("User \"" + username + "\" does not exist!");
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	private User query(PreparedStatement statement)
	{
		try (ResultSet result = statement.executeQuery())
		{
			if (result.next())
			{
				return new User(
						result.getInt("user_id"),
						result.getString("username"),
						result.getString("email"),
						result.getString("password_hash"),
						result.getString("salt"),
						result.getString("profile_picture_name"),
						result.getString("registration_date"));
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * Store user in database.
	 *
	 * @param user the user to store.
	 */
	@Override
	public void store(User user)
	{
		System.out.println("Storing user " + user + " into database...");
		Connection connection = ConnectionManager.getConnection();
		String sql = "INSERT INTO sponsorme.user(username, profile_picture_name, password_hash, email, registration_date, salt) values (?, ?, ?, ?, ?, ?);";
		
		try (PreparedStatement statement = connection.prepareStatement(sql))
		{
			statement.setString(1, user.username);
			statement.setString(2, user.profilePictureName);
			statement.setString(3, user.passwordHash);
			statement.setString(4, user.email);
			statement.setString(5, user.registrationDate);
			statement.setString(6, user.saltStr);
			
			statement.execute();
			System.out.println("Successfully stored user " + user);
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	public static UserStore getInstance()
	{
		if (instance == null)
			instance = new UserStore();
		return instance;
	}
}
