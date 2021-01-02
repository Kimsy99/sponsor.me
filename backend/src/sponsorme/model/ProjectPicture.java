package sponsorme.model;

import java.io.Serializable;

public class ProjectPicture implements Serializable
{
	public final int id;
	public final int pictureId;
	public final String name;
	
	public ProjectPicture(int pictureId, String name)
	{
		this(0, pictureId, name);
	}
	
	public ProjectPicture(int id, int pictureId, String name)
	{
		this.id = id;
		this.pictureId = pictureId;
		this.name = name;
	}
}
