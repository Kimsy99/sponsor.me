package sponsorme.model;

import java.io.Serializable;

import sponsorme.Utils;

/**
 * Model of a user.
 *
 * @author Kenneth Tan
 */
public class User implements Serializable
{
	public final int id;
	public final String username;
	public final String email;
	public final String passwordHash;
	public final String saltStr;
	public final String profilePictureName;
	public final String registrationDate;
	
	public User(String username, String email, String passwordHash, String saltStr, String profilePictureName, String registrationDate)
	{
		this(0, username, email, passwordHash, saltStr, profilePictureName, registrationDate);
	}
	
	public User(int id, String username, String email, String passwordHash, String saltStr, String profilePictureName, String registrationDate)
	{
		this.id = id;
		this.username = username;
		this.email = email;
		this.passwordHash = passwordHash;
		this.saltStr = saltStr;
		this.profilePictureName = profilePictureName;
		this.registrationDate = registrationDate;
	}
	
	@Override
	public String toString()
	{
		return username + " (ID = " + id + ")";
	}
	
	public boolean verifyPassword(String password)
	{
		return Utils.hashPassword(password, Utils.hexStringToByteArray(saltStr)).equals(passwordHash);
	}
}
