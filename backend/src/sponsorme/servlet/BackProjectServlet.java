package sponsorme.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sponsorme.ConnectionManager;

@WebServlet("/back-project")
public class BackProjectServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float amount = Float.parseFloat(request.getParameter("backing-amount"));
        int pid = Integer.parseInt(request.getParameter("pid"));
        HttpSession session = request.getSession();
        int uid = (int)session.getAttribute("uid");
        int perk_id = Integer.parseInt(request.getParameter("perk-id"));
        try{
            Connection connection = ConnectionManager.getConnection();
            String sql = "insert into sponsorme.backed_project(backer_id,project_id, perk_id, backed_amount) "
                    + " values(?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, uid);
            stm.setInt(2, pid);
            stm.setInt(3, perk_id);
            stm.setFloat(4, amount);
            stm.execute();
            response.sendRedirect("/backend_war_exploded/common/project-item.jsp?pid=" + pid);
//            response.sendRedirect("index.jsp");
        }catch(Exception ex){
            ex.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
