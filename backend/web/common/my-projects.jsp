<%@ page import="sponsorme.model.Project" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="sponsorme.store.ProjectStore" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/preview-item.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/project.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <jsp:include page="./header.jsp"/>
  </head>
  <body>
    <h1 style="padding-left: 80px">All my projects</h1>
    <div class="preview-item-container" style="margin: 20px">
      <%
        ArrayList<Project> myProjects = ProjectStore.getInstance().getProjectsByUser((int)session.getAttribute("uid"));
        
        for (Project project : myProjects)
        {
          int percentage = project.getFundingPercentage();
      %>
      <a class="project-item <%=project.category%>" href="./project-item.jsp?pid=<%=project.id%>">
        <img src="https://i.imgur.com/zm10H4x.jpg" class="image">
        <div class="project-footer">
            <span class="name"
            ><%=project.name%></span
            >
          <span class="target-fund">Target Fund: MYR <%=project.getFormattedFundingGoal()%></span>
          <span class="funded-percentage"><%=percentage%>% funded</span>
          <span>By <%=project.creatorUsername%></span>
          <button type="submit">Back Project</button>
        </div></a>

      <%}%>
    </div>
  </body>
  <<jsp:include page="./footer.jsp"/>

  <script src="${pageContext.request.contextPath}/js/script.js"></script>
  <script src="${pageContext.request.contextPath}/js/faq-text-field.js"></script>
  <script src="${pageContext.request.contextPath}/js/toggleProfile.js"></script>
</html>
