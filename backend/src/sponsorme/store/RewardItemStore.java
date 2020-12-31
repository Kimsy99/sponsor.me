package sponsorme.store;

import sponsorme.model.RewardItem;

public class RewardItemStore extends DataStore<RewardItem> implements AutoIncrementId
{
	private static RewardItemStore instance;
	
	@Override
	public RewardItem get(String key)
	{
		return null;
	}
	
	@Override
	public String getQueryNewIdSQL()
	{
		return "SELECT max(item_id) AS max_id FROM sponsorme.item;";
	}
	
	public void store(RewardItem value)
	{
		
	}
	
	public static RewardItemStore getInstance()
	{
		if (instance == null)
			instance = new RewardItemStore();
		return instance;
	}
}
