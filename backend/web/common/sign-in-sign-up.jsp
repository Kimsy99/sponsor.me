<%--@elvariable id="error_message" type=""--%>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/sign-in-sign-up.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <jsp:include page="header.jsp"/>
    
  </head>
  <body>
    <div class="sign-in-and-sign-up">
      <div class="module-border-wrap">
        <div class="sign-in">
          <h2 class="title">I have an account</h2>
          <span>Sign in with your email and password</span>
          <form id="sign-in-form" method="post" action="${pageContext.request.contextPath}/login">
            <div class="group">
              <input name="username" class="form-input" placeholder="Username"/>
              <!-- <label class="form-input-label">Email</label> -->
            </div>
            <div class="group">
              <input
                name="password"
                class="form-input"
                type="password"
                placeholder="Password"
              />
              <!-- <label class="form-input-label">Password</label> -->
            </div>
            <div class="buttons">
              <button type="submit">Sign In</button>
            </div>
          </form>
          <p style="color: red">${error_message}</p>
        </div>
      </div>

      <div class="module-border-wrap">
        <div class="sign-up">
          <h2 class="title">I don't have an account</h2>
          <span>Sign up with your email and password</span>
          <form class="sign-up-form" onSubmit="{this.handleSubmit}">
            <!-- <input type="text" placeholder="User Name" />
          <input type="email" placeholder="Email" />
          <input type="password" placeholder="Password" />
          <input type="password" placeholder="Confirm Password" /> -->
            <div class="group">
              <input class="form-input" type="text" placeholder="Username"/>
            </div>
            <div class="group">
              <input class="form-input" type="email" placeholder="Email" />
              <!-- <label class="form-input-label">Email</label> -->
            </div>
            <div class="group">
              <input
                class="form-input"
                type="password"
                placeholder="Password"
              />
            </div>
            <div class="group">
              <input
                class="form-input"
                type="password"
                placeholder="Confirm Password"
              />
            </div>
            <button type="submit">Sign Up</button>
          </form>
        </div>
      </div>
    </div>
  </body>
  
  <jsp:include page="footer.jsp"/>
  
  <script src="${pageContext.request.contextPath}/js/script.js"></script>
  <script src="${pageContext.request.contextPath}/js/toggleProfile.js"></script>
</html>
