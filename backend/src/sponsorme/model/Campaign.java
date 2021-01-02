package sponsorme.model;

import java.io.Serializable;

public class Campaign implements Serializable
{
	public final Status status;
	public final String story;
	
	public Campaign(Status status, String story)
	{
		this.status = status;
		this.story = story;
	}
	
	public enum Status
	{
		CONCEPT,
		PROTOTYPE,
		PRODUCTION,
		SHIPPING
	}
}
