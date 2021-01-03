package sponsorme.servlet;

import sponsorme.ConnectionManager;
import sponsorme.model.Admin;
import sponsorme.store.AdminStore;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.rmi.ServerException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/admin-login")
public class AdminLoginServlet extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String adminUsername = request.getParameter("admin-username");
        String adminPassword = request.getParameter("admin-password");


        Admin admin = AdminStore.getInstance().get(adminUsername);

        if(admin != null && admin.verifyPassword(adminPassword))
        {
            HttpSession session = request.getSession();
            session.setAttribute("admin", admin);
            response.sendRedirect("./common/admin/admin.jsp");
        }
        else
        {
            request.setAttribute("error_message", "Username or password is incorrect");
            request.getRequestDispatcher("./common/admin/admin-login.jsp").forward(request, response);
        }
    }
}
