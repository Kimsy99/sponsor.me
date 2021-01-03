package sponsorme.store;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.TreeMap;

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
	
	public TreeMap<Comment, ArrayList<Comment>> getCommentTree(int projectId)
	{
		System.out.println("[CommentStore] Retrieving comments for project " + projectId);
		Connection connection = ConnectionManager.getConnection();
		String sql = "SELECT c.comment_id, c.user_id, u.username, u.profile_picture_name, c.comment, c.parent_comment, c.comment_date " 
				+ "FROM sponsorme.comment c LEFT JOIN sponsorme.user u "
				+ "ON c.user_id = u.user_id "
				+ "WHERE project_id = ? ";
		
		HashMap<Integer, Comment> parentCommentMap = new HashMap<>();
		TreeMap<Comment, ArrayList<Comment>> commentTree = new TreeMap<>();
		
		try (PreparedStatement statement = connection.prepareStatement(sql))
		{
			statement.setInt(1, projectId);
			try (ResultSet result = statement.executeQuery())
			{
				while (result.next())
				{
					int commentId = result.getInt("comment_id");
					int userId = result.getInt("user_id");
					String username = result.getString("username");
					String profilePictureName = result.getString("profile_picture_name");
					String commentStr = result.getString("comment");
					int parentCommentId = result.getInt("parent_comment");
					String commentDate = result.getString("comment_date");
					
					Comment comment = new Comment(commentId, parentCommentId, projectId, userId, username,
							profilePictureName, commentStr, commentDate);
					if (comment.parentId == 0) // Parent node
					{
						parentCommentMap.put(comment.id, comment);
						commentTree.put(comment, new ArrayList<>());
					}
					else
						commentTree.get(parentCommentMap.get(comment.parentId)).add(comment);
				}
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		System.out.println("[CommentStore] Retrieved " + commentTree.size() + (commentTree.size() == 1 ? " comment" : " comments") + " for project " + projectId);
		return commentTree;
	}
	
	@Override
	public String getNewIdQuery()
	{
		return "SELECT max(project_id) AS max_id FROM sponsorme.project;";
	}
	
	@Override
	public void store(Comment comment)
	{
		Connection connection = ConnectionManager.getConnection();
		String sql = "INSERT INTO sponsorme.comment(project_id, user_id, comment, parent_comment, comment_date) "
				+ "VALUES (?, ?, ?, ?, ?)";
		
		try (PreparedStatement statement = connection.prepareStatement(sql))
		{
			statement.setInt(1, comment.projectId);
			statement.setInt(2, comment.userId);
			statement.setString(3, comment.text);
			statement.setInt(4, comment.parentId);
			statement.setString(5, comment.dateStr);
			statement.execute();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	public static CommentStore getInstance()
	{
		if (instance == null)
			instance = new CommentStore();
		return instance;
	}
}
