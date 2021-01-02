package sponsorme.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sponsorme.model.Project;
import sponsorme.model.RewardItem;
import sponsorme.store.RewardItemStore;

@WebServlet("/new-project-perks")
public class AddRewardItemServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int projectId = ((Project)request.getSession().getAttribute("project")).id;
		String[] stuff = request.getParameterValues("option-name");
		int rewardItemId = RewardItemStore.getInstance().getNewId();
		
		ArrayList<RewardItem> rewardItems = new ArrayList<>();
		for (int i = 0; i < stuff.length - 1; i++)
		{
			if (!stuff[i + 1].isEmpty())
				rewardItems.add(new RewardItem(rewardItemId + rewardItems.size(), stuff[i + 1], projectId));
		}
		
		request.getSession().setAttribute("reward_items", rewardItems);
		response.sendRedirect("./common/new-project-perks.jsp");
	}
}
