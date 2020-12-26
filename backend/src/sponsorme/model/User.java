package sponsorme.model;

import java.sql.Date;

import sponsorme.Utils;

/**
 * Model of a user.
 *
 * @author Kenneth Tan
 */
public class User
{
	public final int id;
	public final String username;
	public final String email;
	public final String passwordHash;
	public final byte[] salt;
	public final String profilePictureName;
	public final Date registrationDate;
	
	public User(int id, String username, String email, String passwordHash, String saltStr, String profilePictureName, Date registrationDate)
	{
		this.id = id;
		this.username = username;
		this.email = email;
		this.passwordHash = passwordHash;
		salt = Utils.hexStringToByteArray(saltStr);
		this.profilePictureName = profilePictureName;
		this.registrationDate = registrationDate;
	}
}
