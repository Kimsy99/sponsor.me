package sponsorme.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sponsorme.ConnectionManager;
import sponsorme.Utils;
import sponsorme.model.User;
import sponsorme.store.UserStore;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String username = request.getParameter("username-sign-up");
		String email = request.getParameter("email");
		String password = request.getParameter("password-sign-up");
		String confirmPassword = request.getParameter("confirm-password");
		
		boolean invalidInput = false;
		
		// Check password
		if (!password.equals(confirmPassword))
		{
			request.setAttribute("inconsistent_password", "Password and confirm password do not match.");
			invalidInput = true;
		}
		
		Connection connection = ConnectionManager.getConnection();
		try
		{
			// Check username
			User user = UserStore.getInstance().get(username);
			if (user != null) // User already exists
			{
				request.setAttribute("username_taken", "The username is taken, try another username.");
				invalidInput = true;
			}
			
			// Check email
			PreparedStatement preparedStatement = connection.prepareStatement("select * from sponsorme.user where email = ?;");
			preparedStatement.setString(1, email);
			ResultSet result = preparedStatement.executeQuery();
			if (result.next())
			{
				request.setAttribute("email_taken", "Already have an account? Alternatively, use a new email address to register new account");
				invalidInput = true;
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
			response.getWriter().println(e.toString());
		}
		
		if (invalidInput)
			request.getRequestDispatcher("/common/sign-in-sign-up.jsp").forward(request, response);
		else
		{
			// Information validated
			LocalDateTime now = LocalDateTime.now();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			String userRegistrationDate = now.format(formatter);
			
			byte[] salt = Utils.generateSalt();
			String passwordHash = Utils.hashPassword(password, salt);
			
			User newUser = new User(0, username, email, passwordHash, Utils.byteArrayToHexString(salt), "default_user_icon", userRegistrationDate);
			
			try
			{
				UserStore.getInstance().store(newUser);
				request.setAttribute("registeredSuccessfully", "true");
				request.getRequestDispatcher("/common/sign-in-sign-up.jsp").forward(request, response);
			}
			catch (Exception e)
			{
				e.printStackTrace();
				response.getWriter().println(e.toString());
			}
		}
		
	}
}
