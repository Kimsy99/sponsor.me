<%@ page import="java.util.ArrayList" %>
<%@ page import="sponsorme.store.ProjectStore" %>
<%@ page import="sponsorme.model.Project" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Sponsor.me</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/intro.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/preview-item.css"/>
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
      <button onClick="filterSelection('art')">Art</button>
      <button onClick="filterSelection('publish')">Publish</button>
      <button onClick="filterSelection('food')">Food</button>
      <button onClick="filterSelection('game')">Game</button>
      <button onClick="filterSelection('others')">Others</button>
    </ul>
  </div>
  <div class="preview-item-container">
    <%
      ArrayList<Project> topProjects = ProjectStore.getInstance().getTopProjects(10, true);
      
//      Statement stm = conn.createStatement();
//      String sql = "select p.project_id as pid, project_name, funding_goal, category,SUM(backed_amount) as amount, username, count(user_id) as backerNum\n" +
//              "from project as p left join backed_project as bp ON p.project_id = bp.project_id\n" +
//              "left join user as u ON p.creator_id = u.user_id\n" +
//              "group by p.project_id\n" +
//              "order by backerNum desc\n" +
//              "LIMIT 10; ";
//      ResultSet rs = stm.executeQuery(sql);
      for (Project project : topProjects)
      {
        int percentage = project.getFundingPercentage();
    %>
    <a class="project-item <%=project.category%>" href="${pageContext.request.contextPath}/common/project-item.jsp?pid=<%=project.id%>">
      <img src="https://i.imgur.com/zm10H4x.jpg" class="image">
      <div class="project-footer">
        <span class="name"><%=project.name%></span>
        <span class="target-fund">Target Fund: MYR <%=project.getFormattedFundingGoal()%></span>
        <span class="funded-percentage"><%=percentage%>% funded</span>
        <span>By <%=project.creatorUsername%></span>
        <span><strong><%=project.category.getDisplayName()%></strong></span>
        <button type="submit">Back Project</button>
      </div>
    </a>
    <%}%>
  </div>
</div>
</body>

<jsp:include page="common/footer.jsp"/>

<script src="${pageContext.request.contextPath}/js/script.js"></script>
<script src="${pageContext.request.contextPath}/js/toggleProfile.js"></script>
</html>
