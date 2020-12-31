package sponsorme.model;

public class Campaign
{
	public final int projectId;
	public final ProjectStatus projectStatus;
	public final String story;
	
	public Campaign(int projectId, ProjectStatus projectStatus, String story)
	{
		this.projectId = projectId;
		this.projectStatus = projectStatus;
		this.story = story;
	}
	
	public enum ProjectStatus
	{
		CONCEPT,
		PROTOTYPE,
		PRODUCTION,
		SHIPPING
	}
}
