<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.math.RoundingMode" %>
<%@ page import="sponsorme.ConnectionManager" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Sponsor.me</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/intro.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/header.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/preview-item.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/footer.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

  <jsp:include page="common/header.jsp"/>

</head>
<body>
<div class="intro-section">
  <img
          class="intro-image"
          src="${pageContext.request.contextPath}/assets/homepage-intro-illustration.png"
          alt="intro-image"
  />
  <div class="intro-text">
    <h1>Sponsor.me</h1>
    <br />
    <p>
      We are a crowdfunding platform for University Students focus on
      creativity. Student may start any creative project here to start to
      get fundings
    </p>
    <a href="${pageContext.request.contextPath}/common/new-project.jsp"><button>Start Project</button></a>
  </div>
</div>
<div class="preview-items">
  <h1>Hot Projects</h1>
  <div class="preview-items-filter text-center">
    <ul class="filter-list">
      <button class="active" onClick="filterSelection('all')">All</button>
      <button onClick="filterSelection('tech')">Tech</button>
      <button onClick="filterSelection('design')">Design</button>
      <button onClick="filterSelection('film')">Film</button>
      <button onClick="filterSelection('arts')">Arts</button>
      <button onClick="filterSelection('publish')">Publish</button>
      <button onClick="filterSelection('food')">Food</button>
      <button onClick="filterSelection('games')">Games</button>
      <button onClick="filterSelection('others')">Others</button>
    </ul>
  </div>
  <div class="preview-item-container">
    <%
      Connection conn = ConnectionManager.getConnection();
      Statement stm = conn.createStatement();
      String sql = "select p.project_id as pid, project_name, funding_goal, category,SUM(backed_amount) as amount, username, count(user_id) as backerNum\n" +
              "from project as p left join backed_project as bp ON p.project_id = bp.project_id\n" +
              "left join user as u ON p.creator_id = u.user_id\n" +
              "group by p.project_id\n" +
              "order by backerNum desc\n" +
              "LIMIT 10; ";
      ResultSet rs = stm.executeQuery(sql);
      while(rs.next())
      {
        float percentage = rs.getFloat("amount")/(rs.getFloat("funding_goal"))*100;
    %>
    <a class="project-item <%=rs.getString("category")%>" href="${pageContext.request.contextPath}/common/project-item.jsp?pid=<%=rs.getInt("pid")%>">
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
</div>
</body>

<jsp:include page="common/footer.jsp"/>

<script src="${pageContext.request.contextPath}//js/script.js"></script>
<script src="${pageContext.request.contextPath}//js/toggleProfile.js"></script>
</html>
