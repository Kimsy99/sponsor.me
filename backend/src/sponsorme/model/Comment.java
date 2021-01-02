package sponsorme.model;

import java.io.Serializable;

public class Comment implements Serializable, Comparable<Comment>
{
	public final int id;
	public final int parentId;
	public final int projectId;
	public final int userId;
	public final String commenterUsername;
	public final String profilePictureName;
	public final String text;
	public final String date;
	
	public Comment(int id, int parentId, int projectId, int userId, String commenterUsername, String profilePictureName, String text, String date)
	{
		this.id = id;
		this.parentId = parentId;
		this.projectId = projectId;
		this.userId = userId;
		this.commenterUsername = commenterUsername;
		this.profilePictureName = profilePictureName;
		this.text = text;
		this.date = date;
	}
	
	@Override
	public int compareTo(Comment o)
	{
		return id - o.id;
	}
}
