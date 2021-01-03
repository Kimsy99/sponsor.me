<%--@elvariable id="error_message" type=""--%>
<%
    if(session.getAttribute("admin")!=null)
        response.sendRedirect("admin.jsp");
%>

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/admin/admin-login.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div class="module-border-wrap">
    <div class="sign-in">
        <h2 class="title">Sponsor.me Admin Login</h2>
        <span>Sign in with your username and password</span>
        <form id="admin-login" method="post" action="${pageContext.request.contextPath}/admin-login">
            <div class="group">
                <input
                        name="admin-username"
                        class="form-input"
                        type="text"
                        placeholder="Username"
                        required
                />
                <!-- <label class="form-input-label">Email</label> -->
            </div>
            <div class="group">
                <input
                        name="admin-password"
                        class="form-input"
                        type="password"
                        placeholder="Password"
                        required
                />
                <!-- <label class="form-input-label">Password</label> -->
            </div>
            <p style="color: white">${error_message}</p>
            <div class="buttons">
                <button type="submit">Sign In</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
