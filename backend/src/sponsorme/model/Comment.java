package sponsorme.model;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class Comment implements Serializable, Comparable<Comment>
{
	private final DateTimeFormatter standardFormatter = DateTimeFormatter.ofPattern("d MMM yyyy");
	
	public final int id;
	public final int parentId;
	public final int projectId;
	public final int userId;
	public final String commenterUsername;
	public final String profilePictureName;
	public final String text;
	public final String dateStr;
	private final LocalDate date;
	
	public Comment(int id, int parentId, int projectId, int userId, String text, String dateStr)
	{
		this(id, parentId, projectId, userId, "", "", text, dateStr);
	}
	
	public Comment(int id, int parentId, int projectId, int userId, String commenterUsername, String profilePictureName, String text, String dateStr)
	{
		this.id = id;
		this.parentId = parentId;
		this.projectId = projectId;
		this.userId = userId;
		this.commenterUsername = commenterUsername;
		this.profilePictureName = profilePictureName;
		this.text = text;
		this.dateStr = dateStr;
		date = LocalDate.parse(dateStr, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	}
	
	@Override
	public int compareTo(Comment o)
	{
		return o.id - id;
	}
	
	public String getFormattedDate()
	{
		return date.format(standardFormatter);
	}
}
