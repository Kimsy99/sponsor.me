package sponsorme.model;

import sponsorme.Utils;

import java.io.Serializable;

/**
 * Model of a user.
 *
 * @author Kenneth Tan
 */
public class Admin implements Serializable
{
	public final int id;
	public final String username;
	public final String email;
	public final String passwordHash;
	public final String saltStr;

	public Admin(int id, String username, String email, String passwordHash, String saltStr)
	{
		this.id = id;
		this.username = username;
		this.email = email;
		this.passwordHash = passwordHash;
		this.saltStr = saltStr;
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
