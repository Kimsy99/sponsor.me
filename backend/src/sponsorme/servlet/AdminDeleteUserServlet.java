package sponsorme.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sponsorme.ConnectionManager;

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
            Connection connection = ConnectionManager.getConnection();
            PreparedStatement stm = connection.prepareStatement("delete from sponsorme.user where user_id = ?");
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
