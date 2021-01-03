package sponsorme.store;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import sponsorme.ConnectionManager;
import sponsorme.model.BackingInfo;
import sponsorme.model.Perk;

public class PerkStore extends DataStore<Perk> implements AutoIncrementId
{
	private static PerkStore instance;
	
	@Override
	public Perk get(int key)
	{
		return null;
	}
	
	public ArrayList<Perk> getPerkForProject(int projectId)
	{
		System.out.println("[PerkStore] Retrieving perk for project with id " + projectId);
		Connection connection = ConnectionManager.getConnection();
		String sql = "SELECT p.perk_id, title, price, description, count(*) AS backer_count, sum(backed_amount) as backed_amount_sum " 
				+ "FROM sponsorme.perk p "
				+ "LEFT JOIN sponsorme.backed_project bp ON p.perk_id = bp.perk_id AND p.project_id = bp.project_id "
				+ "WHERE p.project_id = ? "
				+ "GROUP BY p.perk_id";
		
		ArrayList<Perk> perks = new ArrayList<>();
		try (PreparedStatement statement = connection.prepareStatement(sql))
		{
			statement.setInt(1, projectId);
			try (ResultSet result = statement.executeQuery())
			{
				while (result.next())
				{
					int perkId = result.getInt("perk_id");
					String title = result.getString("title");
					int price = (int)(result.getFloat("price")*100);
					String description = result.getString("description");
					int backedAmount = (int)(result.getFloat("backed_amount_sum")*100);
					int backerNum = backedAmount == 0 ? 0 : result.getInt("backer_count");
					
					System.out.println("[PerkStore] " + title);
					perks.add(new Perk(perkId, projectId, title, price, description, backerNum));
				}
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		return perks;
	}
	
	public BackingInfo getBackingInfoForUser(int userId)
	{
		return null;
//		System.out.println("[PerkStore] Retrieving backing info of user with id " + userId);
//		Connection connection = ConnectionManager.getConnection();
//		String sql = "SELECT * "
//				+ "FROM sponsorme.backed_project bp "
//				+ "WHERE bp.project_id = ? ";
//		
//		ArrayList<Perk> perks = new ArrayList<>();
//		try (PreparedStatement statement = connection.prepareStatement(sql))
//		{
//			statement.setInt(1, projectId);
//			try (ResultSet result = statement.executeQuery())
//			{
//				while (result.next())
//				{
//					int perkId = result.getInt("perk_id");
//					String title = result.getString("title");
//					int price = (int)(result.getFloat("price")*100);
//					String description = result.getString("description");
//					int backerNum = result.getInt("backer_count");
//					
//					System.out.println("[PerkStore] " + title);
//					perks.add(new Perk(perkId, projectId, title, price, description, backerNum));
//				}
//			}
//		}
//		catch (SQLException e)
//		{
//			e.printStackTrace();
//		}
//		return perks;
	}
	
	@Override
	public String getNewIdQuery()
	{
		return "SELECT max(perk_id) AS max_id FROM sponsorme.perk;";
	}
	
	@Override
	public void store(Perk perk)
	{
		System.out.println("[PerkStore] Storing perk " + perk);
		Connection connection = ConnectionManager.getConnection();
		String sql = "INSERT INTO sponsorme.perk(perk_id, project_id, title, price, DESCRIPTION) "
				+ "VALUES (?, ?, ?, ?, ?)";
		
		try (PreparedStatement statement = connection.prepareStatement(sql))
		{
			statement.setInt(1, perk.id);
			statement.setInt(2, perk.projectId);
			statement.setString(3, perk.title);
			statement.setFloat(4, perk.price/100F);
			statement.setString(5, perk.description);
			statement.execute();
			
			System.out.println("[PerkStore] Successfully stored perk " + perk);
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	public static PerkStore getInstance()
	{
		if (instance == null)
			instance = new PerkStore();
		return instance;
	}
}
