package sponsorme.model;

public class Comment
{
	public final int commentId;
	public final int projectId;
	public final int userId;
	public final String comment;
	public final int parentComment;
	public final String commentDate;
	
	public Comment(int commentId, int projectId, int userId, String comment, int parentComment, String commentDate)
	{
		this.commentId = commentId;
		this.projectId = projectId;
		this.userId = userId;
		this.comment = comment;
		this.parentComment = parentComment;
		this.commentDate = commentDate;
	}
}
