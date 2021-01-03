package sponsorme.model;

import java.io.Serializable;

public class Perk implements Serializable
{
	public final int id;
	public final int projectId;
	public final String title;
	public final int price;
	public final String description;
	public final int backerNum;
	
	public Perk(int id, int projectId, String title, int price, String description)
	{
		this(id, projectId, title, price, description, 0);
	}
	
	public Perk(int id, int projectId, String title, int price, String description, int backerNum)
	{
		this.id = id;
		this.projectId = projectId;
		this.title = title;
		this.price = price;
		this.description = description;
		this.backerNum = backerNum;
	}
	
	public String getFormattedPrice()
	{
		return String.format("%.2f", price/100F);
	}
	
	@Override
	public String toString()
	{
		return title + " (ID = " + id + ")"; 
	}
}
