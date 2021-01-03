package sponsorme.model;

public class BackingInfo
{
	public final int perkId;
	public final String perkName;
	public final int backedAmount;
	
	public BackingInfo(int perkId, String perkName, int backedAmount)
	{
		this.perkId = perkId;
		this.perkName = perkName;
		this.backedAmount = backedAmount;
	}
}
