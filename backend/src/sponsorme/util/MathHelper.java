package sponsorme.util;

/**
 * Utility class containing useful functions.
 *
 * @author Kenneth Tan
 */
public class MathHelper
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
}
