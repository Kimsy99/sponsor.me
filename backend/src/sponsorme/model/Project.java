package sponsorme.model;

import java.io.Serializable;

public class Project implements Serializable
{
	public final int id;
	public final String name;
	public final int creatorId;
	public final Category category;
	public final int fundingGoal;
	public final ProjectPicture picture;
	public final String smallDescription;
	public final String creationDate;
	public final Campaign campaign;
	public final String team;
	
	public Project(int id, String name, int creatorId, Category category, int fundingGoal, ProjectPicture picture,
			String smallDescription, String creationDate, Campaign campaign, String team)
	{
		this.id = id;
		this.name = name;
		this.creatorId = creatorId;
		this.category = category;
		this.fundingGoal = fundingGoal;
		this.picture = picture;
		this.smallDescription = smallDescription;
		this.creationDate = creationDate;
		this.campaign = campaign;
		this.team = team;
	}
	
	@Override
	public String toString()
	{
		return name + " (ID = " + id + ")";
	}
	
	public enum Category
	{
		TECH,
		DESIGN,
		FILM,
		ART,
		PUBLISH,
		FOOD,
		GAME,
		OTHERS
	}
}
