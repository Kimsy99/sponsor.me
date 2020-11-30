package sponsorme.store;

import java.util.HashMap;

import sponsorme.model.User;
import sponsorme.util.MathHelper;

/**
 * Data store for users.
 *
 * Handles actual retrieving and storing transactions with a database.
 *
 * @author Kenneth Tan
 */
public class UserStore extends DataStore<User>
{
	// TODO TEMP, hook up actual database
	private final HashMap<String, String> userPasswordHashMap = new HashMap<>();
	private final HashMap<String, String> userSaltMap = new HashMap<>();
	
	/**
	 * Retrieves a user.
	 * @param username the username of the user.
	 * @return Retrieved user from the database.
	 */
	@Override
	public User get(String username)
	{
		if (!userPasswordHashMap.containsKey(username)) // User does not exist
			return null;
		return new User(username, userPasswordHashMap.get(username), userSaltMap.get(username));
	}
	
	/**
	 * Store user in database.
	 * @param user the user to store.
	 */
	@Override
	public void store(User user)
	{
		userPasswordHashMap.put(user.username, user.passwordHash);
		userSaltMap.put(user.username, MathHelper.byteArrayToHexString(user.salt));
	}
}
