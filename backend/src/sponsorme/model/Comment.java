package sponsorme.model;

import java.io.Serializable;

public class Comment implements Serializable
{
	public final int commentId;
	public final int parentCommentId;
	public final int projectId;
	public final int userId;
	public final String username;
	public final String profilePictureName;
	public final String comment;
	public final String commentDate;
	
	public Comment(int commentId, int parentCommentId, int projectId, int userId, String username, String profilePictureName, String comment, String commentDate)
	{
		this.commentId = commentId;
		this.parentCommentId = parentCommentId;
		this.projectId = projectId;
		this.userId = userId;
		this.username = username;
		this.profilePictureName = profilePictureName;
		this.comment = comment;
		this.commentDate = commentDate;
	}
}
