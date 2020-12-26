package sponsorme;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.sql.SQLException;
import java.util.Objects;

import sponsorme.model.User;
import sponsorme.store.UserStore;

/**
 * Manages creation and deletion of users and handles authentication.
 *
 * @author Kenneth Tan
 */
public class UserManager
{
	public static final String NO_SUCH_USER = "User does not exist!";
	
	private static UserManager instance;
	
	private final UserStore users = new UserStore();
	
	/**
	 * Creates a user and stores it in database. If the user already exists, return an error.
	 * @param username user's username
	 * @param password user's typed in password
	 * @return True if user is successfully created, false otherwise.
	 */
	public boolean createUser(String username, String password, String email)
	{
		//TODO
//		if (users.get(username) != null)
//		{
//			System.err.println("User " + username + " already exists!");
//			return false;
//		}
//		byte[] salt = generateSalt();
//		User user = new User(username, hashPassword(password, salt), Utils.byteArrayToHexString(salt));
//		users.store(user);
		return false;
	}
	
	/**
	 * Geta user object from the database.
	 * @param username the username
	 * @return The user with the specified username, null if the user does not exist.
	 * @throws SQLException
	 */
	public User getUser(String username) throws SQLException
	{
		return users.get(username);
	}
	
	/**
	 * Validates a user's login password by checking if the hashes of the passwords match.
	 * @param user the user
	 * @param password user's typed in password
	 * @return True if typed in password matches the one in the database, false otherwise.
	 */
	public boolean validateUser(User user, String password)
	{
		return hashPassword(password, user.salt).equals(user.passwordHash);
	}
	
	/**
	 * Hash a password using SHA-512 algorithm.
	 * @param password password to be hashed
	 * @param salt     the salt
	 * @return A String representation of the hashed password.
	 */
	private String hashPassword(String password, byte[] salt)
	{
		String hash = null;
		try
		{
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			md.update(salt);
			byte[] hashedBytes = md.digest(password.getBytes());
			hash = Utils.byteArrayToHexString(hashedBytes);
		}
		catch (NoSuchAlgorithmException e)
		{
			e.printStackTrace();
		}
		return Objects.requireNonNull(hash);
	}
	
	/**
	 * Generates a random salt using SHA1PRNG algorithm.
	 * @return A generated array of bytes representing the salt.
	 */
	private byte[] generateSalt()
	{
		byte[] salt = null;
		try
		{
			SecureRandom sr = SecureRandom.getInstance("SHA1PRNG");
			salt = new byte[255];
			sr.nextBytes(salt);
		}
		catch (NoSuchAlgorithmException e)
		{
			e.printStackTrace();
		}
		return Objects.requireNonNull(salt);
	}
	
	public static UserManager getInstance()
	{
		if (instance == null)
			instance = new UserManager();
		return instance;
	}
}
