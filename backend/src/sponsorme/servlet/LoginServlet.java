package sponsorme.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sponsorme.model.User;
import sponsorme.store.UserStore;

@WebServlet("/login")
public class LoginServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		System.out.println("Logging in with username=" + username + " password=" + password);
		
		boolean validated = false;
		User user = UserStore.getInstance().get(username);
		if (user != null && user.verifyPassword(password))
			validated = true;
		
		if (validated)
		{
			session.setAttribute("username", username);
			session.setAttribute("uid", user.id);
			response.sendRedirect("index.jsp");
		}
		else
		{
			request.setAttribute("error_message", "Username or password is incorrect");
			request.getRequestDispatcher("/common/sign-in-sign-up.jsp").forward(request, response);
		}
	}
}
