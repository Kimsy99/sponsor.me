<%@ page import="java.sql.Connection" %>
<%@ page import="sponsorme.ConnectionManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
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
    <link rel="stylesheet" href="../styles/header.css" />
    <!-- <link rel="stylesheet" href="../styles/preview-item.css" /> -->
    <link rel="stylesheet" href="../styles/footer.css" />
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
            Connection connection = ConnectionManager.getConnection();
            Statement stm = connection.createStatement();
            String sql = "select perk_id, project_id, title, price, description \n" +
                    "from perk \n" +
                    "where perk.project_id = " + request.getParameter("pid");
            ResultSet rs = stm.executeQuery(sql);
            while(rs.next())
            {
          %>
          <li class="pledge-plan">
            <form action="${pageContext.request.contextPath}/back-project" id="pledge-content">
              <input type="hidden" name="pid" value="<%=request.getParameter("pid")%>" />
              <input type="hidden" name="perk-id" value="<%=rs.getInt("perk_id")%>" />
              <input type="checkbox" class="pledge-checkbox" value="plan3">
              <div class="pledge-info">
                <div class="pledge-info-reward-primary">
                  <div class="pledge-info-reward-primary-description">

                    <h2 class="pledge__amount">
                      <span class="money">MYR  <%=rs.getFloat("price")%></span> or more
                    </h2>
                    <h3 class="pledge__title"><%=rs.getString("title")%></h3>
                    <div
                      class="pledge__reward-description pledge__reward-description--expanded"
                    >
                      <p><%=rs.getString("description")%></p>
                  </div>
                </div>
                <div class="pledge-include">
                  <span
                    class="itemization-includes text-uppercase c-navy-light type-10 medium ls1px block"
                    >Includes:</span
                  >
                  <ul class="list-include">
                    <%
                      Statement stm2 = connection.createStatement();
                      String sql2 = "select  * \n" +
                              "from  reward_item left join item on reward_item.item_id = item.item_id\n" +
                              "where project_id = "+ request.getParameter("pid") + " and perk_id = " + rs.getInt("perk_id");
                      ResultSet rs2 = stm2.executeQuery(sql2);
                      while(rs2.next()){
                    %>
                    <li class="list-disc"><%=rs2.getString("item_name")%></li>
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
                            min="<%=rs.getFloat("price")%>"
                            value="<%=rs.getFloat("price")%>"
                            type="text"
                            name="backing-amount"
                            id="backing-amount"
                            data-type="currency" 
                          />
                          
                        </div>
  
                    </div>
                    <button
                      id="multiple-reward-continue-button"
                      name="multiple-reward-continue-button"
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
