package sponsorme.model;

public class ProjectInfo
{
	public final int projectId;
	public final String projectName;
	public final int fundingGoal;
	public final int creatorId;
	public final String creatorUsername;
	public final Project.Category category;
	public final int backerNum;
	public final int backedAmount;
	
	public ProjectInfo(int projectId, String projectName, int fundingGoal, int creatorId, String creatorUsername, Project.Category category, int backerNum, int backedAmount)
	{
		this.projectId = projectId;
		this.projectName = projectName;
		this.fundingGoal = fundingGoal;
		this.creatorId = creatorId;
		this.creatorUsername = creatorUsername;
		this.category = category;
		this.backerNum = backerNum;
		this.backedAmount = backedAmount;
	}
	
	public String getFormattedFundingGoal()
	{
		return String.format("%.2f", fundingGoal/100F);
	}
	
	public String getFormattedBackedAmount()
	{
		return String.format("%.2f", backedAmount/100F);
	}
}
