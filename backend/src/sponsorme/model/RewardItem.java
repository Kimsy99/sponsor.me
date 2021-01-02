package sponsorme.model;

import java.io.Serializable;

public class RewardItem implements Serializable
{
	public final int id;
	public final String name;
	public final int projectId;
	
	public RewardItem(int id, String name, int projectId)
	{
		this.id = id;
		this.name = name;
		this.projectId = projectId;
	}
	
	@Override
	public String toString()
	{
		return name + " (ID = " + id + ")";
	}
}
