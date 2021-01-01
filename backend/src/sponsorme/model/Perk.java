package sponsorme.model;

import java.io.Serializable;

public class Perk implements Serializable
{
	public final int projectId;
	public final String title;
	public final int price;
	public final String description;
	
	public Perk(int projectId, String title, int price, String description)
	{
		this.projectId = projectId;
		this.title = title;
		this.price = price;
		this.description = description;
	}
}
