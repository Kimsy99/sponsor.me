package sponsorme.model;

import java.io.Serializable;

public class Project implements Serializable
{
	public final int id;
	public final String name;
	public final int creatorId;
	public final Category category;
	public final int fundingGoal;
	public final String pictureName;
	public final String smallDescription;
	public final String creationDate;
	public final Status status;
	public final String story;
	public final String team;
	
	public Project(int id, String name, int creatorId, Category category, int fundingGoal, String pictureName,
			String smallDescription, String creationDate, Status status, String story, String team)
	{
		this.id = id;
		this.name = name;
		this.creatorId = creatorId;
		this.category = category;
		this.fundingGoal = fundingGoal;
		this.pictureName = pictureName;
		this.smallDescription = smallDescription;
		this.creationDate = creationDate;
		this.status = status;
		this.story = story;
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
	
	public enum Status
	{
		CONCEPT,
		PROTOTYPE,
		PRODUCTION,
		SHIPPING
	}
}
