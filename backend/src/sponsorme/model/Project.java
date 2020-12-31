package sponsorme.model;

public class Project
{
	public final int projectId;
	public final String projectName;
	public final int fundingGoal;
	public final String smallDescription;
	public final Category category;
	public final int creatorId;
	public final String date;
	public final String team;
	
	public Project(int projectId, String projectName, int fundingGoal, String smallDescription, Category category, int creatorId, String date, String team)
	{
		this.projectId = projectId;
		this.projectName = projectName;
		this.fundingGoal = fundingGoal;
		this.smallDescription = smallDescription;
		this.category = category;
		this.creatorId = creatorId;
		this.date = date;
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
}
