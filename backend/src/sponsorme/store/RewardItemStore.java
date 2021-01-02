package sponsorme.store;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import sponsorme.ConnectionManager;
import sponsorme.model.Perk;
import sponsorme.model.RewardItem;

public class RewardItemStore extends DataStore<RewardItem> implements AutoIncrementId
{
	private static RewardItemStore instance;
	
	@Override
	public RewardItem get(int key)
	{
		return null;
	}
	
	@Override
	public String getNewIdQuery()
	{
		return "SELECT max(item_id) AS max_id FROM sponsorme.item;";
	}
	
	@Override
	public void store(RewardItem item)
	{
		System.out.println("[RewardItemStore] Storing reward item " + item);
		Connection connection = ConnectionManager.getConnection();
		String sql = "INSERT INTO sponsorme.item(item_id, item_name, project_id) "
				+ "VALUES (?, ?, ?)";
		
		try (PreparedStatement statement = connection.prepareStatement(sql))
		{
			statement.setInt(1, item.id);
			statement.setString(2, item.name);
			statement.setInt(3, item.projectId);
			statement.execute();
			
			System.out.println("[RewardItemStore] Successfully stored reward item " + item);
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	public void linkRewardToPerk(Perk perk, RewardItem item)
	{
		System.out.println("[RewardItemStore] Linking " + item + " to perk " + perk);
		Connection connection = ConnectionManager.getConnection();
		String sql = "INSERT INTO sponsorme.reward_item(perk_id, item_id) "
				+ "VALUES (?, ?)";
		
		try (PreparedStatement statement = connection.prepareStatement(sql))
		{
			statement.setInt(1, perk.id);
			statement.setInt(2, item.id);
			statement.execute();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	public static RewardItemStore getInstance()
	{
		if (instance == null)
			instance = new RewardItemStore();
		return instance;
	}
}
