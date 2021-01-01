package sponsorme.store;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import sponsorme.ConnectionManager;
import sponsorme.model.Project;
import sponsorme.model.ProjectInfo;

public class ProjectStore extends DataStore<Project> implements AutoIncrementId
{
	private static ProjectStore instance;
	
	@Override
	public Project get(int projectId)
	{
		System.out.println("Retrieving project with project id " + projectId);
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
					String pictureName = result.getString("picture_name");
					String smallDescription = result.getString("small_description");
					String creationDate = result.getString("creation_date");
					Project.Status status = Project.Status.valueOf(result.getString("project_status").toUpperCase());
					String story = result.getString("story");
					String team = result.getString("team");
					
					Project project = new Project(projectId, projectName, creatorId, category, fundingGoal, pictureName, smallDescription, creationDate, status, story, team);
					System.out.println("Retrieved project " + projectName);
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
	
	public ProjectInfo getProjectInfoFromResult(int projectId)
	{
		System.out.println("Retrieving info for project with id " + projectId);
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
				ProjectInfo info = getProjectInfoFromResult(result);
				System.out.println("Retrieved info for project " + info.projectName);
				return info;
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public ArrayList<ProjectInfo> getTopProjectInfos()
	{
		System.out.println("Retrieving top 10 project infos");
		Connection connection = ConnectionManager.getConnection();
		String sql = "SELECT project.project_id, project_name, funding_goal, category, creator_id, u.username, count(*) AS backer_num, sum(backed_amount) AS backed_amount_sum "
				+ "FROM sponsorme.project LEFT JOIN sponsorme.backed_project "
				+ "ON project.project_id = backed_project.project_id "
				+ "LEFT JOIN sponsorme.user u ON u.user_id = project.creator_id "
				+ "GROUP BY project.project_id "
				+ "ORDER BY backer_num DESC "
				+ "LIMIT 10;";
		
		ArrayList<ProjectInfo> projectInfos = new ArrayList<>();
		try (Statement statement = connection.createStatement(); ResultSet result = statement.executeQuery(sql))
		{
			while (result.next())
			{
				ProjectInfo info = getProjectInfoFromResult(result);
				System.out.println("Retrieved info for project " + info.projectName);
				projectInfos.add(info);
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		return projectInfos;
	}
	
	private ProjectInfo getProjectInfoFromResult(ResultSet result) throws SQLException
	{
		int projectId = result.getInt("project_id");
		String projectName = result.getString("project_name");
		int fundingGoal = (int)(result.getFloat("funding_goal")*100);
		Project.Category category = Project.Category.valueOf(result.getString("category").toUpperCase());
		int creatorId = result.getInt("creator_id");
		String creatorUsername = result.getString("username");
		int backerNum = result.getInt("backer_num");
		int backedAmount = result.getInt("backed_amount_sum");
		
		ProjectInfo info = new ProjectInfo(projectId, projectName, fundingGoal, creatorId, creatorUsername, category, backerNum, backedAmount);
		return info;
	}
	
	@Override
	public void store(Project project)
	{
//		Connection connection = ConnectionManager.getConnection();
//		PreparedStatement statement = connection.prepareStatement(
//				"INSERT INTO sponsorme.project (project_name, funding_goal, small_description, category, creator_id, creation_date, team)"
//				+ "VALUES (?, ?, ?, ?, ?, ?, ?);"
//		);
//		statement.setString(1, project.projectName);
//		statement.setInt(2, project.fundingGoal);
//		statement.setString(3, project.smallDescription);
//		statement.setString(4, project.category.toString().toLowerCase());
//		statement.setInt(5, project.creatorId);
//		statement.setString(6, simpleDateFormat.format(project.date));
//		statement.setString(7, project.team);
//		
//		statement.executeQuery();
	}
	
	public static ProjectStore getInstance()
	{
		if (instance == null)
			instance = new ProjectStore();
		return instance;
	}
}
