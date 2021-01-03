<!DOCTYPE html>
<html lang="en">
  <head>
    <%
      if (session.getAttribute("username") == null)
      {
        session.setAttribute("redirect", request.getContextPath() + "/common/new-project.jsp");
        response.sendRedirect(request.getContextPath() + "/common/sign-in-sign-up.jsp");
        return;
      }
    %>
    <title>Sponsor.me</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link
      rel="stylesheet"
      href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
      integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/preview-item.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/project.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/new-project.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/new-project-options.css" />
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <jsp:include page="header.jsp"/>
  </head>
  <body>
    <div class="new-project-item">
      <h1>Add Reward Item</h1>
      <form method="post" action="${pageContext.request.contextPath}/new-project-perks">
        <div class="reward-wrapper">
        <!--faqs-->
          <div class="reward-items">
            <div class="multi-field-template" style="display: none">
                    
              <input
                type="text"
                name="stuff[]"
                class=""
                placeholder="Question"
              />
              <button type="button" class="remove-field"><i class="fas fa-trash-alt"></i></button>
            </div>
            <div class="reward-item reward-item-template" style="display: none;">
              <label>Reward Item Name</label>
              <i class="fa fa-window-close remove-reward" aria-hidden="true"></i>
              <input
                      type="text"
                      name="option-name"
                      class=""
                      placeholder="Reward Item Name"
                    />
            </div>
            <div class="reward-item">
              <label>Reward Item Name</label>
              <i class="fa fa-window-close remove-reward" aria-hidden="true"></i>
              <input
                      type="text"
                      name="option-name"
                      class=""
                      placeholder="Question"
                    />
            </div>
          </div>
          <button type="button" class="add-item">Add Reward Item</button><br/><br/>
        </div>
        
        <input id="submit" type="submit" value="Next: Add Perks"/>
      </form>
    </div>
  </body>
  <jsp:include page="footer.jsp"/>

  <script src="${pageContext.request.contextPath}/js/script.js"></script>
  <!-- <script src="${pageContext.request.contextPath}/js/faq-text-field.js"></script> -->
  <script src="${pageContext.request.contextPath}/js/add-reward-item.js"></script>
  <script src="${pageContext.request.contextPath}/js/toggleProfile.js"></script>
</html>
