package sponsorme.model;

import java.io.Serializable;

public class Project implements Serializable
{
	public final int projectId;
	public final String projectName;
	public final int creatorId;
	public final Category category;
	public final int fundingGoal;
	public final String pictureName;
	public final String smallDescription;
	public final String creationDate;
	public final Status status;
	public final String story;
	public final String team;
	
	public Project(int projectId, String projectName, int creatorId, Category category, int fundingGoal, String pictureName,
			String smallDescription, String creationDate, Status status, String story, String team)
	{
		this.projectId = projectId;
		this.projectName = projectName;
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
	
	public String getProjectName()
	{
		return projectName;
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
