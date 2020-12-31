<!DOCTYPE html>
<html lang="en">
  <head>
<%--    <title>Sponsor.me</title>--%>
<%--    <meta charset="UTF-8" />--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0" />--%>
<%--    <link--%>
<%--      rel="stylesheet"--%>
<%--      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"--%>
<%--    />--%>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/header.css" />--%>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/preview-item.css" />--%>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/footer.css" />--%>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/project.css" />--%>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/new-project.css" />--%>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/profile.css" />--%>
<%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>--%>
    <%
      boolean isLoggedIn = session.getAttribute("username") != null;
    %>
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
        <div class="dropdown" onclick="toggleProfile()" <%=isLoggedIn ? "" : "style=\"display: none\""%>>
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
              Created Projects
              <hr />
              <a>
                <div class="mini-project-preview">
                  <img
                    src="./assets/project-categories-header-image/all.jpg"
                    alt=""
                  />
                  <div class="mini-project-preview-content">
                    <h5>Title about the project</h5>
                    <h6>65% funded</h6>
                  </div>
                </div>
              </a>
              <a href="./new-project.jsp" class="add-new-project">
                &#43; Add New Project
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </head>
  <script src="${pageContext.request.contextPath}/js/toggleProfile.js"></script>
</html>
