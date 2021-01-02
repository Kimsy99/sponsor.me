package sponsorme.servlet;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sponsorme.model.Campaign;
import sponsorme.model.Faq;
import sponsorme.model.Project;
import sponsorme.model.ProjectPicture;
import sponsorme.store.FaqStore;
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
		ProjectPicture picture = new ProjectPicture(projectId, pictureName);
		String pDescription = request.getParameter("project-description");
		Campaign.Status status = Campaign.Status.valueOf(request.getParameter("stage").toUpperCase());
		String story = request.getParameter("story");
		Campaign campaign = new Campaign(status, story);
		String teamDetails = request.getParameter("team");
		
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String creationDate = now.format(formatter);
		
		Project project = new Project(projectId, pname, uid, category, fundingGoal, picture, pDescription, creationDate, campaign, teamDetails);
		
		
		int questionId = FaqStore.getInstance().getNewId();
		String[] questions = request.getParameterValues("question");
		String[] answers = request.getParameterValues("answer");
		ArrayList<Faq> faqs = new ArrayList<>();
		
		for (int i = 0; i < questions.length; i++)
		{
			String question = questions[i].trim();
			String answer = answers[i].trim();
			if (!question.isEmpty() || !answer.isEmpty())
				faqs.add(new Faq(questionId + i, projectId, question, answer));
		}
		
		System.out.println("[NewProjectServlet] Project " + project + " created");
		request.getSession().setAttribute("project", project);
		request.getSession().setAttribute("faqs", faqs);
		response.sendRedirect("./common/new-project-options.jsp");
	}
}
