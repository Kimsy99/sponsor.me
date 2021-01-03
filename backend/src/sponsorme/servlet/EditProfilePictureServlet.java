package sponsorme.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import sponsorme.ConnectionManager;

@MultipartConfig
@WebServlet("/edit-profile-picture")
public class EditProfilePictureServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int uid = (int)request.getSession().getAttribute("uid");
		
		// Read project image
		Part imagePart = request.getPart("img2");
		InputStream in = imagePart.getInputStream();
		byte[] bytes = in.readAllBytes();
		String pictureName = uid + "";
		FileOutputStream out = new FileOutputStream(request.getSession().getServletContext().getRealPath("images") + "/profile-pictures/" + pictureName);
		out.write(bytes);
		out.close();
		
		System.out.println("[EditProfilePictureServlet] Changing profile picture to " + pictureName);
		
		Connection connection = ConnectionManager.getConnection();
		String sql = "UPDATE sponsorme.user SET profile_picture_name = ? "
				+ "WHERE user_id = " + uid;
		
		try (PreparedStatement statement = connection.prepareStatement(sql))
		{
			statement.setString(1, pictureName);
			statement.execute();
			response.sendRedirect(request.getContextPath() + "/common/profile.jsp");
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}
}
