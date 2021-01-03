package sponsorme.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sponsorme.store.ProjectStore;

@WebServlet("/delete-project")
public class DeleteProjectServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		ProjectStore.getInstance().delete(Integer.parseInt(request.getParameter("pid")));
		response.sendRedirect(request.getContextPath() + "/common/my-projects.jsp");
	}
}
