package sponsorme.servlet;

import sponsorme.ConnectionManager;
import sponsorme.Utils;
import sponsorme.model.User;
import sponsorme.store.UserStore;

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
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/signup")

public class SignupServlet extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        boolean invalidInput = false;

        //check password
        if(!password.equals(confirmPassword))
        {
            request.setAttribute("inconsistentPassword", "Password and confirm password do not match");
            invalidInput = true;
        }

        Connection conn =  ConnectionManager.getConnection();
        //check username
        try
        {
            //check username
            PreparedStatement stm_checkUsername = conn.prepareStatement(
                    "select * from user where username = ?;"
            );
            stm_checkUsername.setString(1, username);
            ResultSet rs_usernameTaken = stm_checkUsername.executeQuery();
            if(rs_usernameTaken.next())
            {
                request.setAttribute("usernameTaken", "The username is taken, try another username");
                invalidInput = true;
            }

            //check email
            PreparedStatement stm_checkEmail = conn.prepareStatement(
                    "select * from user where email = ?;"
            );
            stm_checkEmail.setString(1, email);
            ResultSet rs_emailTaken = stm_checkEmail.executeQuery();
            if(rs_emailTaken.next())
            {
                request.setAttribute("emailTaken", "Already have an account? Or use a new email address to register new account");
                invalidInput = true;
            }
        }
        catch (Exception ex)
        {
            response.getWriter().println(ex.toString());
        }

        if(invalidInput)
        {
            request.getRequestDispatcher("/common/sign-in-sign-up.jsp").forward(request, response);
        }
        else
        {
            //information validated
            java.util.Date d = new java.util.Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String userRegistrationDate = sdf.format(d);

            byte[] salt = Utils.generateSalt();
            String passwordHash = Utils.hashPassword(password, salt);

            User newUser = new User(0, username, email, passwordHash, Utils.byteArrayToHexString(salt), "default_user_icon", userRegistrationDate);

            try
            {
                UserStore.getInstance().store(newUser);
                request.getRequestDispatcher("/common/sign-in-sign-up.jsp").forward(request, response);
                //response.sendRedirect("./common/sign-in-sign-up.jsp");
            }
            catch (Exception ex)
            {
                response.getWriter().println(ex.toString());
            }
        }

    }
}
