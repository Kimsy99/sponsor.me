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
import java.text.SimpleDateFormat;

@WebServlet("/NewProjectServlet")
public class NewProjectServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pname = request.getParameter("pname");
        String pDescription = request.getParameter("project-description");
        float targetAmount = Float.parseFloat(request.getParameter("target-amount"));
        String category = request.getParameter("category");
        String stage = request.getParameter("stage");
        String story = request.getParameter("image-text-box");
        String teamDetails = request.getParameter("image-text-box2");
        java.util.Date d = new java.util.Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String cur_time = sdf.format(d);
        int project_id = 0;
        Connection connection = ConnectionManager.getConnection();
        try{
            Statement stm2 = connection.createStatement();
            String sql2 = "select max(project_id) as max from project";
            ResultSet rs2 = stm2.executeQuery(sql2);
            rs2.next();
            project_id = rs2.getInt("max");
            project_id++;
        }catch(Exception ex){
            ex.printStackTrace();
        }


        try{
            String sql = "insert into project(project_id,project_name, small_description, funding_goal, category, creation_date, team, creator_id) "
                    + " values(?, ?, ? ,?,?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, project_id);
            stm.setString(2, pname);
            stm.setString(3, pDescription);
            stm.setFloat(4, targetAmount);
            stm.setString(5, category);
            stm.setString(6, cur_time);
            stm.setString(7, teamDetails);
            stm.setInt(8, (int)request.getSession().getAttribute("uid"));
        }catch(Exception ex){
            ex.printStackTrace();
        }

        try{
            String sql = "insert into campaign(project_name, small_description, funding_goal, category, creation_date, team, creator_id) "
                    + " values(?, ?, ? ,?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, project_id);
            stm.setString(2, stage);
            stm.setString(3, story);
        }catch(Exception ex){
            ex.printStackTrace();
        }


        // insert faq
        String [] question = new String[10];
        String [] answer = new String[10];
        int count=0;
        for(int i=0; request.getParameter("question")!=""; ++i){
            question[i] = request.getParameter("question");
            answer[i] = request.getParameter("answer");
            count++;
        }
        try{
            String sql = "insert into faq(project_id, questions, answer)"
                        + "values(?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            for(int i=0; i<count; ++i){
                stm.setInt(1, project_id);
                stm.setString(2,question[i]);
                stm.setString(3,answer[i]);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
