<%--@elvariable id="error_message" type=""--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Sponsor.me</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/preview-item.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/sign-in-sign-up.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <jsp:include page="header.jsp"/>

</head>
<body>
<div class="sign-in-and-sign-up">
    <div class="module-border-wrap">
        <div class="sign-in">
            <h2 class="title">I have an account</h2>
            <span>Sign in with your username and password</span>
            <form id="sign-in-form" method="post" action="${pageContext.request.contextPath}/login">
                <div class="group">
                    <input name="username-sign-in" class="form-input" placeholder="Username"/>
                    <!-- <label class="form-input-label">Email</label> -->
                </div>
                <div class="group">
                    <input
                            name="password-sign-in"
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

            <%
                if(request.getAttribute("registeredSuccessfully") != null)
                {
            %>
                    <h2 class="title">Registered Successfully</h2>
                    <span>Signin with the form on the left</span>
            <%
                }
                else
                {
            %>

                    <h2 class="title">I don't have an account</h2>
                    <span>Sign up with your email and password</span>
                    <form class="sign-up-form" method="post" action="${pageContext.request.contextPath}/signup">
                        <!-- <input type="text" placeholder="User Name" />
                      <input type="email" placeholder="Email" />
                      <input type="password" placeholder="Password" />
                      <input type="password" placeholder="Confirm Password" /> -->
                        <div class="group">
                            <input
                                    name="username-sign-up"
                                    class="form-input"
                                    type="text"
                                    placeholder="Username"
                                    value="<%=request.getParameter("username-sign-up") == null ? "" : request.getParameter("username-sign-up")%>"
                                    required
                            />
                            <%
                                if (request.getAttribute("username_taken") != null)
                                {
                            %>
                                    <p style="color: red"><%=request.getAttribute("username_taken")%>
                                    </p>
                            <%
                                }
                            %>
                        </div>
                        <div class="group">
                            <input
                                    name="email"
                                    class="form-input"
                                    type="email" placeholder="Email"
                                    value="<%=request.getParameter("email") == null ? "" : request.getParameter("email")%>"
                                    required
                            />
                            <%
                                if (request.getAttribute("email_taken") != null)
                                {
                            %>
                                    <p style="color: red"><%=request.getAttribute("email_taken")%>
                                    </p>
                            <%
                                }
                            %>
                            <!-- <label class="form-input-label">Email</label> -->
                        </div>
                        <div class="group">
                            <input
                                    name="password-sign-up"
                                    class="form-input"
                                    type="password"
                                    placeholder="Password"
                                    value="<%=request.getAttribute("inconsistent_password") != null || request.getParameter("password-sign-up") == null ? "" : request.getParameter("password-sign-up")%>"
                                    required
                            />
                            <%
                                if (request.getAttribute("inconsistent_password") != null)
                                {
                            %>
                                    <p style="color: red"><%=request.getAttribute("inconsistent_password")%>
                                    </p>
                            <%
                                }
                            %>
                        </div>
                        <div class="group">
                            <input
                                    name="confirm-password"
                                    class="form-input"
                                    type="password"
                                    placeholder="Confirm Password"
                                    value="<%=request.getAttribute("inconsistent_password") != null || request.getParameter("confirm_password") == null ? "" : request.getParameter("confirm_password")%>"
                                    required
                            />
                        </div>
                        <button type="submit" onclick="document.getElementById('sign-up-form').submit();">Sign Up</button>
                    </form>
            <%
                }
            %>
        </div>
    </div>
</div>
</body>

<jsp:include page="footer.jsp"/>

<script src="${pageContext.request.contextPath}/js/script.js"></script>
<script src="${pageContext.request.contextPath}/js/toggleProfile.js"></script>
</html>
