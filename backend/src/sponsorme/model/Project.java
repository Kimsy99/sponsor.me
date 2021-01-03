package sponsorme.model;

import java.io.Serializable;

public class Project implements Serializable
{
	public final int id;
	public final String name;
	public final int creatorId;
	public final String creatorUsername;
	public final Category category;
	public final int fundingGoal;
	public final ProjectPicture picture;
	public final String smallDescription;
	public final String creationDate;
	public final Campaign campaign;
	public final String team;
	public final int backerNum;
	public final int backedAmount;
	
	public Project(int id, String name, int creatorId, String creatorUsername, Category category, int fundingGoal, ProjectPicture picture,
			String smallDescription, String creationDate, Campaign campaign, String team, int backerNum, int backedAmount)
	{
		this.id = id;
		this.name = name;
		this.creatorId = creatorId;
		this.creatorUsername = creatorUsername;
		this.category = category;
		this.fundingGoal = fundingGoal;
		this.picture = picture;
		this.smallDescription = smallDescription;
		this.creationDate = creationDate;
		this.campaign = campaign;
		this.team = team;
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
	
	public int getFundingPercentage()
	{
		return (int)((float)backedAmount/fundingGoal*100);
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
		OTHERS;
		
		@Override
		public String toString()
		{
			return super.toString().toLowerCase();
		}
		
		public String getDisplayName()
		{
			String name = super.toString();
			return Character.toUpperCase(name.charAt(0)) + name.substring(1).toLowerCase();
		}
	}
}
