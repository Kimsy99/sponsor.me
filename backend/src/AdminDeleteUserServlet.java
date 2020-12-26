import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/AdminDeleteUserServlet")
public class AdminDeleteUserServlet extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        System.out.println("AdminDeleteUserServlet");

        String userID = request.getParameter("user_id");

        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/sponsorme",
                    "root", "root"
            );
            PreparedStatement stm = conn.prepareStatement(
                    "delete from user where user_id = ?"
            );
            stm.setString(1, userID);

            stm.execute();

            response.sendRedirect("./common/admin/admin-users.jsp");
        }
        catch(Exception ex)
        {
            response.getWriter().println(ex.toString());
        }
    }
}
