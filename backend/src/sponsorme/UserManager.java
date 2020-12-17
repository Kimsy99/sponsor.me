package sponsorme;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Objects;

import org.jetbrains.annotations.NotNull;
import sponsorme.model.User;
import sponsorme.store.UserStore;
import sponsorme.util.MathHelper;

/**
 * Manages creation and deletion of users and handles authentication.
 *
 * @author Kenneth Tan
 */
public class UserManager
{
	private final UserStore users = new UserStore();
	
	/**
	 * Creates a user and stores it in database. If the user already exists, return an error.
	 * @param username user's username
	 * @param password user's typed in password
	 * @return True if user is successfully created, false otherwise.
	 */
	public boolean createUser(String username, String password)
	{
		if (users.get(username) != null)
		{
			System.err.println("User " + username + " already exists!");
			return false;
		}
		byte[] salt = generateSalt();
		User user = new User(username, hashPassword(password, salt), MathHelper.byteArrayToHexString(salt));
		users.store(user);
		return true;
	}
	
	/**
	 * Validates a user's login password by checking if the hashes of the passwords match.
	 * @param username user's username
	 * @param password user's typed in password
	 * @return True if typed in password matches the one in the database, false otherwise.
	 */
	public boolean validateUser(String username, String password)
	{
		User user = users.get(username);
		if (user == null)
		{
			System.err.println("User " + username + " does not exist!");
			return false;
		}
		return hashPassword(password, user.salt).equals(user.passwordHash);
	}
	
	/**
	 * Hash a password using SHA-512 algorithm.
	 * @param password password to be hashed
	 * @param salt     the salt
	 * @return A String representation of the hashed password.
	 */
	@NotNull
	private String hashPassword(String password, byte[] salt)
	{
		String hash = null;
		try
		{
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			md.update(salt);
			byte[] hashedBytes = md.digest(password.getBytes());
			hash = MathHelper.byteArrayToHexString(hashedBytes);
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
	@NotNull
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
}
