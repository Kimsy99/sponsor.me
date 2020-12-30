package sponsorme;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Objects;

/**
 * Utility class containing useful functions.
 *
 * @author Kenneth Tan
 */
public class Utils
{
	/**
	 * Converts a hexadecimal string into an array of bytes.
	 * @param s input hex string, like "E20A"
	 * @return Hex string converted into array of bytes.
	 */
	public static byte[] hexStringToByteArray(String s)
	{
		byte[] bytes = new byte[s.length()/2];
		for (int i = 0; i < s.length(); i += 2)
			bytes[i/2] = (byte)((Character.digit(s.charAt(i), 16) << 4) + Character.digit(s.charAt(i + 1), 16));
		return bytes;
	}
	
	/**
	 * Converts an array of bytes into a hex string.
	 * @param bytes input array of bytes
	 * @return Array of bytes converted into a hex string.
	 */
	public static String byteArrayToHexString(byte[] bytes)
	{
		StringBuilder builder = new StringBuilder();
		for (byte aByte : bytes)
			builder.append(Integer.toString((aByte & 0xFF) + 0x100, 16).substring(1));
		return builder.toString();
	}
	
	/**
	 * Hash a password using SHA-512 algorithm.
	 * @param password password to be hashed
	 * @param salt     the salt
	 * @return A String representation of the hashed password.
	 */
	public static String hashPassword(String password, byte[] salt)
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
	public static byte[] generateSalt()
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
