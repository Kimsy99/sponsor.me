<%@ page import="sponsorme.store.ProjectStore" %>
<%@ page import="sponsorme.model.Project" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <%
      boolean isLoggedIn = session.getAttribute("username") != null;
    %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/header.css"/>
    <div class="header">
      <a href="${pageContext.request.contextPath}/index.jsp" class="logo-container">
        <img class="logo" src="${pageContext.request.contextPath}/assets/logo.svg" />
      </a>
      <div class="options">
        <a class="option" href="${pageContext.request.contextPath}/common/project.jsp"> Explore </a>
        <form class="option" method="get" id="search-form" action="${pageContext.request.contextPath}/SearchServlet">
          <input
            type="text"
            class="search-bar"
            placeholder="Search.."
            name="search"
          />
          <button type="submit" class="search-button" onclick="document.getElementById('search-form').submit();">
            <i class="fa fa-search"></i>
          </button>
        </form>
        <a class="option" href="${pageContext.request.contextPath}/common/sign-in-sign-up.jsp" <%=!isLoggedIn ? "" : "style=\"display: none\""%>> Sign in </a>
        <%
          if (isLoggedIn)
          {
        %>
        <div class="dropdown" onclick="toggleProfile()">
          <i class="fa fa-user dropbtn" aria-hidden="true"> <%=session.getAttribute("username")%></i>
          <div class="dropdown-content" id="dropdown-content">
            <div class="account">
              Your Account
              <hr />
              <a href="${pageContext.request.contextPath}/common/my-projects.jsp">My Projects</a>
              <a href="${pageContext.request.contextPath}/common/backed-project.jsp">Backed Project</a>
              <a href="${pageContext.request.contextPath}/common/profile.jsp">Profile</a>
              <a href="${pageContext.request.contextPath}/common/logout.jsp">Log out</a>
            </div>
            <br />
            <div class="create-project">
              <%
                ArrayList<Project> projects = ProjectStore.getInstance().getProjectsByUser((int)session.getAttribute("uid"));
                Project newestProject = projects.isEmpty() ? null : projects.get(projects.size() - 1);
              %>
              Created Projects
              <hr />
              <%
                if (newestProject != null)
                {
              %>
              <a href="${pageContext.request.contextPath}/common/project-item.jsp?pid=<%=newestProject.id%>">
                <div class="mini-project-preview">
                  <img
                    src="${pageContext.request.contextPath}/images/project-pictures/<%=newestProject.picture.name%>"
                    alt=""
                  />
                  <div class="mini-project-preview-content">
                    <h5><%=newestProject.name%></h5>
                    <h6><%=newestProject.getFundingPercentage()%>% funded</h6>
                  </div>
                </div>
              </a>
              <%
                }
                else
                {
              %>
              <p>No projects</p>
              <%
                }
              %>
              <a href="${pageContext.request.contextPath}/common/new-project.jsp" class="add-new-project">
                &#43; Add New Project
              </a>
            </div>
          </div>
        </div>
        <%
          }
        %>
      </div>
    </div>
  </head>
  <script src="${pageContext.request.contextPath}/js/toggleProfile.js"></script>
</html>
