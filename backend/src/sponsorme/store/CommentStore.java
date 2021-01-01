package sponsorme.store;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import sponsorme.ConnectionManager;
import sponsorme.model.Comment;

public class CommentStore extends DataStore<Comment> implements AutoIncrementId
{
	private static CommentStore instance;
	
	@Override
	public Comment get(int key)
	{
		return null;
//		String sql = "select comment_id, comment.user_id, comment, parent_comment, comment_date as cd, username, profile_picture_name "
//				+ "from sponsorme.comment left join sponsorme.user "
//				+ "on comment.user_id = user.user_id "
//				+ "where project_id = " + request.getParameter(\"pid\")+\" and parent_comment is null\";"
	}
	
	public void getCommentTree(int projectId)
	{
		Connection connection = ConnectionManager.getConnection();
		String sql = "SELECT c.comment_id, c.project_id, c.user_id, u.username, u.profile_picture_name, c.comment, c.parent_comment, c.comment_date " 
				+ "FROM sponsorme.comment c LEFT JOIN sponsorme.user u "
				+ "ON c.user_id = u.user_id "
				+ "WHERE project_id = ?";
		
		ArrayList<ArrayList<Comment>> commentTree = new ArrayList<>();
		HashMap<Comment, ArrayList<Comment>> commentToGroupMap = new HashMap<>();
		try (PreparedStatement statement = connection.prepareStatement(sql))
		{
			statement.setInt(1, projectId);
			try (ResultSet result = statement.executeQuery())
			{
				int commentId = result.getInt("comment_id");
				int userId = result.getInt("user_id");
				String username = result.getString("username");
				String profilePictureName = result.getString("profile_picture_name");
				String commentStr = result.getString("comment");
				int parentCommentId = result.getInt("parent_comment");
				String commentDate = result.getString("comment_date");
				
				Comment comment = new Comment(commentId, parentCommentId, projectId, userId, username, profilePictureName, commentStr, commentDate);
				
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	@Override
	public String getNewIdQuery()
	{
		return "SELECT max(project_id) AS max_id FROM sponsorme.project;";
	}
	
	@Override
	public void store(Comment comment)
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
