package sponsorme.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sponsorme.model.Faq;
import sponsorme.model.Perk;
import sponsorme.model.Project;
import sponsorme.model.RewardItem;
import sponsorme.store.FaqStore;
import sponsorme.store.PerkStore;
import sponsorme.store.ProjectStore;
import sponsorme.store.RewardItemStore;

@WebServlet("/new-project-submit")
public class SubmitProjectServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		Project project = (Project)request.getSession().getAttribute("project");
		ProjectStore.getInstance().store(project); // Store project in database
		
		ArrayList<RewardItem> rewardItems = (ArrayList<RewardItem>)request.getSession().getAttribute("reward_items");
		
		// Map reward items to their names
		HashMap<String, RewardItem> nameToRewardItemMap = new HashMap<>();
		
		for (RewardItem rewardItem : rewardItems)
		{
			nameToRewardItemMap.put(rewardItem.name, rewardItem);
			RewardItemStore.getInstance().store(rewardItem);
		}
		
		// Extract perk and reward item data from form
		String[] perks = request.getParameterValues("perks-name");
		String[] descriptions = request.getParameterValues("comment");
		String[] prices = request.getParameterValues("price");
		String[] rewardItemCount = request.getParameterValues("count");
		String[] rewardItemNames = request.getParameterValues("reward-item-name");
		
		for (int i = 0, j = 0; i < perks.length; i++)
		{
			if (!perks[i].isEmpty())
			{
				String perkName = perks[i];
				String description = descriptions[i];
				int price = (int)(Float.parseFloat(prices[i])*100);
				int perkRewardItemCount = Integer.parseInt(rewardItemCount[i]);
				
				// Store perks
				Perk perk = new Perk(PerkStore.getInstance().getNewId(), project.id, perkName, price, description);
				PerkStore.getInstance().store(perk);
				
				// Store reward items
				for (int k = 0; k < perkRewardItemCount; k++, j++)
				{
					RewardItem perkRewardItem = nameToRewardItemMap.get(rewardItemNames[j]);
					RewardItemStore.getInstance().linkRewardToPerk(perk, perkRewardItem);
				}
			}
		}
		
		// Save FAQs
		ArrayList<Faq> faqs = (ArrayList<Faq>)request.getSession().getAttribute("faqs");
		for (Faq faq : faqs)
			FaqStore.getInstance().store(faq);
	}
}
