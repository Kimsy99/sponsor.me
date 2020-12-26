<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="sponsorme.ConnectionManager" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Sponsor.me</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <link rel="stylesheet" href="../styles/header.css" />
    <link rel="stylesheet" href="../styles/preview-item.css" />
    <link rel="stylesheet" href="../styles/footer.css" />
    <link rel="stylesheet" href="../styles/project.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <jsp:include page="./header.jsp"/>
  </head>
  <body >
    <h1 style="padding-left: 80px">All my projects</h1>
    <div class="preview-item-container" style="margin: 20px">
      <%
        Connection connection = ConnectionManager.getConnection();
        Statement stm = connection.createStatement();
        String sql = "select p.project_id as pid, project_name, funding_goal, category,SUM(backed_amount) as amount, username\n" +
                "from project as p left join backed_project as bp ON p.project_id = bp.project_id\n" +
                "left join user as u ON p.creator_id = u.user_id\n" +
                "where p.creator_id = " +  session.getAttribute("uid") + "\n" +
                "group by p.project_id";
        ResultSet rs = stm.executeQuery(sql);
        while(rs.next())
        {
          float percentage = rs.getFloat("amount")/(rs.getFloat("funding_goal"))*100;
      %>
      <a class="project-item <%=rs.getString("category")%>" href="./project-item.jsp?pid=<%=rs.getInt("pid")%>">
        <img src="https://i.imgur.com/zm10H4x.jpg" class="image"></img>
        <div class="project-footer">
            <span class="name"
            ><%=rs.getString("project_name")%></span
            >
          <span class="target-fund">Target Fund: MYR <%=rs.getBigDecimal("funding_goal")%></span>
          <span class="funded-percentage"><%=percentage%>% funded</span>
          <span>By <%=rs.getString("username")%></span>
          <button type="submit">Back Project</button>
        </div></a>

      <%}%>
    </div>
  </body>
  <<jsp:include page="./footer.jsp"/>

  <script src="../js/script.js"></script>
  <script src="../js/faq-text-field.js"></script>
  <script src="../js/toggleProfile.js"></script>
</html>
