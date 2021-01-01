package sponsorme.servlet;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sponsorme.model.Project;
import sponsorme.store.ProjectStore;

@WebServlet("/new-project-options")
public class NewProjectServlet extends HttpServlet
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int projectId = ProjectStore.getInstance().getNewId();
		String pname = request.getParameter("pname");
		int uid = Integer.parseInt(request.getSession().getAttribute("uid").toString());
		Project.Category category = Project.Category.valueOf(request.getParameter("category").toUpperCase());
		int fundingGoal = (int)(Float.parseFloat(request.getParameter("target-amount"))*100);
		String pictureName = request.getParameter("img");
		String pDescription = request.getParameter("project-description");
		Project.Status status = Project.Status.valueOf(request.getParameter("stage").toUpperCase());
		String story = request.getParameter("image-text-box");
		String teamDetails = request.getParameter("image-text-box2");
		
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String creationDate = now.format(formatter);
		
		Project project = new Project(projectId, pname, uid, category, fundingGoal, pictureName, pDescription, creationDate, status, story, teamDetails);
		
		System.out.println("[NewProjectServlet] Project " + project + " created");
		request.getSession().setAttribute("project", project);
		response.sendRedirect("./common/new-project-options.jsp");
		
		String[] questions = request.getParameterValues("question");
		String[] answers = request.getParameterValues("answer");
//		request.getRequestDispatcher("/common/new-project-options.jsp").forward(request, response);
		
		//		request.getRequestDispatcher()
		
		//		Connection connection = ConnectionManager.getConnection();
		//		
		//		try
		//		{
		//			String sql = "insert into project(project_id,project_name, small_description, funding_goal, category, creation_date, team, creator_id) " + " values(?, ?, ? ,?,?,?,?,?)";
		//			PreparedStatement stm = connection.prepareStatement(sql);
		//			stm.setInt(1, project_id);
		//			stm.setString(2, pname);
		//			stm.setString(3, pDescription);
		//			stm.setFloat(4, targetAmount);
		//			stm.setString(5, category);
		//			stm.setString(6, cur_time);
		//			stm.setString(7, teamDetails);
		//			stm.setInt(8, (int)request.getSession().getAttribute("uid"));
		//			stm.execute();
		//		}
		//		catch (Exception ex)
		//		{
		//			ex.printStackTrace();
		//		}
		//		
		//		try
		//		{
		//			String sql = "insert into campaign(project_name, small_description, funding_goal, category, creation_date, team, creator_id) " + " values(?, ?, ? ,?,?,?,?)";
		//			PreparedStatement stm = connection.prepareStatement(sql);
		//			stm.setInt(1, project_id);
		//			stm.setString(2, stage);
		//			stm.setString(3, story);
		//			stm.execute();
		//		}
		//		catch (Exception ex)
		//		{
		//			ex.printStackTrace();
		//		}
		//		
		//		// insert faq
		//		String[] question = new String[10];
		//		String[] answer = new String[10];
		//		int count = 0;
		//		for (int i = 0; request.getParameter("question") != ""; ++i)
		//		{
		//			question[i] = request.getParameter("question");
		//			answer[i] = request.getParameter("answer");
		//			count++;
		//		}
		//		try
		//		{
		//			String sql = "insert into faq(project_id, questions, answer)" + "values(?,?,?)";
		//			PreparedStatement stm = connection.prepareStatement(sql);
		//			for (int i = 0; i < count; ++i)
		//			{
		//				stm.setInt(1, project_id);
		//				stm.setString(2, question[i]);
		//				stm.setString(3, answer[i]);
		//				stm.execute();
		//			}
		//		}
		//		catch (Exception ex)
		//		{
		//			ex.printStackTrace();
		//		}
		
		//		response.sendRedirect(
		//				"/backend_war_exploded/common/new-project-options.jsp?uid=" + request.getParameter("uid"));
	}
}
