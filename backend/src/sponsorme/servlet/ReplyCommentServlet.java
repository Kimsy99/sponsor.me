package sponsorme.servlet;

import sponsorme.ConnectionManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;

@WebServlet("/reply")
public class ReplyCommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pid = Integer.parseInt(request.getParameter("pid"));
        int pcid = Integer.parseInt(request.getParameter("pcid"));
        HttpSession session = request.getSession();
        int uid = (int)session.getAttribute("uid");
        String comment = request.getParameter("comment");
        java.util.Date d = new java.util.Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String cur_time = sdf.format(d);

        try{
            Connection connection = ConnectionManager.getConnection();
            String sql = "insert into comment(project_id, user_id, comment, parent_comment, comment_date) "
                    + " values(?,?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pid);
            stm.setInt(2, uid);
            stm.setString(3, comment);
            stm.setInt(4, pcid);
            stm.setString(5, cur_time);
            stm.execute();
            response.sendRedirect("/backend_war_exploded/common/project-item.jsp?pid=" + pid);
        }catch(Exception ex){
            ex.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
