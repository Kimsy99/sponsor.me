package sponsorme.store;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import sponsorme.ConnectionManager;
import sponsorme.model.Faq;

public class FaqStore extends DataStore<Faq> implements AutoIncrementId
{
	private static FaqStore instance;
	
	@Override
	public Faq get(int key)
	{
		return null;
	}
	
	public ArrayList<Faq> getProjectFaqs(int projectId)
	{
		System.out.println("[FaqStore] Retrieving faqs with from project with id " + projectId);
		Connection connection = ConnectionManager.getConnection();
		String sql = "SELECT * FROM sponsorme.faq WHERE project_id = ?";
		
		ArrayList<Faq> faqs = new ArrayList<>();
		try (PreparedStatement statement = connection.prepareStatement(sql))
		{
			statement.setInt(1, projectId);
			try (ResultSet result = statement.executeQuery())
			{
				while (result.next())
				{
					int questionId = result.getInt("question_id");
					String question = result.getString("question");
					String answer = result.getString("answer");
					
					System.out.println("[FaqStore] " + question + " " + answer);
					faqs.add(new Faq(questionId, projectId, question, answer));
				}
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		return faqs;
	}
	
	@Override
	public String getNewIdQuery()
	{
		return "SELECT max(question_id) AS max_id FROM sponsorme.faq;";
	}
	
	@Override
	public void store(Faq faq)
	{
		System.out.println("[FaqStore] Storing faq " + faq);
		Connection connection = ConnectionManager.getConnection();
		String sql = "INSERT INTO sponsorme.faq(question_id, project_id, question, answer) "
				+ "VALUES (?, ?, ?, ?)";
		
		try (PreparedStatement statement = connection.prepareStatement(sql))
		{
			statement.setInt(1, faq.id);
			statement.setInt(2, faq.projectId);
			statement.setString(3, faq.question);
			statement.setString(4, faq.question);
			statement.execute();
			
			System.out.println("[FaqStore] Successfully stored faq " + faq);
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	public static FaqStore getInstance()
	{
		if (instance == null)
			instance = new FaqStore();
		return instance;
	}
}
