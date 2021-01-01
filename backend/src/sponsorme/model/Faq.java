package sponsorme.model;

public class Faq
{
	public final int questionId;
	public final int projectId;
	public final String question;
	public final String answer;
	
	public Faq(int questionId, int projectId, String question, String answer)
	{
		this.questionId = questionId;
		this.projectId = projectId;
		this.question = question;
		this.answer = answer;
	}
}
