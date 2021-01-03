<%@ page import="sponsorme.store.UserStore" %>
<%@ page import="sponsorme.model.User" %>
<%@ page import="sponsorme.store.ProjectStore" %>
<%@ page import="sponsorme.model.Project" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <%
      if (session.getAttribute("username") == null)
      {
        session.setAttribute("redirect", request.getContextPath() + "/common/profile.jsp");
        response.sendRedirect(request.getContextPath() + "/common/sign-in-sign-up.jsp");
        return;
      }
    %>
    <title>Sponsor.me</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/preview-item.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/project.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/new-project.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/profile.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <jsp:include page="./header.jsp"/>
  </head>
  <body>
  <%
    ArrayList<Project> myProjects = ProjectStore.getInstance().getProjectsByUser((int)session.getAttribute("uid"));
    User user = UserStore.getInstance().get((String)session.getAttribute("username"));
  %>
    <div class="profile-container">
    <div class="profile-avatar">
      <div class="edit-profile-picture">
        <i class="fa fa-pencil" aria-hidden="true"  onclick="editProfilePic()"></i>
        <%
          System.out.println(user.profilePictureName);
        %>
        <img src="${pageContext.request.contextPath}/images/profile-pictures/<%=user.profilePictureName%>" alt="" />
      </div>
      <div id="insert-profile-picture">
        <!-- insert comments -->
        <div class="insert-profile-picture-content">
          <form id="profile-picture-form" method="post" action="${pageContext.request.contextPath}/edit-profile-picture" enctype='multipart/form-data'>
            <span
                    class="close close-reply"
                    onclick="closeEdit()"
            >&times;</span
            >
            <h3>Choose Profile Picture</h3>
            <input
              type="file"
              id="img2"
              name="img2"
              accept="image/*"
              required     
            >
            <br/>
            <button type="submit">Submit</button>
          </form>
        </div>
      </div>
      <h1><%=user.username%></h1>
      <p>You have <%=myProjects.size()%> projects</p>
    </div>
      <div class="preview-item-container" style="margin: 20px">
        <%
          for (Project project : myProjects)
          {
            float percentage = project.getFundingPercentage();
        %>
        <a class="project-item <%=project.category.getDisplayName()%>" href="./project-item.jsp?pid=<%=project.id%>">
          <img src="${pageContext.request.contextPath}/images/project-pictures/<%=project.picture.name%>" class="image">
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
  </div>
  </body>
  <jsp:include page="./footer.jsp"/>

  <script src="${pageContext.request.contextPath}/js/script.js"></script>
  <script src="${pageContext.request.contextPath}/js/faq-text-field.js"></script>
  <script src="${pageContext.request.contextPath}/js/toggleProfile.js"></script>
  <script src="${pageContext.request.contextPath}/js/edit-profile-pic.js"></script>
</html>
