<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="sponsorme.Credentials" %>
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
    <link rel="stylesheet" href="../styles/project.css" />
    <link rel="stylesheet" href="../styles/project-item.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <div class="header">
      <a href="../index.jsp" class="logo-container">
        <img class="logo" src="../assets/logo.svg" />
      </a>
      <div class="options">
        <a class="option" href="../common/project.jsp"> Explore </a>
        <div class="option">
          <input
            type="text"
            class="search-bar"
            placeholder="Search.."
            name="search"
          />
          <button type="submit" class="search-button">
            <i class="fa fa-search"></i>
          </button>
        </div>
        <a class="option" href="../common/sign-in-sign-up.jsp"> Sign in </a>
        <div class="dropdown" onclick="toggleProfile()">
          <i class="fa fa-user dropbtn" aria-hidden="true"></i>
          <div class="dropdown-content" id="dropdown-content">
            <div class="account">
              Your Account
              <hr />
              <a href="./my-projects.jsp">My Projects</a>
              <a href="">Saved Project</a>
              <a href="./profile.jsp">Profile</a>
              <a href="">Settings</a>
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
              <a href="new-project.jsp" class="add-new-project">
                &#43; Add New Project
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </head>
  <body>
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conn = DriverManager.getConnection(Credentials.URL, Credentials.USER, Credentials.PASSWORD);
      Statement stm = conn.createStatement();
      String sql = "select project.project_id, project_name, funding_goal, username, small_description, category, creation_date, team, username, profile_picture_name,  project_status, story\n" +
              "from project left join user\n" +
              "ON project.creator_id = user.user_id\n" +
              "left join campaign\n" +
              "ON project.project_id = campaign.project_id\n" +
              "where project.project_id = " + request.getParameter("pid");
      ResultSet rs = stm.executeQuery(sql);
      rs.next();
    %>
    <div class="project-item">
      <div class="project-item-info">
        <div class="image-slider">
          <img
            class="heading-image"
            src="../assets/project-moft-image/moftFloatImage 1.png"
            alt=""
          />
        </div>
        <div class="project-item-description-header">
          <h1><%=rs.getString("project_name")%></h1>
          <p>
            <%=rs.getString("small_description")%>
          </p>
          <h6>Created by <%=rs.getString("username")%></h6>
          <div class="funding-details">
            <h3>MYR 40,000</h3>
            <span>by 349 backers</span>
            <div class="funding-bar">
              <div class="funding-bar-color"></div>
            </div>
            <p>50% of MYR <%=rs.getString("funding_goal")%> goal</p>
            <a href="./back-project.jsp"
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
          String concept="", prototype = "", production="", shipping="";
          String stage = rs.getString("project_status");
          if(stage != null){
              switch (stage) {
                  case "concept":
                      concept = "-done";
                      break;
                  case "prototype":
                      prototype = "-done";
                      break;
                  case "production":
                      production = "-done";
                      break;
                  case "shipping":
                      shipping = "-done";
                      break;
                  default:
                      break;
              }
          }

        %>
        <div class="details-container">
          <div class="project-item-progress">
            <!-- <img src="../assets/project-moft-image/progress_bar.svg" alt="" /> -->
            <div class="project-item-container">
              <img
                class="progress-item concept"
                src="../assets/project-moft-image/concept<%=concept%>.svg"
                alt=""
              />
              <p>Concept</p>
            </div>
            <div class="project-item-container">
              <img
                class="progress-item prototype"
                src="../assets/project-moft-image/prototype<%=prototype%>.svg"
                alt=""
              />
              <p>Prototype</p>
            </div>
            <div class="project-item-container">
              <img
                class="progress-item production"
                src="../assets/project-moft-image/production<%=production%>.svg"
                alt=""
              />
              <p>Production</p>
            </div>
            <div class="project-item-container">
              <img
                class="progress-item shipping"
                src="../assets/project-moft-image/shipping<%=shipping%>.svg"
                alt=""
              />
              <p>Shipping</p>
            </div>
          </div>
          <div id="campaign" class="campaign-details tab-content">
            <%=rs.getString("story")%>
          </div>
          <div id="faq" class="faq-details tab-content">
            <h3>FAQs</h3>
            <div class="questions-list">
              <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn2 = DriverManager.getConnection(Credentials.URL, Credentials.USER, Credentials.PASSWORD);
                Statement stm2 = conn2.createStatement();
                String sql2 = "select * from faq\n" +
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
                <textarea
                  rows="10"
                  cols="50"
                  name="comment"
                  form="usrform"
                  style="font-family: sans-serif; font-size: 1.2em; width: 80%"
                ></textarea>
                <br />
                <input id="submitComment" type="submit" value="Submit" />
              </div>
            </div>
            <div>
              <li>
                <div class="comments-list">
                  <ul class="comments-list">
                    <%
                      Class.forName("com.mysql.jdbc.Driver");
                      Connection conn3 = DriverManager.getConnection(Credentials.URL, Credentials.USER, Credentials.PASSWORD);
                      Statement stm3 = conn3.createStatement();
                      String sql3 = "select  comment_id, comment.user_id, comment, parent_comment, comment_date as cd, username, profile_picture_name\n" +
                              "from comment left join user\n" +
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
                          src="../assets/project-categories-header-image/all.jpg"
                          alt="AvatarPic"
                          width="55"
                          height="55"
                        />
                      </div>
                      <div class="comment-content">
                        <header class="comment-content-header">
                          <a href="" class="user-link"><%=rs3.getString("username")%></a>
                          -
                          <span class="pubdate">posted on <%=rs3.getDate("cd")%></span>
                        </header>
                        <p>
                          <%=rs3.getString("comment")%>
                        </p>
                        <button class="add-reply" onclick="replyPopUp()">
                          Reply
                        </button>
                      </div>
                      <ul class="comments-list children">
                        <%

                          Class.forName("com.mysql.jdbc.Driver");
                          Connection conn4 = DriverManager.getConnection(Credentials.URL, Credentials.USER, Credentials.PASSWORD);
                          Statement stm4 = conn4.createStatement();
                          String sql4 = "select comment_id, comment.user_id, comment, parent_comment, comment_date as cds, username, profile_picture_name\n" +
                                  "from comment left join user\n" +
                                  "on comment.user_id = user.user_id\n" +
                                  "where project_id="+ request.getParameter("pid")+" and parent_comment is not null and parent_comment = " + pcid;
                          ResultSet rs4 = stm4.executeQuery(sql4);
                          while(rs4.next()){
                        %>
                        <li class="comment">
                          <div class="avatar">
                            <img
                              src="../assets/project-categories-header-image/all.jpg"
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
            <%=rs.getString("team")%>
          </div>

          <div class="perks-items">
            <h3>Select a Perk</h3>
            <%
              Class.forName("com.mysql.jdbc.Driver");
              Connection conn5 = DriverManager.getConnection(Credentials.URL, Credentials.USER, Credentials.PASSWORD);
              Statement stm5 = conn5.createStatement();
              String sql5 = "select p.perk_id, title, price, description, count(*) as backerCount\n" +
                      "from perk as p left join backed_project as bp\n" +
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
  <footer>
    <div class="footer">
      <div class="footer-item-container">
        <div class="menu-items">
          <div class="menu-item">
            <img class="icon" src="../assets/footer-image/Home.svg" />
            <span>Home</span>
          </div>
          <div class="menu-item">
            <img class="icon" src="../assets/footer-image/Projects.svg" />
            <span>Projects</span>
          </div>
          <div class="menu-item">
            <img class="icon" src="../assets/footer-image/Account.svg" />
            <span>Account</span>
          </div>
          <div class="menu-item">
            <img class="icon" src="../assets/footer-image/Help.svg" />
            <span>Help</span>
          </div>
        </div>
        <div class="description">
          <p>Created by Kenneth Tan, Kim Sheng Yong, Chua Tuan Hong</p>
          <p class="copyright">Sponsor.me © 2020</p>
          <p class="tnc">Terms of Service - Privacy Policy</p>
        </div>
      </div>
    </div>
  </footer>
  <c:set var="context" value="${pageContext.request.contextPath}" />
<%--  JavascriptContext.includeLib("../js/project-item.js", FacesContext.getCurrentInstance());--%>
  <script type="text/javascript" language="JavaScript">
    document.getElementById('campaign').click();
    function openCity(event, sectionName) {
      var i, tabcontent, tablinks;
      tabcontent = document.getElementsByClassName('tab-content');
      for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = 'none';
      }
      tablinks = document.getElementsByClassName('tablinks');
      for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(' active', '');
      }
      document.getElementById(sectionName).style.display = 'block';
      event.currentTarget.className += ' active';
    }

    //accordion
    var acc = document.getElementsByClassName('accordion');
    var i;

    for (i = 0; i < acc.length; i++) {
      acc[i].addEventListener('click', function () {
        this.classList.toggle('active');
        var panel = this.nextElementSibling;
        if (panel.style.display === 'block') {
          panel.style.display = 'none';
        } else {
          panel.style.display = 'block';
        }
      });
    }

    //comment box
    let commentBox = document.getElementById('insert-comment');
    let addCommentBtn = document.getElementById('add-comment');
    let closeBtn = document.getElementsByClassName('close')[0];
    let submitComment = document.getElementById('submitComment');

    addCommentBtn.onclick = function () {
      commentBox.style.display = 'block';
    };
    closeBtn.onclick = function () {
      console.log('closebtn triggered');
      commentBox.style.display = 'none';
    };
    submitComment.onclick = function () {
      console.log('closebtn triggered');
      commentBox.style.display = 'none';
    };
    //click outside windows to close it
    window.onclick = function (event) {
      if (event.target == commentBox) {
        commentBox.style.display = 'none';
      }
    };
    function replyPopUp() {
      commentBox.style.display = 'block';
    }

  </script>
  <script>
    document.getElementById('defaultOpen').click();
  </script>
  <script type="text/javascript"  language="JavaScript">
    let dropdownContent = document.getElementById('dropdown-content');
    let dropdown = document.getElementsByClassName('dropbtn')[0];

    window.onclick = function (event) {
      if (
              event.target !== dropdownContent &&
              event.target !== dropdown &&
              dropdownContent.style.display === 'block'
      ) {
        console.log('close');
        dropdownContent.style.display = 'none';
        dropdown.style.backgroundColor = '#f1f1f1';
      }
    };
    function toggleProfile() {
      console.log('pressed');
      if (document.getElementById('dropdown-content').style.display != 'block') {
        document.getElementById('dropdown-content').style.display = 'block';
        document.getElementsByClassName('dropdown')[0].style.backgroundColor =
                '#FF8A65';
      } else {
        document.getElementById('dropdown-content').style.display = 'none';
        document.getElementsByClassName('dropdown')[0].style.backgroundColor =
                '#f1f1f1';
      }
    }
  </script>
</html>
