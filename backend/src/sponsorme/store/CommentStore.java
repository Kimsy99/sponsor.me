package sponsorme.store;

import sponsorme.model.Project;

public class CommentStore extends DataStore<Project> implements AutoIncrementId
{
	private static CommentStore instance;
	
//	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	
	@Override
	public Project get(int key)
	{
		return null;
	}
	
	@Override
	public String getNewIdQuery()
	{
		return "SELECT max(project_id) AS max_id FROM sponsorme.project;";
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
	
	public static CommentStore getInstance()
	{
		if (instance == null)
			instance = new CommentStore();
		return instance;
	}
}
