<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="sponsorme.ConnectionManager" %>
<%@ page import="sponsorme.store.ProjectStore" %>
<%@ page import="sponsorme.model.Project" %>
<%@ page import="sponsorme.store.UserStore" %>
<%@ page import="sponsorme.model.User" %>
<%@ page import="sponsorme.store.FaqStore" %>
<%@ page import="sponsorme.model.Faq" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="sponsorme.model.Campaign" %>
<%@ page import="sponsorme.store.CommentStore" %>
<%@ page import="sponsorme.model.Comment" %>
<%@ page import="java.util.TreeMap" %>
<%@ page import="sponsorme.model.Perk" %>
<%@ page import="sponsorme.store.PerkStore" %>
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
    
    TreeMap<Comment, ArrayList<Comment>> commentTree = CommentStore.getInstance().getCommentTree(project.id);
    int commentCount = 0;
    for (Comment comment : commentTree.keySet())
      commentCount += commentTree.get(comment).size() + 1;
    
    session.setAttribute("redirect", request.getContextPath() + "/common/project-item.jsp?pid=" + project.id);
    boolean isLoggedIn = session.getAttribute("username") != null;
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
            float percentage = project.getFundingPercentage();
          %>
          <h3>MYR <%=project.getFormattedBackedAmount()%></h3>

          <span>by <%=project.backerNum + (project.backerNum == 1 ? " backer" : " backers")%></span>
          <div class="funding-bar">
            <div class="funding-bar-color" style="<%="width: clamp(0%," + percentage + "%, 100%);"%>"></div>
          </div>
          <p><%=percentage%>% of MYR <%=project.getFormattedFundingGoal()%> goal</p>
          <a href="./back-project.jsp?pid=<%=project.id%>">
            <button class="back-project-button">Back Project</button>
          </a>
        </div>
      </div>
    </div>
    <div>
      <div class="project-item-content">
        <ul class="project-item-details">
          <button
            class="tablinks"
            onclick="openCity(event, 'campaign')"
            <%=!"1".equals(request.getParameter("comment")) ? "id=\"defaultOpen\"" : ""%>
          >
            Campaign
          </button>
          <button class="tablinks" onclick="openCity(event, 'faq')">
            FAQ
          </button>
          <button 
            class="tablinks" 
            onclick="openCity(event, 'comments')"
            <%="1".equals(request.getParameter("comment")) ? "id=\"defaultOpen\"" : ""%>
          >
            Comments
          </button>
          <button class="tablinks" onclick="openCity(event, 'team')">
            Team
          </button>
        </ul>
      </div>
      <%
        String concept = "", prototype = "", production = "", shipping = "";
        Campaign.Status stage = project.campaign.status;
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
          <%=project.campaign.story%>
        </div>
        <div id="faq" class="faq-details tab-content">
          <h3>FAQs</h3>
          <div class="questions-list">
            <%
              ArrayList<Faq> faqs = FaqStore.getInstance().getProjectFaqs(Integer.parseInt(request.getParameter("pid")));
              
              for (Faq faq : faqs)
              {
            %>
            <div class="question">
              <button class="accordion">
                <%=faq.question%>
              </button>
              <div class="panel">
                <p>
                  <%=faq.answer%>
                </p>
              </div>
            </div>
            <%
              }
            %>
          </div>
        </div>
        <div id="comments" class="tab-content">
          <span>
            <%=commentCount + (commentCount == 1 ? " comment" : " comments")%>
            <%
              if (!isLoggedIn)
              	out.write("<a class=\"add-comment\" href=\"sign-in-sign-up.jsp\">Leave a comment</a>");
              else
              	out.write("<button class=\"add-comment\" id=\"add-comment\">Leave a comment</button>");
            %>
          </span>
          <div id="insert-comment" class="insert-comment">
            <!-- insert comments -->
            <div class="insert-comment-content">
              <span class="close">&times;</span>
              <h3>New Comment</h3>
              <form id="new-comment" method="post" action="${pageContext.request.contextPath}/comment">
                <input type="hidden" name="pid" value="<%=project.id%>" />
                <input type="hidden" id="scroll-top-var-1" name="scroll-top">
                <textarea
                  rows="10"
                  cols="50"
                  name="comment"
                  style="font-family: sans-serif; font-size: 1.2em; width: 80%"
                  required
                ></textarea>
                <br/>
                <button type="submit">Submit</button>
              </form>
            </div>
          </div>
          <div>
            <li>
              <div class="comments-list">
                <ul class="comments-list">
                  <%
                    for (Comment parentComment : commentTree.navigableKeySet())
                    {
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
                        <a href="" class="user-link"><%=parentComment.commenterUsername%></a>
                        -
                        <span class="pubdate">posted on <%=parentComment.getFormattedDate()%></span>
                      </header>
                      <p>
                        <%=parentComment.text%>
                      </p>
                      <%
                        if (!isLoggedIn)
                          out.write("<a class=\"add-reply\" href=\"sign-in-sign-up.jsp\">Reply</a>");
                        else
                          out.write("<button class=\"add-reply\" onclick=\"replyPopUp(" + parentComment.id + ")\">Reply</button>");
                      %>
                      
                      <div id="insert-reply" class="insert-comment">
                        <!-- insert comments -->
                        <div class="insert-reply-content">
                          <form id="reply-comment-form" method="post" action="${pageContext.request.contextPath}/reply">
                            <input type="hidden" name="pid" value="<%=project.id%>" />
                            <input type="hidden" id="pcid" name="pcid" value=""/>
                            <input type="hidden" class="scroll-top-var-2" name="scroll-top">
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
                                    required
                            ></textarea>
                            <br />
                            <button type="submit">Submit</button>
                          </form>
                        </div>
                      </div>
                    </div>
                    <ul class="comments-list children">
                      <%
                        for (Comment childComment : commentTree.get(parentComment))
                        {
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
                            <a href="" class="user-link"><%=childComment.commenterUsername%></a>
                            -
                            <span class="pubdate">posted on <%=childComment.getFormattedDate()%></span>
                          </header>
                          <p>
                            <%=childComment.text%>
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
            ArrayList<Perk> projectPerks = PerkStore.getInstance().getPerkForProject(project.id);
            for (Perk perk : projectPerks)
            {
          %>
          <a href=""
            ><div class="perk-item">
              <h2>MYR <%=perk.getFormattedPrice()%></h2>
              <h6><%=perk.title%></h6>
              <p><%=perk.description%></p>
              <h5><%=perk.backerNum%> backers</h5>
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
<script>$(document).ready(function()
{
    console.log('scrolling on ready');
    <%="1".equals(request.getParameter("comment")) ? "$('html,body').scrollTop(" + session.getAttribute("scroll_top") + ");" : ""%> 
});
</script>
</html>
