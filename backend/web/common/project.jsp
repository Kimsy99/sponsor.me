<%@ page import="java.util.ArrayList" %>
<%@ page import="sponsorme.store.ProjectStore" %>
<%@ page import="sponsorme.model.Project" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <%
      if (session.getAttribute("username") == null)
        session.setAttribute("redirect", request.getContextPath() + "/common/project.jsp");
    %>
    <title>Sponsor.me</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../styles/preview-item.css" />
    <link rel="stylesheet" href="../styles/project.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <jsp:include page="./header.jsp"/>
  </head>
  <body>
    <div class="project-header">
      <div class="header-text">
        <h1>Crowdfunding Projects</h1>
        <p>
          We are a crowdfunding platform for University Students focus on
          creativity. Student may start any creative project here to start to
          get fundings
        </p>
      </div>
    </div>
    <div class="preview-items">
      <h1>All Projects</h1>
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
          ArrayList<Project> projectBackingInfos = ProjectStore.getInstance().getTopProjects(-1, false);
          
          for (Project project : projectBackingInfos)
          {
            int percentage = project.getFundingPercentage();
        %>
            <a class="project-item <%=project.category.toString().toLowerCase()%>" href="./project-item.jsp?pid=<%=project.id%>">
          <img src="${pageContext.request.contextPath}/images/project-pictures/<%=project.picture.name%>" class="image">
          <div class="project-footer">
            <span class="name"><%=project.name%></span>
            <span class="target-fund">Target Fund: MYR <%=project.getFormattedFundingGoal()%></span>
            <span class="funded-percentage"><%=percentage%>% funded</span>
            <span>By <%=project.creatorUsername%></span>
            <span><strong><%=project.category.getDisplayName()%></strong></span>
            <button type="submit">Back Project</button>
          </div></a>
  
        <%}%>
      </div>
    </div>
  </body>
  
  <jsp:include page="./footer.jsp"/>
  
  <script src="${pageContext.request.contextPath}/js/script.js"></script>
  <script src="${pageContext.request.contextPath}/js/toggleProfile.js"></script>
</html>
