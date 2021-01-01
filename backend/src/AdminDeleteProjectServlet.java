import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;


@WebServlet("/AdminDeleteProjectServlet")
public class AdminDeleteProjectServlet extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String projectID = request.getParameter("project_id");

        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/sponsorme",
                    "root", "root"
            );
            PreparedStatement stm = conn.prepareStatement(
                    "delete from project where project_id = ?"
            );
            stm.setString(1, projectID);

            stm.execute();

            response.sendRedirect("./common/admin/admin-projects.jsp");

        }
        catch (Exception ex)
        {
            response.getWriter().println(ex.toString());
        }
    }
}
