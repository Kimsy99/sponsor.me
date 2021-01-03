<%@ page import="sponsorme.model.Perk" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="sponsorme.store.PerkStore" %>
<%@ page import="sponsorme.model.RewardItem" %>
<%@ page import="sponsorme.store.RewardItemStore" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <%
      int projectId = Integer.parseInt(request.getParameter("pid"));
      if (session.getAttribute("username") == null)
      {
        session.setAttribute("redirect", request.getContextPath() + "/common/back-project.jsp?pid=" + projectId);
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
    <!-- <link rel="stylesheet" href="../styles/preview-item.css" /> -->
    <!-- <link rel="stylesheet" href="../styles/project.css" /> -->
    <link rel="stylesheet" href="../styles/back-project.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <jsp:include page="./header.jsp"/>
  </head>
  <body>
    <div class="back-project">
      <h1>Select an Option below</h1>
      <div >
        <ol class="pledge-plans">
          <%
            ArrayList<Perk> projectPerks = PerkStore.getInstance().getPerkForProject(projectId);
            
            for (Perk perk : projectPerks)
            {
          %>
          <li class="pledge-plan">
            <form action="${pageContext.request.contextPath}/back-project" method="post" id="pledge-content">
              <input type="hidden" name="pid" value="<%=projectId%>" />
              <input type="hidden" name="perk-id" value="<%=perk.id%>" />
              <input type="checkbox" class="pledge-checkbox" value="plan3">
              <div class="pledge-info">
                <div class="pledge-info-reward-primary">
                  <div class="pledge-info-reward-primary-description">

                    <h2 class="pledge__amount">
                      <span class="money">MYR  <%=perk.getFormattedPrice()%></span> or more
                    </h2>
                    <h3 class="pledge__title"><%=perk.title%></h3>
                    <div
                      class="pledge__reward-description pledge__reward-description--expanded"
                    >
                      <p><%=perk.description%></p>
                  </div>
                </div>
                <div class="pledge-include">
                  <span
                    class="itemization-includes text-uppercase c-navy-light type-10 medium ls1px block"
                    >Includes:</span
                  >
                  <ul class="list-include">
                    <%
                      ArrayList<RewardItem> rewardItems = RewardItemStore.getInstance().getRewardItemsForPerk(perk);
                      for (RewardItem item : rewardItems)
                      {
                    %>
                    <li class="list-disc"><%=item.name%></li>
                    <%}%>
                  </ul>
                </div></div>
                <div class="pledge-checkout-form">
                    <div class="form-group">
                      <label>Pledge amount</label>
                        <div class="form-input-amount">
                          <div class="new-form-currency-box">
                            <span class="currency-box">MYR </span>
                          </div>
                          <input
                            class="amount-box"
                            tabindex="-1"
                            min="<%=perk.getFormattedPrice()%>"
                            value="<%=perk.getFormattedPrice()%>"
                            type="text"
                            name="backing-amount"
                            id="backing-amount"
                            data-type="currency" 
                          />
                          
                        </div>
  
                    </div>
                    <button
<%--                      id="multiple-reward-continue-button"--%>
<%--                      name="multiple-reward-continue-button"--%>
                      type="submit"
                      onclick="document.getElementById('pledge-content').submit();"
                    >
                      Continue
                    </button>
                </div>
                </div>
            </form>
          </li>
          <%}%>

          
        </ol>
      </div>
    </div>
  </body>
  <footer>
    <jsp:include page="./footer.jsp"/>
  </footer>
  <script src="../js/select-pledge.js"></script>
</html>
