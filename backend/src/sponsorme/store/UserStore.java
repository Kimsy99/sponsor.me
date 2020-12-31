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
	 * Retrieves a user.
	 *
	 * @param username the username of the user.
	 * @return Retrieved user from the database.
	 */
	@Override
	public User get(String username)
	{
		Connection connection = ConnectionManager.getConnection();
		String sql = "SELECT * FROM sponsorme.user WHERE username = ? ;";
		
		try (PreparedStatement statement = connection.prepareStatement(sql))
		{
			statement.setString(1, username);
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
		//		userPasswordHashMap.put(user.username, user.passwordHash);
		//		userSaltMap.put(user.username, MathHelper.byteArrayToHexString(user.salt));
	}
	
	public static UserStore getInstance()
	{
		if (instance == null)
			instance = new UserStore();
		return instance;
	}
}
