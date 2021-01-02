package sponsorme.model;

import java.io.Serializable;

public class Faq implements Serializable
{
	public final int id;
	public final int projectId;
	public final String question;
	public final String answer;
	
	public Faq(int id, int projectId, String question, String answer)
	{
		this.id = id;
		this.projectId = projectId;
		this.question = question;
		this.answer = answer;
	}
	
	@Override
	public String toString()
	{
		return question + " (ID = " + id + ")";
	}
}
