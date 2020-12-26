package sponsorme.model;

public class Perk
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
