<%@ page import="sponsorme.model.Project" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="sponsorme.store.ProjectStore" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <%
      if (session.getAttribute("username") == null)
      {
        session.setAttribute("redirect", request.getContextPath() + "/common/backed-project.jsp");
        response.sendRedirect(request.getContextPath() + "/common/sign-in-sign-up.jsp");
        return;
      }
    %>
    <title>Sponsor.me</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/preview-item.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/project.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/new-project.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/profile.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <jsp:include page="./header.jsp"/>
  </head>
  <body>
  <%--    <h1 style="padding-left: 80px;">Backed Project</h1>--%>
  <%
    ArrayList<Project> backedProjects = ProjectStore.getInstance().getBackedProjectsByUser((int)session.getAttribute("uid"));
  %>
  <div class="profile-container">
    <div class="profile-avatar">
      <h1>Backed Project</h1>
      <p>You have backed <%=backedProjects.size()%> projects</p>
    </div>
    <div class="preview-item-container">
      <%
        for (Project project : backedProjects)
        {
      %>
      <a class="project-item" href="${pageContext.request.contextPath}/common/project-item.jsp?pid=<%=project.id%>">
        <img src="https://i.imgur.com/zm10H4x.jpg" class="image">
        <div class="project-footer">
            <span class="name"
            ><%=project.name%></span
            >
          <span class="target-fund">Target Fund: <%=project.getFormattedFundingGoal()%></span>
          <span class="funded-percentage"><%=project.getFundingPercentage()%>% funded</span>
          <span>By <%=project.creatorUsername%></span>
          <button type="submit">View Details</button>
        </div>
      </a>
      <%
        }
      %>
    </div>
  </div>
  </body>
  <jsp:include page="./footer.jsp"/>
  
  <script src="${pageContext.request.contextPath}/js/script.js"></script>
  <script src="${pageContext.request.contextPath}/js/faq-text-field.js"></script>
  <script src="${pageContext.request.contextPath}/js/toggleProfile.js"></script>
</html>
