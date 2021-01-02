package sponsorme.store;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import sponsorme.ConnectionManager;
import sponsorme.model.Campaign;
import sponsorme.model.Project;
import sponsorme.model.ProjectBackingInfo;
import sponsorme.model.ProjectPicture;

public class ProjectStore extends DataStore<Project> implements AutoIncrementId
{
	private static ProjectStore instance;
	
	@Override
	public Project get(int projectId)
	{
		System.out.println("[ProjectStore] Retrieving project with project id " + projectId);
		Connection connection = ConnectionManager.getConnection();
		String sql = "SELECT p.project_id, project_name, creator_id, category, funding_goal, picture_name, small_description, creation_date, project_status, story, team\n"
				+ "FROM sponsorme.project p LEFT JOIN sponsorme.campaign c "
				+ "ON p.project_id = c.project_id "
				+ "LEFT JOIN sponsorme.project_picture pp "
				+ "ON p.project_id = pp.project_id "
				+ "WHERE p.project_id = ?;";
		
		try (PreparedStatement statement = connection.prepareStatement(sql))
		{
			statement.setInt(1, projectId);
			try (ResultSet result = statement.executeQuery())
			{
				if (result.next())
				{
					String projectName = result.getString("project_name");
					int creatorId = result.getInt("creator_id");
					Project.Category category = Project.Category.valueOf(result.getString("category").toUpperCase());
					int fundingGoal = (int)(result.getFloat("funding_goal")*100);
					ProjectPicture picture = new ProjectPicture(0, result.getString("picture_name"));
					String smallDescription = result.getString("small_description");
					String creationDate = result.getString("creation_date");
					
					Campaign.Status status = Campaign.Status.valueOf(result.getString("project_status").toUpperCase());
					String story = result.getString("story");
					Campaign campaign = new Campaign(status, story);
					
					String team = result.getString("team");
					
					Project project = new Project(projectId, projectName, creatorId, category, fundingGoal, picture, smallDescription, creationDate, campaign, team);
					System.out.println("[ProjectStore] Retrieved project " + projectName);
					return project;
				}
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public String getNewIdQuery()
	{
		return "SELECT max(project_id) AS max_id FROM sponsorme.project;";
	}
	
	public ProjectBackingInfo getProjectInfoFromResult(int projectId)
	{
		System.out.println("[ProjectStore] Retrieving info for project with id " + projectId);
		Connection connection = ConnectionManager.getConnection();
		String sql = "SELECT project.project_id, project_name, funding_goal, category, creator_id, u.username, count(*) AS backer_num, sum(backed_amount) AS backed_amount_sum "
				+ "FROM sponsorme.project LEFT JOIN sponsorme.backed_project "
				+ "ON project.project_id = backed_project.project_id "
				+ "LEFT JOIN sponsorme.user u ON u.user_id = project.creator_id "
				+ "WHERE project.project_id = ?";
		
		try (PreparedStatement statement = connection.prepareStatement(sql))
		{
			statement.setInt(1, projectId);
			try (ResultSet result = statement.executeQuery())
			{
				result.next();
				ProjectBackingInfo info = getProjectInfoFromResult(result);
				System.out.println("[ProjectStore] Retrieved info for project " + info.projectName);
				return info;
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public ArrayList<ProjectBackingInfo> getTopProjectInfos()
	{
		System.out.println("[ProjectStore] Retrieving top 10 project infos");
		Connection connection = ConnectionManager.getConnection();
		String sql = "SELECT project.project_id, project_name, funding_goal, category, creator_id, u.username, count(*) AS backer_num, sum(backed_amount) AS backed_amount_sum "
				+ "FROM sponsorme.project LEFT JOIN sponsorme.backed_project "
				+ "ON project.project_id = backed_project.project_id "
				+ "LEFT JOIN sponsorme.user u ON u.user_id = project.creator_id "
				+ "GROUP BY project.project_id "
				+ "ORDER BY backer_num DESC "
				+ "LIMIT 10;";
		
		ArrayList<ProjectBackingInfo> projectBackingInfos = new ArrayList<>();
		try (Statement statement = connection.createStatement(); ResultSet result = statement.executeQuery(sql))
		{
			while (result.next())
			{
				ProjectBackingInfo info = getProjectInfoFromResult(result);
				System.out.println("[ProjectStore] Retrieved info for project " + info.projectName);
				projectBackingInfos.add(info);
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		return projectBackingInfos;
	}
	
	private ProjectBackingInfo getProjectInfoFromResult(ResultSet result) throws SQLException
	{
		int projectId = result.getInt("project_id");
		String projectName = result.getString("project_name");
		int fundingGoal = (int)(result.getFloat("funding_goal")*100);
		Project.Category category = Project.Category.valueOf(result.getString("category").toUpperCase());
		int creatorId = result.getInt("creator_id");
		String creatorUsername = result.getString("username");
		int backerNum = result.getInt("backer_num");
		int backedAmount = result.getInt("backed_amount_sum");
		
		ProjectBackingInfo info = new ProjectBackingInfo(projectId, projectName, fundingGoal, creatorId, creatorUsername, category, backerNum, backedAmount);
		return info;
	}
	
	@Override
	public void store(Project project)
	{
		System.out.println("[ProjectStore] Storing project " + project.name);
		Connection connection = ConnectionManager.getConnection();
		
		try (
				PreparedStatement statement1 = connection.prepareStatement(
				"INSERT INTO sponsorme.project (project_id, project_name, funding_goal, small_description, category, creator_id, creation_date, team)"
						+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?);"
				);
				PreparedStatement statement2 = connection.prepareStatement(
						"INSERT INTO sponsorme.project_picture (project_id, picture_name) "
								+ "VALUES (?, ?);"
				);
				PreparedStatement statement3 = connection.prepareStatement(
						"INSERT INTO sponsorme.campaign(project_id, project_status, story) "
								+ "VALUES (?, ?, ?);"
				))
		{
			statement1.setInt(1, project.id);
			statement1.setString(2, project.name);
			statement1.setFloat(3, project.fundingGoal/100F);
			statement1.setString(4, project.smallDescription);
			statement1.setString(5, project.category.toString().toLowerCase());
			statement1.setInt(6, project.creatorId);
			statement1.setString(7, project.creationDate);
			statement1.setString(8, project.team);
			statement1.execute();
			
			statement2.setInt(1, project.id);
			statement2.setString(2, project.picture.name);
			statement2.execute();
			
			statement3.setInt(1, project.id);
			statement3.setString(2, project.campaign.status.toString().toLowerCase());
			statement3.setString(3, project.campaign.story);
			statement3.execute();
			
			System.out.println("[ProjectStore] Successfully stored project " + project);
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	public static ProjectStore getInstance()
	{
		if (instance == null)
			instance = new ProjectStore();
		return instance;
	}
}
