package sponsorme.model;

import java.io.Serializable;

public class RewardItem implements Serializable
{
	public final int itemId;
	public final String itemName;
	public final int projectId;
	
	public RewardItem(int itemId, String itemName, int projectId)
	{
		this.itemId = itemId;
		this.itemName = itemName;
		this.projectId = projectId;
	}
}
