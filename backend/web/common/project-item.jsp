<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
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
    <link rel="stylesheet" href="../styles/project.css" />
    <link rel="stylesheet" href="../styles/project-item.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <div class="header">
      <a href="../index.html" class="logo-container">
        <img class="logo" src="../assets/logo.svg" />
      </a>
      <div class="options">
        <a class="option" href="../common/project.html"> Explore </a>
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
        <a class="option" href="../common/sign-in-sign-up.html"> Sign in </a>
        <div class="dropdown" onclick="toggleProfile()">
          <i class="fa fa-user dropbtn" aria-hidden="true"></i>
          <div class="dropdown-content" id="dropdown-content">
            <div class="account">
              Your Account
              <hr />
              <a href="./my-projects.html">My Projects</a>
              <a href="">Saved Project</a>
              <a href="./profile.html">Profile</a>
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
              <a href="new-project.html" class="add-new-project">
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
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sponsorme", "root", "Kimsy990926");
      Statement stm = conn.createStatement();
      String sql = "select project.project_id, project_name, funding_goal, username, small_description, category, creation_date, team, username, profile_picture_name,  project_status, story\n" +
              "from project left join user\n" +
              "ON project.creator_id = user.user_id\n" +
              "left join campaign\n" +
              "ON project.project_id = campaign.project_id\n" +
              "where project.project_id = 20";
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
            <a href="./back-project.html"
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
          switch (rs.getString("project_status")) {
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
              <div class="question">
                <button class="accordion">
                  Which iPads are compatible with MOFT Float?
                </button>
                <div class="panel">
                  <p>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                    sed do eiusmod tempor incididunt ut labore et dolore magna
                    aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                    ullamco laboris nisi ut aliquip ex ea commodo consequat.
                  </p>
                </div>
              </div>
              <div class="question">
                <button class="accordion">How do I pick the size?</button>
                <div class="panel">
                  <p>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                    sed do eiusmod tempor incididunt ut labore et dolore magna
                    aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                    ullamco laboris nisi ut aliquip ex ea commodo consequat.
                  </p>
                </div>
              </div>
              <div class="question">
                <button class="accordion">
                  How high does MOFT Float raise the iPad screen?
                </button>
                <div class="panel">
                  <p>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                    sed do eiusmod tempor incididunt ut labore et dolore magna
                    aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                    ullamco laboris nisi ut aliquip ex ea commodo consequat.
                  </p>
                </div>
              </div>
              <div class="question">
                <button class="accordion">
                  How much does MOFT Float weigh?
                </button>
                <div class="panel">
                  <p>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                    sed do eiusmod tempor incididunt ut labore et dolore magna
                    aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                    ullamco laboris nisi ut aliquip ex ea commodo consequat.
                  </p>
                </div>
              </div>
              <div class="question">
                <button class="accordion">What is MOFT Float made of?</button>
                <div class="panel">
                  <p>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                    sed do eiusmod tempor incididunt ut labore et dolore magna
                    aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                    ullamco laboris nisi ut aliquip ex ea commodo consequat.
                  </p>
                </div>
              </div>
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
                          <a href="" class="user-link">Username</a>
                          -
                          <span class="pubdate">posted on 28/2/2020</span>
                        </header>
                        <p>
                          Lorem ipsum dolor sit amet, consectetur adipisicing
                          elit, sed do eiusmod tempor incididunt ut labore et
                          dolore magna aliqua. Ut enim ad minim veniam, quis
                          nostrud exercitation ullamco laboris nisi ut aliquip
                          ex ea commodo consequat.
                        </p>
                        <button class="add-reply" onclick="replyPopUp()">
                          Reply
                        </button>
                      </div>
                      <ul class="comments-list children">
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
                              <a href="" class="user-link">Username</a>
                              -
                              <span class="pubdate"></span>
                            </header>
                            <p>
                              Lorem ipsum dolor sit amet, consectetur
                              adipisicing elit, sed do eiusmod tempor incididunt
                              ut labore et dolore magna aliqua. Ut enim ad minim
                              veniam, quis nostrud exercitation ullamco laboris
                              nisi ut aliquip ex ea commodo consequat.
                            </p>
                          </div>
                          <ul class="comments-list children">
                            <li class="comment">
                              <div class="avatar"></div>
                              <div class="comment-content"></div>
                              <ul class="comments-list children"></ul>
                            </li>
                          </ul>
                        </li>
                      </ul>
                    </li>
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
                          <a href="" class="user-link">Username</a>
                          -
                          <span class="pubdate">posted on 28/2/2020</span>
                        </header>
                        <p>
                          Lorem ipsum dolor sit amet, consectetur adipisicing
                          elit, sed do eiusmod tempor incididunt ut labore et
                          dolore magna aliqua. Ut enim ad minim veniam, quis
                          nostrud exercitation ullamco laboris nisi ut aliquip
                          ex ea commodo consequat.
                        </p>
                        <button class="add-reply" onclick="replyPopUp()">
                          Reply
                        </button>
                      </div>
                      <ul class="comments-list children">
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
                              <a href="" class="user-link">Username</a>
                              -
                              <span class="pubdate"></span>
                            </header>
                            <p>
                              Lorem ipsum dolor sit amet, consectetur
                              adipisicing elit, sed do eiusmod tempor incididunt
                              ut labore et dolore magna aliqua. Ut enim ad minim
                              veniam, quis nostrud exercitation ullamco laboris
                              nisi ut aliquip ex ea commodo consequat.
                            </p>
                          </div>
                          <ul class="comments-list children">
                            <li class="comment">
                              <div class="avatar"></div>
                              <div class="comment-content"></div>
                              <ul class="comments-list children"></ul>
                            </li>
                          </ul>
                        </li>
                      </ul>
                    </li>
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
                          <a href="" class="user-link">Username</a>
                          -
                          <span class="pubdate">posted on 28/2/2020</span>
                        </header>
                        <p>
                          Lorem ipsum dolor sit amet, consectetur adipisicing
                          elit, sed do eiusmod tempor incididunt ut labore et
                          dolore magna aliqua. Ut enim ad minim veniam, quis
                          nostrud exercitation ullamco laboris nisi ut aliquip
                          ex ea commodo consequat.
                        </p>
                        <button class="add-reply" onclick="replyPopUp()">
                          Reply
                        </button>
                      </div>
                      <ul class="comments-list children">
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
                              <a href="" class="user-link">Username</a>
                              -
                              <span class="pubdate"></span>
                            </header>
                            <p>
                              Lorem ipsum dolor sit amet, consectetur
                              adipisicing elit, sed do eiusmod tempor incididunt
                              ut labore et dolore magna aliqua. Ut enim ad minim
                              veniam, quis nostrud exercitation ullamco laboris
                              nisi ut aliquip ex ea commodo consequat.
                            </p>
                          </div>
                          <ul class="comments-list children">
                            <li class="comment">
                              <div class="avatar"></div>
                              <div class="comment-content"></div>
                              <ul class="comments-list children"></ul>
                            </li>
                          </ul>
                        </li>
                      </ul>
                    </li>
                  </ul>
                </div>
              </li>
            </div>
          </div>
<%--          <div id="team" class="tab-content">--%>
<%--            <h3>About</h3>--%>
<%--            <p>--%>
<%--              Short description of the team <br />--%>
<%--              MOFT stands for “Mobile Office for Travelers”. <br /><br />We--%>
<%--              design innovative, easy-to-use productivity accessories enabling--%>
<%--              people to be more efficient with less equipment via unique, smart--%>
<%--              design. <br /><br />MOFT aims to transform individuals' devices to--%>
<%--              work their way, giving them the ability to explore life’s--%>
<%--              adventures while maintaining their productivity. <br /><br />We--%>
<%--              make the world your office.--%>
<%--            </p>--%>
<%--            <h3>Team</h3>--%>
<%--            <div class="team-members">--%>
<%--              <div class="member">--%>
<%--                <img--%>
<%--                  src="../assets/project-categories-header-image/all.jpg"--%>
<%--                  alt=""--%>
<%--                  width="300"--%>
<%--                  height="300"--%>
<%--                />--%>
<%--                <p>Kim Sheng Yong</p>--%>
<%--              </div>--%>
<%--              <div class="member">--%>
<%--                <img--%>
<%--                  src="../assets/project-categories-header-image/all.jpg"--%>
<%--                  alt=""--%>
<%--                  width="300"--%>
<%--                  height="300"--%>
<%--                />--%>
<%--                <p>Kim Sheng Yong</p>--%>
<%--              </div>--%>
<%--              <div class="member">--%>
<%--                <img--%>
<%--                  src="../assets/project-categories-header-image/all.jpg"--%>
<%--                  alt=""--%>
<%--                  width="300"--%>
<%--                  height="300"--%>
<%--                />--%>
<%--                <p>Kim Sheng Yong</p>--%>
<%--              </div>--%>
<%--            </div>--%>
<%--            <div>--%>
<%--              <h3>Contact</h3>--%>
<%--              <p>Email: absdf@gmail.com</p>--%>
<%--            </div>--%>
<%--          </div>--%>
          <%=rs.getString("team")%>
          <div class="perks-items">
            <h3>Select a Perk</h3>
            <a href="https://www.google.com/"
              ><div class="perk-item">
                <h2>MYR 139</h2>
                <h6>MOFT Float - Early Bird</h6>
                <p>You will get Moft Float x 1</p>
                <h6>Estimated Delivery</h6>
                <h5>10 backers</h5>
              </div></a
            >
            <a href="https://www.google.com/"
              ><div class="perk-item">
                <h2>MYR 139</h2>
                <h6>MOFT Float - Early Bird</h6>
                <p>You will get Moft Float x 1</p>
                <h6>Estimated Delivery</h6>
                <h5>10 backers</h5>
              </div></a
            >
            <a href="https://www.google.com/"
              ><div class="perk-item">
                <h2>MYR 139</h2>
                <h6>MOFT Float - Early Bird</h6>
                <p>You will get Moft Float x 1</p>
                <h6>Estimated Delivery</h6>
                <h5>10 backers</h5>
              </div></a
            >
            <a href="https://www.google.com/"
              ><div class="perk-item">
                <h2>MYR 139</h2>
                <h6>MOFT Float - Early Bird</h6>
                <p>You will get Moft Float x 1</p>
                <h6>Estimated Delivery</h6>
                <h5>10 backers</h5>
              </div></a
            >
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
