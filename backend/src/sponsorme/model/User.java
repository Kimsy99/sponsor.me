package sponsorme.model;

import sponsorme.util.MathHelper;

/**
 * Model of a user.
 *
 * @author Kenneth Tan
 */
public class User
{
	public final String username;
	public final String passwordHash;
	public final byte[] salt;
	
	public User(String username, String passwordHash, String saltStr)
	{
		this.username = username;
		this.passwordHash = passwordHash;
		this.salt = MathHelper.hexStringToByteArray(saltStr);
	}
}
