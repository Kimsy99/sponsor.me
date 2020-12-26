import java.util.Scanner;

import sponsorme.UserManager;

public class TestDriver
{
	private static final UserManager USER_MANAGER = new UserManager();
	
	public static void main(String[] args)
	{
		System.out.println("Welcme to test driver!\n" +
						   "This is to test drive the backend.\n" +
		 				   "Type some commands to begin.\n" +
						   "Examples:\n" +
						   "\tcreate <username> <password> <retype password> - create user with username and password\n" +
						   "\tlogin <username> <password> - validates user");
		while (true)
		{
			try
			{
				System.out.print("> ");
				Scanner scanner = new Scanner(System.in);
				String inputLine = scanner.nextLine();
				
				String[] inputs = inputLine.split(" ", 2);
				String[] inputArgs = inputs.length == 2 ? inputs[1].split(" ") : null;
				
				parseCommand(inputs[0], inputArgs);
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
		}
	}
	
	private static void parseCommand(String commandName, String[] args)
	{
//		if (commandName.equals("create"))
//		{
//			String username = args[0];
//			String password = args[1];
//			String retypedPassword = args[2];
//			if (!password.equals(retypedPassword))
//			{
//				System.out.println("Two passwords do not match!");
//				return;
//			}
//			if (USER_MANAGER.createUser(username, password))
//				System.out.println("Successfully created user " + username + "!");
//		}
//		else if (commandName.equals("login"))
//		{
//			String username = args[0];
//			String password = args[1];
//			if (USER_MANAGER.validateUser(username, password))
//				System.out.println(username + " validated!");
//			else
//				System.out.println("Incorrect password");
//		}
//		else
//			System.out.println("Unrecognized command \"" + commandName + "\"");
	}
}
