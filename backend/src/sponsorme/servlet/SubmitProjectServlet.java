package sponsorme.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/new-project-submit")
public class SubmitProjectServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String[] perks = request.getParameterValues("perks-name");
		String[] descriptions = request.getParameterValues("comment");
		
		Map<String, String[]> map = request.getParameterMap();
		for (String s : map.keySet())
		{
			for (String s1 : map.get(s))
				System.out.println(s + "->" + s1);
			System.out.println();
		}
	}
}
