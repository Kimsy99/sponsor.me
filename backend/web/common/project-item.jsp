<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="sponsorme.ConnectionManager" %>
<%@ page import="sponsorme.store.ProjectStore" %>
<%@ page import="sponsorme.model.Project" %>
<%@ page import="sponsorme.store.UserStore" %>
<%@ page import="sponsorme.model.User" %>
<%@ page import="sponsorme.model.ProjectBackingInfo" %>
<%@ page import="sponsorme.model.ProjectBackingInfo" %>
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
    <!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/preview-item.css" /> -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/project.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/project-item.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <jsp:include page="./header.jsp"/>
  </head>
  <body>
    <%
      Connection connection = ConnectionManager.getConnection();
      Project project = ProjectStore.getInstance().get(Integer.parseInt(request.getParameter("pid")));
      User creator = UserStore.getInstance().get(project.creatorId);
    %>
    <div class="project-item">
      <div class="project-item-info">
        <div class="image-slider">
          <img
            class="heading-image"
            src="${pageContext.request.contextPath}/assets/project-moft-image/moftFloatImage 1.png"
            alt=""
          />
        </div>
        <div class="project-item-description-header">
          <h1><%=project.name%></h1>
          <p>
            <%=project.smallDescription%>
          </p>
          <h6>Created by <%=creator.username%></h6>
          <div class="funding-details">
            <%
              ProjectBackingInfo info = ProjectStore.getInstance().getProjectInfoFromResult(project.id);
              float percentage = (float)info.backedAmount/info.fundingGoal*100;
            %>
            <h3>MYR <%=info.getFormattedBackedAmount()%></h3>

            <span>by <%=info.backerNum%> backers</span>
            <div class="funding-bar">
              <div class="funding-bar-color" style="<%="width: clamp(0%," + percentage + "%, 100%);"%>"></div>
            </div>
            <p><%=percentage%>% of MYR <%=info.getFormattedFundingGoal()%> goal</p>
            <a href="./back-project.jsp?pid=<%=project.id%>"
              ><button class="back-project-button">Back Project</button></a
            >
          </div>
        </div>
      </div>
      <div>
        <div class="project-item-content">
          <ul class="project-item-details">
            <button
              class="tablinks"
              onclick="openCity(event, 'campaign')"
              id="defaultOpen"
            >
              Campaign
            </button>
            <button class="tablinks" onclick="openCity(event, 'faq')">
              FAQ
            </button>
            <button class="tablinks" onclick="openCity(event, 'comments')">
              Comments
            </button>
            <button class="tablinks" onclick="openCity(event, 'team')">
              Team
            </button>
          </ul>
        </div>
        <%
          String concept = "", prototype = "", production = "", shipping = "";
          Project.Status stage = project.status;
          if (stage != null)
          {
            switch (stage)
            {
              case CONCEPT:
                concept = "-done";
                break;
              case PROTOTYPE:
                prototype = "-done";
                break;
              case PRODUCTION:
                production = "-done";
                break;
              case SHIPPING:
                shipping = "-done";
                break;
              default:
                break;
            }
          }
        %>
        <div class="details-container">
          <div class="project-item-progress">
            <!-- <img src="${pageContext.request.contextPath}/assets/project-moft-image/progress_bar.svg" alt="" /> -->
            <div class="project-item-container">
              <img
                class="progress-item concept"
                src="${pageContext.request.contextPath}/assets/project-moft-image/concept<%=concept%>.svg"
                alt=""
              />
              <p>Concept</p>
            </div>
            <div class="project-item-container">
              <img
                class="progress-item prototype"
                src="${pageContext.request.contextPath}/assets/project-moft-image/prototype<%=prototype%>.svg"
                alt=""
              />
              <p>Prototype</p>
            </div>
            <div class="project-item-container">
              <img
                class="progress-item production"
                src="${pageContext.request.contextPath}/assets/project-moft-image/production<%=production%>.svg"
                alt=""
              />
              <p>Production</p>
            </div>
            <div class="project-item-container">
              <img
                class="progress-item shipping"
                src="${pageContext.request.contextPath}/assets/project-moft-image/shipping<%=shipping%>.svg"
                alt=""
              />
              <p>Shipping</p>
            </div>
          </div>
          <div id="campaign" class="campaign-details tab-content">
            <%=project.story%>
          </div>
          <div id="faq" class="faq-details tab-content">
            <h3>FAQs</h3>
            <div class="questions-list">
              <%
                Statement stm2 = connection.createStatement();
                String sql2 = "select * from sponsorme.faq\n" +
                        "where project_id = " + request.getParameter("pid");
                ResultSet rs2 = stm2.executeQuery(sql2);
                while(rs2.next()){
              %>
              <div class="question">
                <button class="accordion">
                  <%=rs2.getString("question")%>
                </button>
                <div class="panel">
                  <p>
                    <%=rs2.getString("answer")%>
                  </p>
                </div>
              </div>
              <%
                }
              %>
            </div>
          </div>
          <div id="comments" class="tab-content">
            <button id="add-comment">Leave a comment</button>
            <div id="insert-comment" class="insert-comment">
              <!-- insert comments -->
              <div class="insert-comment-content">
                <span class="close">&times;</span>
                <h3>New Comment</h3>
                <form id="new-comment" method="post"  action="${pageContext.request.contextPath}/comment">
                    <input type="hidden" name="pid" value="<%=request.getParameter("pid")%>" />
                  <textarea
                    rows="10"
                    cols="50"
                    name="comment"
                    style="font-family: sans-serif; font-size: 1.2em; width: 80%"
                  ></textarea>
                  <br />
                    <button type="submit" onclick="document.getElementById('new-comment').submit();">
                        Submit
                    </button>
                </form>
              </div>
            </div>
            <div>
              <li>
                <div class="comments-list">
                  <ul class="comments-list">
                    <%
                      Statement stm3 = connection.createStatement();
                      String sql3 = "select  comment_id, comment.user_id, comment, parent_comment, comment_date as cd, username, profile_picture_name\n" +
                              "from sponsorme.comment left join sponsorme.user\n" +
                              "on comment.user_id = user.user_id\n" +
                              "where project_id="+ request.getParameter("pid")+" and parent_comment is null";
                      ResultSet rs3 = stm3.executeQuery(sql3);
                      while(rs3.next()){
//                        if(rs3.getInt("parent_comment")>0){
                        int pcid = rs3.getInt("comment_id");
                    %>
                    <li class="comment">
                      <div class="avatar">
                        <img
                          src="${pageContext.request.contextPath}/assets/project-categories-header-image/all.jpg"
                          alt="AvatarPic"
                          width="55"
                          height="55"
                        />
                      </div>
                      <div class="comment-content">
                        <header class="comment-content-header">
                          <a href="" class="user-link"><%=rs3.getString("username")%></a>
                          -
                          <span class="pubdate">posted on <%=rs3.getDate("cd")%> (<%=pcid%>)</span>
                        </header>
                        <p>
                          <%=rs3.getString("comment")%>
                        </p>
                        <button class="add-reply" onclick="replyPopUp(<%=pcid%>)">
                          Reply
                        </button>
                        <div id="insert-reply" class="insert-comment">
                          <!-- insert comments -->
                          <div class="insert-reply-content">
                            <form id="reply-comment-form" method="post"  action="${pageContext.request.contextPath}/reply">
                              <input type="hidden" name="pid" value="<%=request.getParameter("pid")%>" />
                              <input type="hidden" id="pcid" name="pcid" value=""/>
                              <span
                                      class="close close-reply"
                                      onclick="closeReply()"
                              >&times;</span
                              >
                              <h3>Reply</h3>
                              <textarea
                                      rows="10"
                                      cols="50"
                                      name="comment"
                                      style="
                                  font-family: sans-serif;
                                  font-size: 1.2em;
                                  width: 80%;
                                "
                              ></textarea>
                              <br />
                              <button
                                      type="submit"
                                      onclick="document.getElementById('reply-comment-form').submit();"
                              >
                                Submit
                              </button>
                            </form>
                          </div>
                        </div>
                      </div>
                      <ul class="comments-list children">
                        <%
                          Statement stm4 = connection.createStatement();
                          String sql4 = "select comment_id, comment.user_id, comment, parent_comment, comment_date as cds, username, profile_picture_name\n" +
                                  "from sponsorme.comment left join sponsorme.user\n" +
                                  "on comment.user_id = user.user_id\n" +
                                  "where project_id="+ request.getParameter("pid")+" and parent_comment is not null and parent_comment = " + pcid;
                          ResultSet rs4 = stm4.executeQuery(sql4);
                          while(rs4.next()){
                        %>
                        <li class="comment">
                          <div class="avatar">
                            <img
                              src="${pageContext.request.contextPath}/assets/project-categories-header-image/all.jpg"
                              alt="AvatarPic"
                              width="55"
                              height="55"
                            />
                          </div>
                          <div class="comment-content">
                            <header>
                              <a href="" class="user-link"><%=rs4.getString("username")%></a>
                              -
                              <span class="pubdate"><%=rs4.getDate("cds")%></span>
                            </header>
                            <p>
                              <%=rs4.getString("comment")%>
                            </p>
                          </div>
                        </li>
                        <%
                          }
                        %>
                      </ul>
                    </li>
                    <%
                      }
                    %>
                  </ul>
                </div>
              </li>
            </div>
          </div>
          <div id="team" class="tab-content">
            <%=project.team%>
          </div>

          <div class="perks-items">
            <h3>Select a Perk</h3>
            <%
              Statement stm5 = connection.createStatement();
              String sql5 = "select p.perk_id, title, price, description, count(*) as backerCount\n" +
                      "from sponsorme.perk as p left join sponsorme.backed_project as bp\n" +
                      "on p.perk_id = bp.perk_id and p.project_id = bp.project_id\n" +
                      "where p.project_id = "+ request.getParameter("pid")+"\n" +
                      "group by p.perk_id";
              ResultSet rs5 = stm5.executeQuery(sql5);
              while(rs5.next()){
            %>
            <a href=""
              ><div class="perk-item">
                <h2>MYR <%=rs5.getBigDecimal("price")%></h2>
                <h6><%=rs5.getString("title")%></h6>
                <p><%=rs5.getString("description")%></p>
                <h5><%=rs5.getInt("backerCount")%> backers</h5>
              </div></a
            >
            <%}%>
          </div>
        </div>
      </div>
    </div>
  </body>
  <jsp:include page="./footer.jsp"/>
<%--  JavascriptContext.includeLib("${pageContext.request.contextPath}/js/project-item.js", FacesContext.getCurrentInstance());--%>
  <script src="${pageContext.request.contextPath}/js/project-item.js"></script>
  <script>
    document.getElementById('defaultOpen').click();
  </script>
  <script src="${pageContext.request.contextPath}/js/toggleProfile.js"></script>
</html>
