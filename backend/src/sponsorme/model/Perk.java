package sponsorme.model;

import java.io.Serializable;

public class Perk implements Serializable
{
	public final int id;
	public final int projectId;
	public final String title;
	public final int price;
	public final String description;
	
	public Perk(int id, int projectId, String title, int price, String description)
	{
		this.id = id;
		this.projectId = projectId;
		this.title = title;
		this.price = price;
		this.description = description;
	}
	
	@Override
	public String toString()
	{
		return title + " (ID = " + id + ")"; 
	}
}
