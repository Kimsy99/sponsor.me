package sponsorme.store;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import sponsorme.ConnectionManager;
import sponsorme.model.Perk;

public class PerkStore extends DataStore<Perk> implements AutoIncrementId
{
	private static PerkStore instance;
	
	@Override
	public Perk get(int key)
	{
		return null;
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
