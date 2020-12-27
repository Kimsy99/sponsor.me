package sponsorme.servlet;

import sponsorme.ConnectionManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet("/back-project")
public class BackProjectServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float amount = Float.parseFloat(request.getParameter("backing-amount"));
        int pid = Integer.parseInt(request.getParameter("pid"));
        int uid = (int)request.getSession().getAttribute("uid");
        int perk_id = Integer.parseInt(request.getParameter("perk-id"));
        try{
            Connection connection = ConnectionManager.getConnection();
            String sql = "insert into backed_project(backer_id,project_id, perk_id, backed_amount) "
                    + " values(?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, uid);
            stm.setInt(2, pid);
            stm.setInt(3, perk_id);
            stm.setFloat(4, amount);
            response.sendRedirect("/common/project-item.jsp?pid=" + Integer.toString(pid));
        }catch(Exception ex){
            ex.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
