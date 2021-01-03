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
import sponsorme.model.ProjectPicture;

public class ProjectStore extends DataStore<Project> implements AutoIncrementId
{
	private static ProjectStore instance;
	
	@Override
	public Project get(int projectId)
	{
		System.out.println("[ProjectStore] Retrieving project with project id " + projectId);
		return getProjectsWithCondition("WHERE p.project_id = " + projectId).get(0);
	}
	
	public ArrayList<Project> getTopProjects(int limit, boolean shouldOrder)
	{
		System.out.println("[ProjectStore] Retrieving " + (limit == -1 ? "all" : limit) + (limit == 1 ? " project" : " projects"));
		return getProjectsWithCondition("GROUP BY p.project_id "
				+ (shouldOrder ? "ORDER BY backer_num DESC " : "")
				+ (limit == -1 ? ";" : "LIMIT 10;"));
	}
	
	public ArrayList<Project> getProjectsByUser(int userId)
	{
		System.out.println("[ProjectStore] Retrieving all projects by user with id " + userId);
		return getProjectsWithCondition("WHERE p.creator_id = " + userId + " GROUP BY p.project_id");
	}
	
	public ArrayList<Project> getBackedProjectsByUser(int userId)
	{
		System.out.println("[ProjectStore] Retrieving projects backed by user with id " + userId);
		return getProjectsWithCondition("WHERE bp.backer_id = " + userId + " GROUP BY p.project_id");
	}
	
	public ArrayList<Project> findProjectsContainingString(String str)
	{
		Connection connection = ConnectionManager.getConnection();
		String sql = "SELECT p.project_id, project_name, creator_id, username, category, funding_goal, picture_name, small_description, creation_date, project_status, story, team, count(*) AS backer_num, sum(backed_amount) AS backed_amount_sum "
				+ "FROM sponsorme.project p "
				+ "LEFT JOIN sponsorme.user u ON p.creator_id = u.user_id "
				+ "LEFT JOIN sponsorme.campaign c ON p.project_id = c.project_id "
				+ "LEFT JOIN sponsorme.project_picture pp ON p.project_id = pp.project_id "
				+ "LEFT JOIN sponsorme.backed_project bp on p.project_id = bp.project_id "
				+ "WHERE p.project_name LIKE ? "
				+ "GROUP BY c.project_id";
		
		ArrayList<Project> projects = new ArrayList<>();
		try (PreparedStatement statement = connection.prepareStatement(sql))
		{
			statement.setString(1, "%" + str + "%");
			System.out.println(statement.toString());
			try (ResultSet result = statement.executeQuery())
			{
				while (result.next())
				{
					Project project = getProjectFromResult(result);
					System.out.println("[ProjectStore] Retrieved project " + project);
					projects.add(project);
				}
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		return projects;
	}
	
	private ArrayList<Project> getProjectsWithCondition(String sqlCondition)
	{
		Connection connection = ConnectionManager.getConnection();
		String sql = "SELECT p.project_id, project_name, creator_id, username, category, funding_goal, picture_name, small_description, creation_date, project_status, story, team, count(*) AS backer_num, sum(backed_amount) AS backed_amount_sum "
				+ "FROM sponsorme.project p "
				+ "LEFT JOIN sponsorme.user u ON p.creator_id = u.user_id "
				+ "LEFT JOIN sponsorme.campaign c ON p.project_id = c.project_id "
				+ "LEFT JOIN sponsorme.project_picture pp ON p.project_id = pp.project_id "
				+ "LEFT JOIN sponsorme.backed_project bp on p.project_id = bp.project_id "
				+ sqlCondition;
		
		ArrayList<Project> projects = new ArrayList<>();
		try (Statement statement = connection.createStatement())
		{
			try (ResultSet result = statement.executeQuery(sql))
			{
				while (result.next())
				{
					Project project = getProjectFromResult(result);
					System.out.println("[ProjectStore] Retrieved project " + project);
					projects.add(project);
				}
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		return projects;
	}
	
	private Project getProjectFromResult(ResultSet result) throws SQLException
	{
		int projectId = result.getInt("project_id");
		String projectName = result.getString("project_name");
		int creatorId = result.getInt("creator_id");
		String creatorUsername = result.getString("username");
		Project.Category category = Project.Category.valueOf(result.getString("category").toUpperCase());
		int fundingGoal = (int)(result.getFloat("funding_goal")*100);
		ProjectPicture picture = new ProjectPicture(0, result.getString("picture_name"));
		String smallDescription = result.getString("small_description");
		String creationDate = result.getString("creation_date");
		Campaign.Status status = Campaign.Status.valueOf(result.getString("project_status").toUpperCase());
		String story = result.getString("story");
		Campaign campaign = new Campaign(status, story);
		String team = result.getString("team");
		int backedAmount = (int)(result.getFloat("backed_amount_sum")*100);
		int backerNum = backedAmount == 0 ? 0 : result.getInt("backer_num");
		
		return new Project(projectId, projectName, creatorId, creatorUsername, category, fundingGoal, picture, smallDescription, creationDate, campaign, team, backerNum, backedAmount);
	}
	
	@Override
	public String getNewIdQuery()
	{
		return "SELECT max(project_id) AS max_id FROM sponsorme.project;";
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
