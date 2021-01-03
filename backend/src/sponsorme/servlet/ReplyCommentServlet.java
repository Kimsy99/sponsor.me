package sponsorme.servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sponsorme.model.Comment;
import sponsorme.store.CommentStore;

@WebServlet("/reply")
public class ReplyCommentServlet extends HttpServlet
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session = request.getSession();
		int pid = Integer.parseInt(request.getParameter("pid"));
		int uid = (int)session.getAttribute("uid");
		int pcid = Integer.parseInt(request.getParameter("pcid"));
		String commentStr = request.getParameter("comment");
		
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String date = now.format(formatter);
		
		System.out.println("[ReplyCommentServlet] Post comment \"" + commentStr + "\"");
		try
		{
			Comment comment = new Comment(CommentStore.getInstance().getNewId(), pcid, pid, uid, commentStr, date);
			CommentStore.getInstance().store(comment);
			session.setAttribute("scroll_top", Float.parseFloat(request.getParameter("scroll-top")));
			response.sendRedirect(request.getContextPath() + "/common/project-item.jsp?pid=" + pid + "&comment=1");
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
}
